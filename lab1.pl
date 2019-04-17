%% Реализация стандартных предикатов обработки списков:

% 1) lenght - необходим для получения длины списка

myLength([],0).
myLength([X|T],N) :-
      myLength(T,N1),
      N is N1+1.

% Пример:
% | ?- myLength([1, 27, 20], N).
%  N = 3

% 2) member - необходим для проверки принадлежности элемента к списку

myMember(X,[X|_]).
myMember(X,[_|Y]):-
   myMember(X,Y).

% Пример:
% | ?- myMember(3, [3, 5 ,6]).
% true ?
% yes
% | ?- myMember(20, [1, 2, 3]).
% no

% 3) append - необходим для слияния двух списков в третий

myAppend([], L, L).
myAppend([X|L1], L2, [X|L3]):-
    myAppend(L1, L2, L3).

% Пример:
% | ?- myAppend([1, 2], [3], Y).
% Y = [1,2,3]

% 4) delete - необходим для удаления элемента из списка

myDelete(X,[X|T],T).
myDelete(X,[H|T],[H|N]):-
   myDelete(X,T,N).

% Пример:
% | ?- myDelete(2, [1, 2, 3], X).
% X = [1,3] ?
% yes
% | ?- myDelete(1, [1, 2, 3], X).
% X = [2,3] ?
% yes

% 5) permute - необходим для проверки списка на перестановку

myPermute([], []).
myPermute(L, [X | T]):-
    myDelete(X, L, Y),
    myPermute(Y, T).

% Пример:
% | ?- myPermute([1, 2, 3], [1, 2, 3]).
% true ?
% yes
% | ?- myPermute([1, 2, 3], [3, 2, 1]).
% true ?
% yes
% | ?- myPermute([1, 2, 3], [1, 3, 2]).
% true ?
% yes
% | ?- myPermute([1, 2, 3], [1, 4, 3]).
% no
%| ?- myPermute([1, 2, 3], [1, 3, 3]).
% no

% 6) sublist - необходим для проверки вхождения одного списка в другой список

mySublist([],[]).
mySublist([X|L],[X|S]):-
    mySublist(L,S).
mySublist(L, [_|S]):-
    mySublist(L,S).

% Пример:
% | ?- mySublist([1, 2], [1, 2, 3, 4]).
% true ?
% yes
% | ?- mySublist([0, 2], [1, 2, 3, 4]).
% no


% Удаление последнего элемента(с использованием стандартных предикатов)

del_last(L1, L2):-myAppend(L2, [_], L1).

% Пример:
% ?- del_last([1, 2, 3, 4, 5], X).
% X = [1, 2, 3, 4].

dellast([X,_],[X]).
dellast([H|T],[H|Z]) :- dellast(T,Z).

% Пример:
% ?- dellast([1,2,3], Z).
% Z = [1, 2].


% Вычисление числа четных элементов

numOfElem([],0).
numOfElem([H|T],C):-H mod 2=:=0,!,numOfElem(T,C1),C is C1+1.
numOfElem([_|T],C):-numOfElem(T,C).

% Пример:
% ?- numOfElem([1,2,3,4], C).
% C = 2.

%Полезный пример
%Удаление последнего элемента списка и вычисление числа четных элементов
numChetElem(L1, X):-del_last(L1, L2), numOfElem(L2, X).

% Пример:
% ?- numOfChetElem([1,2,4,6], X).
% X = 2.
