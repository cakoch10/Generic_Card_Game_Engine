# import random
import numpy as np
import copy

class Agent: 
    def __init__(self, loadpoint=None, decision_dict=None, null_vec=None, gen=None, name=None, vec_len=52):
        if loadpoint is not None: 
            self.decision_dict = np.load(loadpoint)
            self.generation = int(loadpoint[:loadpoint.find('_')])
            self.name = int(loadpoint[loadpoint.find('_')+1:])
            self.null_vec = self.decision_dict["null_vec"]
            del self.decision_dict['null_vec']
        self.generation = gen
        self.name = name
        self.state_dict = decision_dict
        if null_vec == None:
            self.null = self.gen_ran(vec_len)
        else: 
            self.null = null_vec

    def __str__(self):
        return "Agent: " + str(self.name) + " Gen: " + str(self.generation)

    """ Calling the Agent with a state will return the PMF associated with
        the state given [st]. If the state has not been encountered yet, the
        [self.null] PMF will be returned, and [st] will be added to the Agent's
        [self.state_dict] associated with the null PMF (with perturbations)"""
    def __call__(self, st):
        try: 
            pmf = self.state_dict[st]
            return pmf
        except KeyError:
            self.state_dict[st] = self.perturb(self.null)
            return self.null

    # GETTERS AND SETTERS
    def get_data(self):
        return self.state_dict, self.null

    # UTILITY STATIC METHODS
    @staticmethod
    def normalize(vec):
        vec_sum = np.sum(vec)
        if vec_sum == 0:
            return Agent.perturb(vec)
        return vec/vec_sum

    """ Takes [vec] and randomly adds small changes to randomly chosen values (and renorms) """
    @staticmethod
    def perturb(vec, choose_p=0.1, perturb_amt=0.05):
        length = vec.shape[0]
        r_vec = np.random.rand(length)
        i_vec = np.ndarray.flatten(np.argwhere(r_vec < choose_p))
        half_vec = np.random.rand(i_vec.shape[0])
        pos_i = i_vec[np.argwhere(half_vec >= 0.5)]
        neg_i = i_vec[np.argwhere(half_vec < 0.5)]
        vec[pos_i] += perturb_amt
        vec[neg_i] -= perturb_amt
        vec[vec < 0] = 0
        return Agent.normalize(vec)

    """ Generates a random vector of length [length]. """
    @staticmethod
    def gen_ran(length):
        return Agent.normalize(np.random.rand(length))

    """ Stores the Agent's data into [directory]"""
    def save(self, directory):
        filename = str(self.gen) + "_" + str(self.name)
        self.state_dict["null_vec"] = self.null_vec
        np.save(filename, self.state_dict)

""" Returns UNPERTURBED merged vec1 and vec2 through element-wise multiplcation"""
def merge_element(vec1, vec2):
    return (vec1 * vec2)

""" Returns UNPERTURBED merged vec1 and vec2 through random choosing"""
def merge_choose(vec1, vec2):
    half_vec = np.random.rand(vec1.shape[0])
    i_vec1 = np.argwhere(half_vec >= 0.5)
    i_vec2 = np.argwhere(half_vec < 0.5)
    res = np.zeros(vec1.shape[0])
    res[i_vec1] = vec1[i_vec1]
    res[i_vec2] = vec2[i_vec2]
    return (res)

def meiosis(d1, d2, merge_func, null_func, sig_M=1):
    # d1, n1 = a1.get_data()
    # d2, n2 = a2.get_data()
    n1 = d1["null"]
    n2 = d2["null"]
    xor_d = {}
    int_set = set()
    for key in d1:
        if key not in d2:
            xor_d[key] = d1[key]
        else:
            int_set.add(key)
    for key in d2:
        if key not in d1:
            xor_d[key] = d2[key]
    # May want to encapsulate intersection as own function since
    # unperturbed symmetric difference is same for each child.
    res_list = []
    for i in range(sig_M):
        int_d = {}
        for key in int_set:
            merged_vec = merge_func(d1[key], d2[key])
            int_d[key] = Agent.perturb(merged_vec)
        merged_d = {**copy.deepcopy(xor_d), **int_d}
        merged_null = null_func(n1, n2)
        merged_d["null"] = merged_null
        # child = Agent(merged_d, null_vec=merged_null)
        res_list.append(merged_d)
    return res_list
