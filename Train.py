import numpy as np
import Agent
import os
import os.path
import itertools


def merge_element(v1, v2):
    return v1 * v2

def load_parents(load_path):
    parent_dict = {}
    for parent_dir in os.listdir(load_path):
        if parent_dir == ".DS_Store": 
            continue
        parent_agent = np.load(load_path + parent_dir, allow_pickle=True)
        name = parent_dir[:-4]
        parent_dict[name] = parent_agent
    return parent_dict

def load_generation(path, gen):
    parent_dict = {}
    load_path = path+"Gen"+str(gen)+".npz"
    gen_npz = np.load(load_path, allow_pickle=True)
    for parent_name in gen_npz.keys():
        parent_dict[parent_name] = gen_npz[parent_name].item()
    return parent_dict #[load_parents] and [load_generation] should return same format

def save_children(save_path, child_dict):
    # save_path = path
    print(child_dict)
    np.savez(save_path+"Gen1", **child_dict)
    # for child_name in child_dict.keys():
    #     child_agent = child_dict[child_name]
    #     np.savez(save_path+child_name, child_agent)

def train_agents(path): 
    # parent_dict = load_parents(path+"/Parents/")
    parent_dict = load_generation(path+"/Parents/", 0)

    gen = 1 # TODO: Figure out how to read generation
    i = 0
    child_dict = {}
    for (p1_name, p2_name) in itertools.product(parent_dict.keys(), parent_dict.keys()):
        p1 = parent_dict[p1_name]
        p2 = parent_dict[p2_name]
        print(p1)
        child_list = Agent.meiosis(p1, p2, merge_element, Agent.merge_choose)
        for child_agent in child_list:
            name = str(gen) + '_' + str(i)
            i+=1
            child_dict[name] = child_agent
    save_children(path+"/Children/", child_dict)
    # Eval Children

path = 'Data'
gen0_dict = {"0_0" : {"null":np.zeros(52)}, "0_1" : {"null":np.ones(52)}}
np.savez(path+"/Parents/"+"Gen0.npz", **gen0_dict)
train_agents("Data")
