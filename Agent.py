# import random
import numpy as np

class Agent: 
    def __init__(self, gen, name, null_vec=None, vec_len=52):
        self.generation = gen
        self.name = name
        self.state_dict = {}
        if null_vec == None:
            self.null = self.gen_ran(vec_len)
        else: 
            self.null = null_vec

    def __str__(self):
        return "Agent: " + self.name + " Gen: " + str(self.generation)

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

    # UTILITY STATIC METHODS
    @staticmethod
    def normalize(vec):
        return vec/(np.sum(vec))

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
        return self.normalize(vec)


    """ Generates a random vector of length [length]. """
    @staticmethod
    def gen_ran(length):
        return self.normalize(np.random.rand(length))

