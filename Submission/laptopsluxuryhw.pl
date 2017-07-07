/* four billionaries of a club all get new custom-made laptop */
/*each laptop from different brand, made of diff material, has diff program, and used for diff game*/

/*list out all different types of billionares as base clauses*/
bill(bread).
bill(dinero).
bill(loote).
bill(moohla).
bill(wamplum).

/*repeat declaration of base clauses for all brands, materials, programs, games*/
brand(apricot).
brand(epoq).
brand(mega).
brand(portal).
brand(vale).

material(diamond).
material(gold).
material(leather).
material(pearl).
material(sable).

program(cashflow).
program(invest).
program(ledger).
program(moneywerx).
program(tycoon).

game(backgammon).
game(hearts).
game(mah_jongg).
game(minesweeper).
game(solitaire).

/*write main predicate*/
solve :-
	brand(BreadBrand), brand(DineroBrand), brand(LooteBrand), brand(MoohlaBrand),
	brand(WamplumBrand), 
	all_different([BreadBrand, DineroBrand, LooteBrand, MoohlaBrand, WamplumBrand]),

	material(BreadMaterial), material(DineroMaterial), material(LooteMaterial), 
	material(MoohlaMaterial), material(WamplumMaterial), 
	all_different([BreadMaterial, DineroMaterial, LooteMaterial, MoohlaMaterial, WamplumMaterial]),

	program(BreadProgram), program(DineroProgram), program(LooteProgram), program(MoohlaProgram),
	program(WamplumProgram),
	all_different([BreadProgram, DineroProgram, LooteProgram, MoohlaProgram, WamplumProgram]),

	game(BreadGame), game(DineroGame), game(LooteGame), game(MoohlaGame), game(WamplumGame),
	all_different([BreadGame, DineroGame, LooteGame, MoohlaGame, WamplumGame]),

	Quintuples = [ [bread, BreadBrand, BreadMaterial, BreadProgram, BreadGame],
				   [dinero, DineroBrand, DineroMaterial, DineroProgram, DineroGame],
				   [loote, LooteBrand, LooteMaterial, LooteProgram, LooteGame],
				   [moohla, MoohlaBrand, MoohlaMaterial, MoohlaProgram, MoohlaGame],
				   [wamplum, WamplumBrand, WamplumMaterial, WamplumProgram, WamplumGame] ],

	/*Person, Brand, Material, Program, Game*/			   
	/*Wamplum owns laptop with a pearlinlaid case which came installed with ledger*/
	member([wamplum, _, pearl, ledger, _], Quintuples),

	/*the mega laptop used to play backgommon*/
	member([_, mega, _, _, backgammon], Quintuples),

	/*owner of the portal laoptop came installed with invest and used mainly to play hearts*/
	member([_, portal, _, invest, hearts], Quintuples),

	/*Mr. Bread Apricot laptop isn't the one that came installed with the Moneywrex*/
	/*which isnt the one installed on the Epoq Laptop*/
	member([bread, apricot, _, _, _], Quintuples),
	\+ member([bread, _, _, moneywerx, _], Quintuples),
	\+ member([_, apricot, _, moneywerx, _], Quintuples),
	\+ member([bread, apricot, _, moneywerx, _], Quintuples),

	\+ member([_, epoq, _, moneywerx, _], Quintuples),

	/*owner of the computer that came with casfhlow isn't playing solitaire*/
	\+ member([_, _, _, cashflow, solitaire], Quintuples),

	/*loote has laptop with sable inlay and play majongg*/
	member([loote, _, sable, _, mah_jongg], Quintuples),

	/*diner's laptop is inlaid with leather*/
	member([dinero, _, leather, _, _], Quintuples),

	/*owner of laptop with diamond inalid casing isn't playing minesweeper*/
	\+ member([_, _, diamond, _, minesweeper], Quintuples),

	/*vale latop has gold case*/
	member([_, vale, gold, _, _], Quintuples), 

	tell(bread, BreadBrand, BreadMaterial, BreadProgram, BreadGame),
	tell(dinero, DineroBrand, DineroMaterial, DineroProgram, DineroGame),
	tell(loote, LooteBrand, LooteMaterial, LooteProgram, LooteGame),
	tell(moohla, MoohlaBrand, MoohlaMaterial, MoohlaProgram, MoohlaGame),
	tell(wamplum, WamplumBrand, WamplumMaterial, WamplumProgram, WamplumGame). 

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]). 
	
tell(A, B, C, D, E) :-
	write('The billionaire, '), write(A), write(' has the brand of laptop '), write(B), 
	write(' with material inlaid of '), write(C), write('. Their laptop has the financial program '), 
	write(D), write(', but they mainly use it for playing '), write(E), write('.'), nl. 











