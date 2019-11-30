## Agent Class

An agent is an AI that plays a given card game by some intrinsic ruleset, encoded as a dictionary with gamestate hashes as keys and probability mass functions as keys. Each PMF (p_i) is a discrete probability distribution vector over all decision space, where each possible move is assigned some float value between 0 and 1, and determines the agent's penchant for each move when it encounters a given state st_i. 

Given that there are an enormous number of possible game states, and we cannot encode a specific PMF for each possible game state to begin with, each agent A_i has a defined "Null PMF" (N_{Ai}) which is a default probability vector that it can "fall back" to if it delves into uncharted territory in state space. **If an agent ends up needing to use its Null decision vector, the game state is encoded into its ruleset, with a perturbed version of its Null decision vector as its value.** 

## Decision Vectors (PMFs)

When any decision vector is "perturbed", a random assortment of elements in the vector are chosen (determined by the *choosing probability* p_c) each of which is given an equal chance to be increased or decreased by a small amount (the *perturbation amount* x_p). 

Since each decision vector is a probability mass function, the sum of its elements must add to 1. Thus, any merger or perturbation we operate upon a decision vector must be followed by a renormalization operation, which ensures the sum of the elements adds to 1. In practice, this is simply done by dividing the elements by the total sum of the vector. 

## Meiosis Function:

The **Meiosis Function** is the agent reproduction function ((Agent x Agent) -> Agent Set). It takes two parent agents (P_1, P_2) and creates a class of child agents ({C_i}). Each generation is made up of some number of agents which were the product of executing the meiosis function on a select, high-performing subset of the previous generation. 

Any child of two parent agents must contain the union of the parents' rulesets. The symmetric difference of their rulesets will be passed down with possible perturbations/mutations, but the intersect will require merger between the two parents' decision vectors for each of the gamestates in the intersection. There are two main ways we implement merging. Each child will also inherit a merged form of their parents' null vector as well. 

### Merging

#### Element-wise Multiplication Merging:
The two decision vectors from each parent for a given gamestate are element-wise multiplied. The idea is that if both parents dislike a decision for the gamestate (represented by low probability values for that decision), the product of the probabilities will be low as well. If both parents highly favor a decision for a given gamestate (represented by probabilities close to 1), the product will also be close to 1 and high. This operation is followed by random perturbations to emulate generational mutations, and renormalization. 

#### Randomly Chosen Merging:
For each index of the child's decision vector, the element is chosen from either of the parents' vectors. The advantage of this method over element-wise multiplcation is that the probability of taking one parent's value over another can be adjusted here, so if one parent is more successful than the other, the successful traits can be more heavily weighted, and if that value is key to the parent's success, it isn't contaminated by the other parent's less optimal value. The resulting vector is also perturbed and renormalized. The weighting can also be randomized to ensure more instability in the following generation.

#### In practice: 
Given that each of these methods contains a bit of randomness, each class of children that two parent agents produce can contain multiple children from each merger operation. Since the null vector is an integral part of early generations, multiple children can be created by mixing and matching different ruleset and null vector merger strategies, for instance creating a child where both ruleset and null vector are created from element-wise multiplcation and another where the null vector is created through random choosing. That is, the ruleset and null vector mergers can be independently executed to ensure more instability. 

For each eligible parent that is chosen to reproduce the next generation, a class of children is created between it and every other eligible parent. Each of class of children is of the size *M * N * \sigma_M * \sigma_N*, where M is the number of ways the rulesets are merged, N is the number of ways the null vectors are merged, and \sigma is the *degeneracy* of each, or the number of ways each merger method is repeated. This means for each generation, the number of children produced is **P! * M * N * \sigma_M * \sigma_N**, where P is the number of eligible parents. 