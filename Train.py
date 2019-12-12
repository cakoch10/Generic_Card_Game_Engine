import numpy as np
import Agent
import os
import os.path
import itertools
import copy

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

""" [load_generation] creates a dictionary of the npz file of a previously
    created generation found as [path/]Gen[gen].npz"""
def load_generation(path, gen):
    parent_dict = {}
    load_path = path+"Gen"+str(gen)+".npz"
    gen_npz = np.load(load_path, allow_pickle=True)
    for parent_name in gen_npz.keys():
        parent_dict[parent_name] = gen_npz[parent_name].item()
    return parent_dict #[load_parents] and [load_generation] should return same format

""" [save_children] saves the generation of agents [child_dict] as an npz
    file in [save_path]. """
def save_children(save_path, child_dict):
    # save_path = path
    print(child_dict)
    np.savez(save_path+"Gen1", **child_dict)
    # for child_name in child_dict.keys():
    #     child_agent = child_dict[child_name]
    #     np.savez(save_path+child_name, child_agent)

""" [reproduction] is the master function for reproducing a generation 
    to create a new one. """
def reproduction(data_path): 
    parent_dict = load_generation(data_path+"/Parents/", 0)
    gen = 1 # TODO: Figure out how to read generation
    i = 0
    child_dict = {}
    for (p1_name, p2_name) in itertools.product(parent_dict.keys(), parent_dict.keys()):
        p1 = parent_dict[p1_name]
        p2 = parent_dict[p2_name]
        print(p1)
        child_list = Agent.meiosis(p1, p2, Agent.merge_element, Agent.merge_choose)
        for child_agent in child_list:
            name = str(gen) + '_' + str(i)
            i+=1
            child_dict[name] = child_agent
    save_children(data_path+"/Children/", child_dict)
    return child_dict

""" Returns a move based on agent [agent_name] and the state [st]. 
    If the state is not in the agent's domain, it is added with the value of
    the perturbed null state value. 
    If the state is the same as the previous one, then know the last move
    was invalid and agent[st][move] is zeroed. 

    These are done now rather than when the agent has been evaluated since it 
    can slow down evaluation if invalid or unknown states are constantly 
    needed to be handled.  
    """
def run_state(agent_name, st, prev_st=None, prev_move=None):
    agent = AGENT_DICT[agent_name]
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
def play_game(a1, a2):
    return True, (1, 0) #placeholder

""" [eval_generation] takes a generation of recently born children, and
    pits them against each other, in order to determine the strongest of
    the offspring. """
def eval_generation(gen_dict):
    children = gen_dict.values()
    N = len(children)
    child_idx_arr = np.arange(N)
    matchings = itertools.product(child_idx_arr, child_idx_arr)
    scoreboard = np.zeros(N, dtype=np.int8).tolist()
    point_diff = np.zeros(N).tolist()
    for c1, c2 in matchings:
        if c1 == c2: 
            continue
        winner_bool, scores = play_game(gen_dict[c1], gen_dict[c2])
        # Handle metric by which to evaluate goodness. 
        winner = c1 if winner_bool else c2
        loser = c2 if winner_bool else c1
        scoreboard[winner] += 1
        point_diff[winner] += abs(scores[1] - scores[0])
        point_diff[loser] -= abs(scores[1] - scores[0])
    # Take top 10 or whatever of the children and return their indexes
    winner_list = [0, 1]
    return winner_list

def train(parent_dir):
    # loop over these two commands
    child_dict = reproduction(parent_dir)
    winners = eval_generation(child_dict)


NUM_OF_CHOICES = 52
# LAST_STATE = "0"
# LAST_MOVE = None

path = 'Data'
gen0_dict = {"0_0" : {"null":np.zeros(NUM_OF_CHOICES)}, "0_1" : {"null":np.ones(NUM_OF_CHOICES)}}
np.savez(path+"/Parents/"+"Gen0.npz", **gen0_dict)
AGENT_DICT = train_agents("Data")
move = run_state("1_0", "1", "0", 0)
print(move)
