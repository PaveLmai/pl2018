sootvetstvujut(A,B,A,B).
sootvetstvujut(A,B,B,A).

member(H,[H|_]).
member(H,[_|Tail]):-member(H,Tail).

solve([["dina",F1],["sonja",F2],["kolja",F3],["roma",F4],["misha",F5]]):-
    FList=[F1,F2,F3,F4,F5],member("bojchenko",FList),member("savchenko",FList),
    member("karpenko",FList),member("lysenko",FList),member("shevchenko",FList),
    not(member(F4,["karpenko","shevchenko","lysenko","bojchenko"])),
    not(member(F2,["shevchenko","bojchenko"])),
    not(sootvetstvujut(F1,F3,"lysenko","bojchenko")),
    not(sootvetstvujut(F1,F3,"karpenko","shevchenko")),
    member(F2,["lysenko","bojchenko"]),
    F1\="karpenko",not(member(F3,["shevchenko","karpenko"])).
