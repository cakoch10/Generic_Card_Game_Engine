test:
	ocamlbuild -use-ocamlfind tests.byte && ./tests.byte

play:
	ocamlbuild -use-ocamlfind main.byte && ./main.byte
	
clean:
	ocamlbuild -clean

