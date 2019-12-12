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

""" [train_agents] is the master function for reproducing a generation 
    to create a new one. """
def train_agents(data_path): 
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
    was invalid and agent[st][move] is zeroed. """
def run_state(agent_name, st):
    global LAST_STATE
    global LAST_MOVE
    agent = AGENT_DICT[agent_name]
    if LAST_STATE == st: # Last move was invalid: 
        agent[st][LAST_MOVE] = 0
        agent[st] = Agent.normalize(agent[st])
    if st not in agent: 
        agent[st] = Agent.perturb(agent['null'].copy())
    pmf = agent[st]
    # print(np.reshape(agent[st].shape, NUM_OF_CHOICES))
    print(np.array(pmf).shape)
    move = np.random.choice(np.arange(NUM_OF_CHOICES), pmf)
    LAST_STATE = st
    LAST_MOVE = move
    return move

NUM_OF_CHOICES = 52
LAST_STATE = "0"
LAST_MOVE = None

path = 'Data'
gen0_dict = {"0_0" : {"null":np.zeros(NUM_OF_CHOICES)}, "0_1" : {"null":np.ones(NUM_OF_CHOICES)}}
np.savez(path+"/Parents/"+"Gen0.npz", **gen0_dict)
AGENT_DICT = train_agents("Data")
run_state("1_0", "1")
