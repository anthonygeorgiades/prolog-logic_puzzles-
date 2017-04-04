/* four citizens of Cumberworld are sick, all with different illness */
/*all get different herb from different location*/

/*list out all different types of herbs as base clauses*/
herb(bruiseleaf).
herb(silverweed).
herb(thornbloom).
herb(wildroot).

/*repeat declaration of base clauses for all patients, afflictions, locations*/
patient(katricia).
patient(morien).
patient(saradin).
patient(uther).

location(emerald_meadow).
location(haghaven_swamp).
location(kings_woods).
location(northern_cliffs).

affliction(abyss_fever).
affliction(patchfoot).
affliction(sandspots).
affliction(white_chills).

/*write the main predicate*/
solve :-
	herb(KatriciaHerb), herb(MorienHerb), herb(SaradinHerb), herb(UtherHerb),
	all_different([KatriciaHerb, MorienHerb, SaradinHerb, UtherHerb]),

	affliction(KatriciaAffliction), affliction(MorienAffliction), 
	affliction(SaradinAffliction), affliction(UtherAffliction),
	all_different([KatriciaAffliction, MorienAffliction, SaradinAffliction, UtherAffliction]),

	location(KatriciaLocation), location(MorienLocation), 
	location(SaradinLocation), location(UtherLocation),
	all_different([KatriciaLocation, MorienLocation, SaradinLocation, UtherLocation]),

	Quadruples = [ [katricia, KatriciaAffliction, KatriciaLocation, KatriciaHerb],
				   [morien, MorienAffliction, MorienLocation, MorienHerb],
				   [saradin, SaradinAffliction, SaradinLocation, SaradinHerb], 
				   [uther, UtherAffliction, UtherLocation, UtherHerb] ],

	/*The herb used to treat katricia's illness which isn't bruiseleaf can be found only in Emerald Medow*/

	\+ member([katricia, _, _, bruiseleaf], Quadruples),
	member([katricia, _, emerald_meadow, _], Quadruples), 

	/*The herb used to cure Saradin's affliction isn't the one found in King's Wood*/
	\+ member([saradin, _, kings_woods, _], Quadruples),

	/*Morien's illness was easily treated with some silverweed*/
	member([morien, _, _, silverweed], Quadruples), 

	/*Uther was diagnosed with patchfoot which was cured by crushed wildroot*/
	member([uther, patchfoot, _, wildroot], Quadruples),

	/*The herb used to treat sandspots isn't bruiseleaf*/
	\+ member([_, sandspots, _, bruiseleaf], Quadruples),

	/*herb in Hghaven Swamp isn't bruiseleaf is used to cure white chills*/
	member([_, white_chills, haghaven_swamp, _], Quadruples),
	\+ member([_, _, haghaven_swamp, bruiseleaf], Quadruples),



	tell(katricia, KatriciaAffliction, KatriciaLocation, KatriciaHerb), 
	tell(morien, MorienAffliction, MorienLocation, MorienHerb),
	tell(saradin, SaradinAffliction, SaradinLocation, SaradinHerb),
	tell(uther, UtherAffliction, UtherLocation, UtherHerb).

	all_different([H | T]) :- member(H, T), !, fail.
	all_different([_ | T]) :- all_different(T).
	all_different([_]). 

	tell(A, B, C, D) :-
		write('The patient, '), write(A), write(' has the illness '), write(B), 
		write(' which can be treated by '), write(D), write(' which is from '), 
		write(C), write('.'), nl. 


