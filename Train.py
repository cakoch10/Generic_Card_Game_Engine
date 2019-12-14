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
game_directory = "./games/"


# def merge_element(v1, v2):
#     return v1 * v2

# """ """
# def load_parents(load_path):
#     parent_dict = {}
#     for parent_dir in os.listdir(load_path):
#         if parent_dir == ".DS_Store": 
#             continue
#         parent_agent = np.load(load_path + parent_dir, allow_pickle=True)
#         name = parent_dir[:-4]
#         parent_dict[name] = parent_agent
#     return paren

""" Helper for load_generation_json. Turns agent's pmfs into np array"""
def numpyify_agent(agent):
    for k in agent.keys():
        agent[k] = np.array(agent[k])

""" Helper for save_children_json. Turns agent's pmfs into python lists. """
def listify_agent(agent):
    for k in agent.keys(): 
        agent[k] = agent[k].tolist()

""" [load_generation] creates a dictionary of the npz file of a previously
    created generation found as [path/]Gen[gen].npz"""
def load_generation_json(load_path, gen):
    parent_list = []
    # load_path = path+"Gen"+str(gen)+'/'
    num_files = len(os.listdir(load_path))
    for i in range(num_files):
        name = load_path + str(i) + ".json"
        with open(name, 'r') as fp:
            agent = json.load(fp)
            numpyify_agent(agent)
            parent_list.append(agent)
    return parent_list

""" [save_children] saves the generation of agents [child_dict] as an npz
    file in [save_path]. """
def save_children_json(save_path, child_list):
    print(child_list)
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
    parent_list = load_generation_json(data_path+"/Gen"+str(gen)+'/', gen)
    parent_idx = np.arange(len(parent_list))
    child_list = []
    for (p1_i, p2_i) in itertools.product(parent_idx, parent_idx):
        p1 = parent_list[p1_i]
        p2 = parent_list[p2_i]
        children_e = Agent.meiosis(p1, p2, Agent.merge_element)
        children_c = Agent.meiosis(p1, p2, Agent.merge_choose)
        child_list = children_e + children_c 
    save_children_json(data_path+"/Gen"+str(gen+1)+"/", child_list)
    return child_list

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
    # agent = AGENT_DICT[agent_name]
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
def play_game(a1, a2, game):
    process = Popen("/bin/bash", stdin=PIPE, stdout=PIPE, stderr=PIPE)
    commands = "cd src && make play_ai" + "\n"
    commands += os.path.join(game_directory, game) + ";" + a1 + ";" + a2
    out, err = process.communicate(commands.encode('utf-8'))
    if err:
        print("Error in executing command: " + err)
    # wait for result to be written
    result1 = os.path.join(strategy_directory, "1.json")
    result2 = os.path.join(strategy_directory, "2.json")
    while not (os.path.exists(result1) or os.path.exists(result2)):
        time.sleep(0.5)
    if os.path.isfile(result1):
        return True, result1
    else:
        return False, result2

""" [eval_generation] takes a generation of recently born children, and
    pits them against each other, in order to determine the strongest of
    the offspring. """
def eval_generation(gen_list):
    children = gen_list
    N = len(children)
    child_idx_arr = np.arange(N)
    matchings = itertools.product(child_idx_arr, child_idx_arr)
    scoreboard = np.zeros(N, dtype=np.int8).tolist()
    point_diff = np.zeros(N).tolist()
    for c1, c2 in matchings:
        if c1 == c2: 
            continue
        winner_bool, scores = play_game(gen_list[c1], gen_list[c2])
        # Handle metric by which to evaluate goodness. 
        winner = c1 if winner_bool else c2
        loser = c2 if winner_bool else c1
        scoreboard[winner] += 1
        point_diff[winner] += abs(scores[1] - scores[0])
        point_diff[loser] -= abs(scores[1] - scores[0])
    # Take top 10 or whatever of the children and return their indexes
    winner_list = [0, 1]
    return winner_list

""" trains the model """
def train(parent_dir):
    # loop over these two commands
    gen = 0
    child_dict = reproduction(parent_dir, gen)
    winners = eval_generation(child_dict)


NUM_OF_CHOICES = 52
# LAST_STATE = "0"
# LAST_MOVE = None

path = 'Data'
# gen0_dict = {"0_0" : {"null":np.zeros(NUM_OF_CHOICES)}, "0_1" : {"null":np.ones(NUM_OF_CHOICES)}}
# np.savez(path+"/Parents/"+"Gen0.npz", **gen0_dict)
gen0_list = [{"null":np.zeros(NUM_OF_CHOICES)}, {"null":np.ones(NUM_OF_CHOICES)}]
save_children_json("Data/Gen0/", gen0_list)
train(path)
# AGENT_DICT = train("Data")
# move = run_state("1_0", "1", "0", 0)
# print(move)
