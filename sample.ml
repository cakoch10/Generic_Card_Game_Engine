type s = {one : int; two : int; lst : bool lazy_t list}

let trans_rec st1 = 
  {st1 with one=2}

let forcemap e = Lazy.force e

let isValid st = 
  let lst = st.lst in
  let forcedlist = List.rev_map forcemap lst in
  List.fold_left (&&) true forcedlist

let printer st = 
  print_string (string_of_bool (isValid st));
  print_string (string_of_bool (isValid (trans_rec st)))

let sample = {one=1; two=2; lst = []}
  
(********)

let anon_maker st s = 
  match s with 
  | "e" -> (fun st -> st.one = st.two)
  | "1" -> (fun st -> st.one = 1)
  | "2" -> (fun st -> st.two = 2)
  | _ -> (fun st -> false)