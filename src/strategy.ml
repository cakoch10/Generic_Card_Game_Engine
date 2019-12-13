type strategy = (int * (float list)) list

let eval_strat (hash:int) (s:strategy) = List.assoc hash s