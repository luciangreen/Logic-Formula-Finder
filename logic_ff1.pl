%% v

%% logic_ff1([[a, 1], [b, 1, 2]],[[a, 1], [b, 1, 2]], [1],F). F = [a, and, b] F = [b, and, a]
%% logic_ff1([[a, true], [b, false]],[[a, true], [b,  false]], [false],F). F = [a, and, b] F = [b, and, a]

/**

?- logic_ff1([[a, true], [b, false],[c,true]],[[a, true], [b,  false],[c,true]], [true],F).
F = [[a, and, c], or, b] 
F = [[a, or, c], or, b] ;
F = [a, or, [b, and, c]] ;
F = [a, or, [b, or, c]] ;
F = [[a, or, b], and, c] ;
F = [a, and, [c, or, b]] ;
F = [not, b] ;
F = [[a, and, b], or, c] ;
F = [[a, or, b], or, c] ;
F = [a, or, [c, and, b]] ;
F = [a, or, [c, or, b]] ;
F = [not, b] ;
F = [not, [b, and, c]] ;
F = [[b, and, c], or, a] ;
F = [[b, or, c], or, a] ;
F = [b, or, [a, and, c]] ;
F = [b, or, [a, or, c]] ;
F = [[b, and, a], or, c] ;
F = [[b, or, a], or, c] ;
F = [b, or, [c, and, a]] ;
F = [b, or, [c, or, a]] ;
F = [[c, or, b], and, a] ;
F = [c, and, [a, or, b]] ;
F = [not, b] ;
F = [[c, and, b], or, a] ;
F = [[c, or, b], or, a] ;
F = [c, or, [a, and, b]] ;
F = [c, or, [a, or, b]] ;
F = [not, b] ;
F = [[c, and, a], or, b] ;
F = [[c, or, a], or, b] ;
F = [c, or, [b, and, a]] ;
F = [c, or, [b, or, a]] ;
F = [not, [b, and, a]] ;
false.

**/
 

logic_ff1(Columns1,Columns2,Result,Formula1) :-
        member(Column,Columns1),
        Column=[Name|_Rest],
        delete(Columns2,Column,Columns3),
	Formula2=Name,
        logic_ff2(Columns1,Columns3,Result,Formula2,Formula3),
	list(Formula3,Formula1).
logic_ff2(_Columns1,[],_Result,Formula,Formula).
logic_ff2(Columns1,Columns2,Result,Formula1,Formula2) :-
	member(Column,Columns2),
	Column=[Name|_Rest],
	delete(Columns2,Column,Columns3),
	appendlogic(Formula1,Name,Formula3),
        logic_ff3(Columns1,Result,Formula3),
	logic_ff2(Columns1,Columns3,Result,Formula3,Formula2).


logic_ff2(Columns1,Columns2,Result,_Formula1,Formula2) :-
	member(Column,Columns2),
	Column=[Name|_Rest],
	delete(Columns2,Column,Columns3),
	appendlogic(%%Formula1,
	Name,
	Formula3),
        logic_ff3(Columns1,Result,Formula3),
	logic_ff2(Columns1,Columns3,Result,Formula3,Formula2).


logic_ff3(Columns1,Result1,[not,Formula2]) :-
        logic_ff3(Columns1,Result3,Formula2),
        not(Result3,[],Result1).


logic_ff3(Columns1,Result1,[Formula1,and,Formula2]) :-
        logic_ff3(Columns1,Result2,Formula1),
        logic_ff3(Columns1,Result3,Formula2),
        and1(Result2,Result3,[],Result1).
logic_ff3(Columns1,Result1,[Formula1,or,Formula2]) :-
        logic_ff3(Columns1,Result2,Formula1),
        logic_ff3(Columns1,Result3,Formula2),
        or(Result2,Result3,Result1).
logic_ff3(Columns,Result1,Formula1) :-
        member([Formula1|Result1],Columns).
appendlogic([Formula1,Operator,Formula2],Name2,Formula3) :-
	appendlogic(Formula1,Name2,Formula4),
	Formula3=[Formula4,Operator,Formula2].




appendlogic([Formula1,Operator,Formula2],Name2,Formula3) :-
        appendlogic(Formula2,Name2,Formula4),
        Formula3=[Formula1,Operator,Formula4].

appendlogic([Operator,Formula2],Name2,Formula3) :-

        appendlogic(Formula2,Name2,Formula4),
        Formula3=[Operator,Formula4].


appendlogic(Formula1,Name,Formula2) :-
	atom(Formula1),append([Formula1],[and,Name],Formula2).
appendlogic(Formula1,Name,Formula2) :-
	atom(Formula1), append([Formula1],[or,Name],Formula2).


appendlogic(F,
%%Name,
Formula2) :-
%%writeln([f,F]),
	%%atom(Formula1), 
	append([],[not,F],Formula2).


unique1(_Remainders,[],UniqueRemainders,UniqueRemainders) :- !.
unique1(Remainders1,Remainder,UniqueRemainders1,UniqueRemainders2) :-
	delete(Remainders1,Remainder,Remainders2),
        append([Remainder],Remainders2,Remainders3),
	unique2(Remainders3,Remainders4,Remainders5,UniqueRemainders1,UniqueRemainders3),
        unique1(Remainders5,Remainders4,UniqueRemainders3,UniqueRemainders2).
unique2(Remainders1,Remainder1,Remainders2,UniqueRemainders1,UniqueRemainders2) :-
        Remainders1=[Remainder2,Remainder1|Remainders2],
	append(UniqueRemainders1,[Remainder2],UniqueRemainders2).
unique2(Remainders1,_Remainder1,Remainder2,UniqueRemainders1,UniqueRemainders2) :-
        Remainders1=[Remainder2],
        append(UniqueRemainders1,[Remainder2],UniqueRemainders2).	
intersection1([],_Result1,Result2,Result2).
intersection1(Result1,Result2,Result3,Result4) :-
        Result1=[Result6|Results1],
	intersection2(Result6,Result2,Result3,Result5),
        intersection1(Results1,Result2,Result5,Result4).
intersection2(Result1,Result2,Result7,Result3) :-
        member(Result1,Result2),
        append(Result7,[Result1],Result3).
intersection2(Result1,Result2,Result7,Result7) :-
        not(member(Result1,Result2)).
union(Result1,Result2,Result3) :-
        append(Result1,Result2,Result4),
	Result4=[Result5|Results],
        unique1(Results,Result5,[],Result3).
list(Formula1,Formula2) :-
	atom(Formula1),Formula2=[Formula1].
list(Formula,Formula) :-
	not(atom(Formula)).
	
and1([true],[true],[],[true]):-!.
and1([false],[true],[],[false]):-!.
and1([true],[false],[],[false]):-!.
and1([false],[false],[],[false]):-!.
or([false],[false],[false]):-!.
or([true],[false],[true]):-!.
or([false],[true],[true]):-!.
or([true],[true],[true]):-!.
not([true],[],[false]):-!.
not([false],[],[true]):-!.
