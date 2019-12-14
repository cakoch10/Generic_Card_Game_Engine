import numpy as np
import Agent
import os
import os.path
import itertools
import copy
import json
from subprocess import Popen, PIPE
import time

# PATH VARIABLES
strategy_directory = "./Data/strategies/"
game_directory = "../games/"
parent_directory = "./Data/Parents/"

""" Helper for load_generation_json. Turns agent's pmfs into np array"""
def numpyify_agent(agent):
    for k in agent.keys():
        agent[k] = np.array(agent[k])

""" Helper for save_children_json. Turns agent's pmfs into python lists. """
def listify_agent(agent):
    for k in agent.keys(): 
        agent[k] = agent[k].tolist()

# def load_parents():
#     parent_list = []
#     # load_path = path+"Gen"+str(gen)+'/'
#     num_files = len(os.listdir(parent_directory))
#     for i in range(num_files):
#         name = load_path + str(i) + ".json"
#         with open(name, 'r') as fp:
#             agent = json.load(fp)
#             numpyify_agent(agent)
#             parent_list.append(agent)
#     return parent_list

""" [load_generation] creates a dictionary of the npz file of a previously
    created generation found as [path/]Gen[gen].npz"""
def load_generation_json(load_path, gen=0):
    parent_list = []
    # load_path = path+"Gen"+str(gen)+'/'
    num_files = len(os.listdir(load_path))
    # print(os.listdir(load_path))
    for i in range(num_files-1):
        name = load_path + str(i) + ".json"
        with open(name, 'r') as fp:
            agent = json.load(fp)
            numpyify_agent(agent)
            parent_list.append(agent)
    return parent_list

""" [save_children] saves the generation of agents [child_dict] as an npz
    file in [save_path]. """
def save_children_json(save_path, child_list):
    # print(child_list)
    try: 
        os.mkdir(save_path)
    except FileExistsError: 
        T = 0
    for i, agent, in enumerate(child_list):
        name = save_path + str(i) + ".json"
        with open(name, 'w') as fp:
            listify_agent(agent)
            json.dump(agent, fp)

""" [reproduction] is the master function for reproducing a generation 
    to create a new one. [data_path] is the Data folder"""
def reproduction(data_path="Data", gen=0): 
    parent_list = load_generation_json(parent_directory)
    parent_idx = np.arange(int(len(parent_list)))
    child_list = []
    # print(len(parent_list))
    # matchings = np.random.choice(parent_idx, size=(len(parent_list)//2, 2), replace=False)
    # matchings = matchings.tolist() + np.random.choice(parent_idx, size=(len(parent_list), 2), replace=True).tolist()
    # print(matchings)
    # for p1_i, p2_i in matchings: 
    for (p1_i, p2_i) in itertools.product(parent_idx, parent_idx):
        p1 = parent_list[p1_i]
        p2 = parent_list[p2_i]
        children_e = Agent.meiosis(p1, p2, Agent.merge_element)
        children_c = Agent.meiosis(p1, p2, Agent.merge_choose)
        child_list = child_list + children_e + children_c 
    save_children_json(data_path+"/Gen"+str(gen+1)+"/", child_list)
    print(gen, len(child_list))
    return len(child_list)

""" Returns a move based on agent [agent_name] and the state [st]. 
    If the state is not in the agent's domain, it is added with the value of
    the perturbed null state value. 
    If the state is the same as the previous one, then know the last move
    was invalid and agent[st][move] is zeroed. 

    These are done now rather than when the agent has been evaluated since it 
    can slow down evaluation if invalid or unknown states are constantly 
    needed to be handled.  
    """
def run_state(agent, st, prev_st=None, prev_move=None):
    if prev_st == st and prev_move is not None: # Last move was invalid (state didn't change): 
        agent[st][prev_move] = 0
        agent[st] = Agent.normalize(agent[st])
    if st not in agent: # [st] is in agent's null space, and needs to be added to domain
        agent[st] = Agent.perturb(agent['null'].copy())
    pmf = agent[st]
    move = np.random.choice(np.arange(NUM_OF_CHOICES), p=pmf)
    return move
    
""" [play_game] handles playing [a1] and [a2] against each other. 
    [a1] and [a2] are both strategies, NOT indexes. 

    Returns True if a1 wins, False if a2 wins, and a tuple of their scores"""
def play_game(a1, a2, game, agent_directory):
    # print(agent_directory)
    process = Popen("/bin/bash", stdin=PIPE, stdout=PIPE, stderr=PIPE)
    commands = "cd src && make play_ai" + "\n"
    a1_dir = agent_directory+str(a1)+".json"
    a2_dir = agent_directory+str(a2)+".json"
    commands += os.path.join(game_directory, game) + ";" + a1_dir + ";" + a2_dir
    out, err = process.communicate(commands.encode('utf-8'))
    if err:
        print("Error in executing command: " + str(err))
    # wait for result to be written
    result1 = os.path.join(strategy_directory, "0.json")
    result2 = os.path.join(strategy_directory, "1.json")
    os.listdir(strategy_directory)
    while not (os.path.exists(result1) or os.path.exists(result2)):
        time.sleep(0.5)
    if os.path.isfile(result1):
        # print("Got result1!")
        return True, result1
    else:
        # print("Got result2!")
        return False, result2

""" [eval_generation] takes a generation of recently born children, and
    pits them against each other, in order to determine the strongest of
    the offspring. Stores strongest to /Data/Parents/"""
def eval_generation(game, agent_directory, N):
    i = 0
    winner_list = []
    while i < N: 
        c1 = i; c2 = i+1
        winner_bool, result = play_game(c1, c2, game, "."+agent_directory)
        # Handle metric by which to evaluate goodness. 
        winner = c1 if winner_bool else c2
        winner_list.append(winner)
        # TODO: Move the winner to Data/Parents/ & delete from /Data/Strategies/
        # TODO: Make sure to rename to new i.json. 
        os.rename(result, parent_directory+str(i//2)+".json")
        i += 2
    # Take top 10 or whatever of the children and return their indexes
    return winner_list

def clear_dir(parent_directory): 
    for file in os.listdir(parent_directory):
        if file != ".DS_Store": 
            os.remove(os.path.join(parent_directory, file))

""" trains the model """
def train(data_dir, game, max_gen=10):
    # loop over these two commands
    gen = 0
    while gen < max_gen:
        gen_size = reproduction(data_dir, gen)
        print("Size of Gen"+str(gen)+':', gen_size)
        child_gen_dir = data_dir+"/Gen"+str(gen+1)+"/"
        # os.rmdir(parent_directory)
        clear_dir(parent_directory)
        winner_list = eval_generation(game, child_gen_dir, gen_size)
        print("Winners of Gen"+str(gen)+":", winner_list)
        # os.rename(parent_directory, data_dir+"/Gen"+str(gen+1)+"/")
        gen+=1

def make_gen0(gen_size): 
    hash_list = [306253, 487054, 169059, 125452, 287134, 343487, 156313, 193547, 69099, 287134, 193547, 169059, 49980]
    gen0_list = []
    for _ in range(gen_size):
        agent = {}
        for each_hash in hash_list:
            agent[each_hash] = Agent.gen_ran(NUM_OF_CHOICES)
        gen0_list.append(agent)
    return gen0_list
    

NUM_OF_CHOICES = 106
path = '../Data'
data_path = './Data'
# gen0_list = [{"0":Agent.perturb(np.zeros(NUM_OF_CHOICES))}, {"0":Agent.normalize(np.ones(NUM_OF_CHOICES))}]
clear_dir(parent_directory)
gen0_list = make_gen0(4)
save_children_json("./Data/Parents/", gen0_list)
train(data_path, "crazy8_ai.json", 5)
# AGENT_DICT = train("Data")
# move = run_state("1_0", "1", "0", 0)
# print(move)
