:- use_module(library(lists)).

% Calcul du score
score_correspondance(Metier, CompetencesUtilisateur, Score) :-
    metier(Metier, CompetencesRequises),
    intersection(CompetencesUtilisateur, CompetencesRequises, Communes),
    length(Communes, NbCommunes),
    length(CompetencesRequises, NbRequises),
    NbRequises > 0,
    Score is (NbCommunes * 100) / NbRequises.

% Recommandation
recommander_metiers(CompUser, Recommandations) :-
    findall(score(S, M), (metier(M, _), score_correspondance(M, CompUser, S), S >= 40), L),
    sort(1, @>=, L, Recommandations).

% Rapport
generer_rapport(CompUser) :-
    nl, write('======= RAPPORT D\'ORIENTATION ======='), nl,
    recommander_metiers(CompUser, Recs),
    afficher_top(Recs, CompUser, 1).

afficher_top([], _, _).
afficher_top([score(S, M)|T], CompUser, P) :-
    format('~d. ~w (~1f%)~n', [P, M, S]),
    metier(M, Req), subtract(Req, CompUser, Manque),
    (Manque == [] -> write('   [Profil Complet]') ; format('   A travailler: ~w', [Manque])), nl,
    Next is P + 1,
    (P < 5 -> afficher_top(T, CompUser, Next) ; true).
