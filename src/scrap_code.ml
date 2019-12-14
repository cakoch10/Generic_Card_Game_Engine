(* output valid move list *)
      (* ---------------------- *)
      let oc = open_out_gen [Open_append; Open_creat] 0o666 "log.txt" in
      let str_moves = 
        List.fold_left (fun s m -> s^"\n"^(command_to_string m)) "" valids in 
      Printf.fprintf oc "%s\n" str_moves;
      close_out oc;
      (* ---------------------- *)