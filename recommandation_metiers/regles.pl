% regles.pl
:- use_module(library(lists)).

% ====================
% SCORE DE CORRESPONDANCE
% ====================

score_correspondance(Metier, CompUser, Score) :-
    metier(Metier, CompRequises),
    intersection(CompUser, CompRequises, Communes),
    length(Communes, NbCommunes),
    length(CompRequises, NbRequises),
    NbRequises > 0,
    Score is (NbCommunes * 100) / NbRequises.


% ====================
% RECOMMANDATION AVEC EXCLUSION
% ====================

recommander_metiers(CompUser, Recommandations) :-
    findall(
        score(S, M),
        ( metier(M, L),
          \+ (rejet(programmation), member(programmation, L)),
          score_correspondance(M, CompUser, S),
          S >= 40
        ),
        Liste),
    sort(1, @>=, Liste, Recommandations).


% ====================
% RAPPORT FINAL
% ====================

generer_rapport(CompUser) :-
    nl, write('======= RAPPORT D\'ORIENTATION ======='), nl,
    recommander_metiers(CompUser, Recs),
    afficher_top(Recs, CompUser, 1).

afficher_top([], _, _).
afficher_top([score(S, M)|T], CompUser, P) :-
    format('~d. ~w (~1f%%)~n', [P, M, S]),
    metier(M, Req),
    subtract(Req, CompUser, Manque),
    ( Manque == []
      -> write('   [Profil Complet]')
      ;  format('   A travailler: ~w', [Manque])
    ), nl,
    P2 is P + 1,
    ( P < 5 -> afficher_top(T, CompUser, P2) ; true ).
