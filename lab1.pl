%% ���������� ����������� ���������� ��������� �������:

% 1) lenght - ��������� ��� ��������� ����� ������

myLength([],0).
myLength([X|T],N) :-
      myLength(T,N1),
      N is N1+1.

% ������:
% | ?- myLength([1, 27, 20], N).
%  N = 3

% 2) member - ��������� ��� �������� �������������� �������� � ������

myMember(X,[X|_]).
myMember(X,[_|Y]):-
   myMember(X,Y).

% ������:
% | ?- myMember(3, [3, 5 ,6]).
% true ?
% yes
% | ?- myMember(20, [1, 2, 3]).
% no

% 3) append - ��������� ��� ������� ���� ������� � ������

myAppend([], L, L).
myAppend([X|L1], L2, [X|L3]):-
    myAppend(L1, L2, L3).

% ������:
% | ?- myAppend([1, 2], [3], Y).
% Y = [1,2,3]

% 4) delete - ��������� ��� �������� �������� �� ������

myDelete(X,[X|T],T).
myDelete(X,[H|T],[H|N]):-
   myDelete(X,T,N).

% ������:
% | ?- myDelete(2, [1, 2, 3], X).
% X = [1,3] ?
% yes
% | ?- myDelete(1, [1, 2, 3], X).
% X = [2,3] ?
% yes

% 5) permute - ��������� ��� �������� ������ �� ������������

myPermute([], []).
myPermute(L, [X | T]):-
    myDelete(X, L, Y),
    myPermute(Y, T).

% ������:
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

% 6) sublist - ��������� ��� �������� ��������� ������ ������ � ������ ������

mySublist([],[]).
mySublist([X|L],[X|S]):-
    mySublist(L,S).
mySublist(L, [_|S]):-
    mySublist(L,S).

% ������:
% | ?- mySublist([1, 2], [1, 2, 3, 4]).
% true ?
% yes
% | ?- mySublist([0, 2], [1, 2, 3, 4]).
% no


% �������� ���������� ��������(� �������������� ����������� ����������)

del_last(L1, L2):-myAppend(L2, [_], L1).

% ������:
% ?- del_last([1, 2, 3, 4, 5], X).
% X = [1, 2, 3, 4].

dellast([X,_],[X]).
dellast([H|T],[H|Z]) :- dellast(T,Z).

% ������:
% ?- dellast([1,2,3], Z).
% Z = [1, 2].


% ���������� ����� ������ ���������

numOfElem([],0).
numOfElem([H|T],C):-H mod 2=:=0,!,numOfElem(T,C1),C is C1+1.
numOfElem([_|T],C):-numOfElem(T,C).

% ������:
% ?- numOfElem([1,2,3,4], C).
% C = 2.

%�������� ������
%�������� ���������� �������� ������ � ���������� ����� ������ ���������
numChetElem(L1, X):-del_last(L1, L2), numOfElem(L2, X).

% ������:
% ?- numOfChetElem([1,2,4,6], X).
% X = 2.
