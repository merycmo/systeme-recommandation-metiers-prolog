% RÈGLES DU SYSTÈME EXPERT D'ORIENTATION PROFESSIONNELLE IT

% Charger les faits
:- consult('faits.pl').

% =====================================================
% RÈGLES DE CORRESPONDANCE MÉTIER-COMPÉTENCES
% =====================================================

% Calculer le score de correspondance entre l'utilisateur et un métier
score_correspondance(Metier, CompetencesUtilisateur, Score) :-
    metier(Metier, CompetencesRequises),
    intersection(CompetencesUtilisateur, CompetencesRequises, CompetencesCommunes),
    length(CompetencesCommunes, NbCommunes),
    length(CompetencesRequises, NbRequises),
    NbRequises > 0,
    Score is (NbCommunes * 100) / NbRequises.

% Vérifier si un métier correspond bien à l'utilisateur (score >= 60%)
metier_correspond(Metier, CompetencesUtilisateur) :-
    score_correspondance(Metier, CompetencesUtilisateur, Score),
    Score >= 60.

% Vérifier si un métier correspond parfaitement (score >= 80%)
metier_correspond_fortement(Metier, CompetencesUtilisateur) :-
    score_correspondance(Metier, CompetencesUtilisateur, Score),
    Score >= 80.
% =====================================================
% RÈGLES DE RECOMMANDATION
% =====================================================
% Recommander les métiers pour l'utilisateur
recommander_metiers(CompetencesUtilisateur, MetiersRecommandes) :-
    findall(
        score(Score, Metier),
        (
            metier(Metier, _),
            score_correspondance(Metier, CompetencesUtilisateur, Score),
            Score >= 40
        ),
        MetiersAvecScores
    ),
    sort(1, @>=, MetiersAvecScores, MetiersTries),
    MetiersRecommandes = MetiersTries.

% Obtenir les N meilleurs métiers
top_n_metiers(CompetencesUtilisateur, N, TopMetiers) :-
    recommander_metiers(CompetencesUtilisateur, TousMetiers),
    prendre_n_premiers(N, TousMetiers, TopMetiers).

% Prédicat auxiliaire pour prendre les N premiers éléments
prendre_n_premiers(0, _, []) :- !.
prendre_n_premiers(_, [], []) :- !.
prendre_n_premiers(N, [X|Xs], [X|Ys]) :-
    N > 0,
    N1 is N - 1,
    prendre_n_premiers(N1, Xs, Ys).

% Métier le plus recommandé
meilleur_metier(CompetencesUtilisateur, Metier, Score) :-
    recommander_metiers(CompetencesUtilisateur, [score(Score, Metier)|_]).

% =====================================================
% RÈGLES D'ANALYSE DE PROFIL
% =====================================================

% Déterminer le domaine principal de l'utilisateur
domaine_principal(CompetencesUtilisateur, developpement) :-
    member(programmation, CompetencesUtilisateur),
    (member(html, CompetencesUtilisateur) ;
     member(javascript, CompetencesUtilisateur) ;
     member(python, CompetencesUtilisateur) ;
     member(java, CompetencesUtilisateur)),
    !.

domaine_principal(CompetencesUtilisateur, data_ia) :-
    (member(mathematiques, CompetencesUtilisateur) ;
     member(statistiques, CompetencesUtilisateur)),
    (member(machine_learning, CompetencesUtilisateur) ;
     member(analyse_donnees, CompetencesUtilisateur) ;
     member(python, CompetencesUtilisateur)),
    !.

domaine_principal(CompetencesUtilisateur, cybersecurite) :-
    member(securite_informatique, CompetencesUtilisateur),
    (member(reseaux, CompetencesUtilisateur) ;
     member(ethical_hacking, CompetencesUtilisateur) ;
     member(cryptographie, CompetencesUtilisateur)),
    !.

domaine_principal(CompetencesUtilisateur, design) :-
    member(ui_ux, CompetencesUtilisateur),
    (member(creativite, CompetencesUtilisateur) ;
     member(sens_artistique, CompetencesUtilisateur) ;
     member(figma, CompetencesUtilisateur)),
    !.

domaine_principal(CompetencesUtilisateur, gestion) :-
    member(gestion_projet, CompetencesUtilisateur),
    (member(leadership, CompetencesUtilisateur) ;
     member(communication, CompetencesUtilisateur) ;
     member(organisation, CompetencesUtilisateur)),
    !.

domaine_principal(CompetencesUtilisateur, devops_cloud) :-
    (member(docker, CompetencesUtilisateur) ;
     member(kubernetes, CompetencesUtilisateur) ;
     member(cloud, CompetencesUtilisateur)),
    (member(ci_cd, CompetencesUtilisateur) ;
     member(automatisation, CompetencesUtilisateur) ;
     member(linux, CompetencesUtilisateur)),
    !.

domaine_principal(_, generaliste).

% =====================================================
% RÈGLES DE COMPÉTENCES MANQUANTES
% =====================================================

% Identifier les compétences manquantes pour un métier
competences_manquantes(Metier, CompetencesUtilisateur, CompetencesManquantes) :-
    metier(Metier, CompetencesRequises),
    subtract(CompetencesRequises, CompetencesUtilisateur, CompetencesManquantes).

% Vérifier si peu de compétences manquent (1 ou 2)
peu_competences_manquantes(Metier, CompetencesUtilisateur) :-
    competences_manquantes(Metier, CompetencesUtilisateur, Manquantes),
    length(Manquantes, N),
    N =< 2.

% =====================================================
% RÈGLES DE CATÉGORISATION
% =====================================================

% Métiers de développement
est_metier_developpement(Metier) :-
    member(Metier, [
        developpeur_web,
        developpeur_mobile,
        developpeur_backend,
        developpeur_frontend,
        developpeur_fullstack,
        developpeur_jeux_video
    ]).

% Métiers de data et IA
est_metier_data(Metier) :-
    member(Metier, [
        data_scientist,
        data_analyst,
        ingenieur_ia,
        ingenieur_big_data
    ]).

% Métiers de cybersécurité
est_metier_securite(Metier) :-
    member(Metier, [
        expert_cybersecurite,
        pentester,
        administrateur_systeme,
        administrateur_reseau
    ]).

% Métiers de design
est_metier_design(Metier) :-
    member(Metier, [
        designer_ui_ux,
        web_designer
    ]).

% Métiers de gestion
est_metier_gestion(Metier) :-
    member(Metier, [
        chef_projet_it,
        product_owner,
        scrum_master
    ]).

% Métiers DevOps et Cloud
est_metier_devops(Metier) :-
    member(Metier, [
        ingenieur_devops,
        ingenieur_cloud
    ]).

% Métiers de qualité et tests
est_metier_qualite(Metier) :-
    member(Metier, [
        testeur_qa,
        ingenieur_qa_automation
    ]).

% Métiers de support
est_metier_support(Metier) :-
    member(Metier, [
        technicien_support,
        consultant_it
    ]).

% =====================================================
% RÈGLES D'ANALYSE AVANCÉE
% =====================================================

% Compétences techniques vs soft skills
est_competence_technique(C) :-
    member(C, [
        programmation, html, css, javascript, python, java, cpp,
        kotlin, swift, sql, bases_donnees, api, reseaux, linux,
        windows, cloud, aws, azure, docker, kubernetes, ci_cd,
        securite_informatique, ethical_hacking, cryptographie,
        mathematiques, statistiques, machine_learning, deep_learning,
        analyse_donnees, visualisation_donnees, figma, photoshop,
        tests_logiciels, automatisation, hadoop, spark, excel,
        unity, physique, selenium, cisco
    ]).

est_soft_skill(C) :-
    member(C, [
        communication, leadership, organisation, travail_equipe,
        resolutions_problemes, logique, attention_details, creativite,
        sens_artistique, gestion_projet, agile, analyse_besoins,
        service_client, patience, conseil, expertise_technique
    ]).

% Profil technique vs profil soft
profil_technique(CompetencesUtilisateur) :-
    findall(C, (member(C, CompetencesUtilisateur), est_competence_technique(C)), Techniques),
    findall(C, (member(C, CompetencesUtilisateur), est_soft_skill(C)), Soft),
    length(Techniques, NbTech),
    length(Soft, NbSoft),
    NbTech > NbSoft.

profil_equilibre(CompetencesUtilisateur) :-
    findall(C, (member(C, CompetencesUtilisateur), est_competence_technique(C)), Techniques),
    findall(C, (member(C, CompetencesUtilisateur), est_soft_skill(C)), Soft),
    length(Techniques, NbTech),
    length(Soft, NbSoft),
    Diff is abs(NbTech - NbSoft),
    Diff =< 2.

% =====================================================
% RÈGLES DE PARCOURS DE CARRIÈRE
% =====================================================

% Métiers accessibles avec formation courte (peu de compétences manquantes)
metier_accessible_rapidement(Metier, CompetencesUtilisateur) :-
    peu_competences_manquantes(Metier, CompetencesUtilisateur),
    score_correspondance(Metier, CompetencesUtilisateur, Score),
    Score >= 50.

% Métiers d'évolution possible
metier_evolution_possible(MetierActuel, MetierCible) :-
    metier(MetierActuel, CompActuel),
    metier(MetierCible, CompCible),
    MetierActuel \= MetierCible,
    intersection(CompActuel, CompCible, Communes),
    length(Communes, NbCommunes),
    length(CompCible, NbCible),
    NbCible > 0,
    Pourcentage is (NbCommunes * 100) / NbCible,
    Pourcentage >= 50.

% =====================================================
% RÈGLES D'AFFICHAGE ET RAPPORTS
% =====================================================

% Afficher un rapport complet pour l'utilisateur
generer_rapport(CompetencesUtilisateur) :-
    nl,
    write('========================================'), nl,
    write('   RAPPORT D\'ORIENTATION PROFESSIONNELLE'), nl,
    write('========================================'), nl, nl,

    % Compétences de l'utilisateur
    write('VOS COMPETENCES:'), nl,
    afficher_competences(CompetencesUtilisateur),
    nl,

    % Domaine principal
    write('DOMAINE PRINCIPAL: '),
    domaine_principal(CompetencesUtilisateur, Domaine),
    format('~w~n', [Domaine]),
    nl,

    % Top 5 métiers recommandés
    write('TOP 5 METIERS RECOMMANDES:'), nl,
    top_n_metiers(CompetencesUtilisateur, 5, TopMetiers),
    afficher_top_metiers(TopMetiers, CompetencesUtilisateur, 1),
    nl,

    write('========================================'), nl.

% Afficher la liste des compétences
afficher_competences([]).
afficher_competences([C|Reste]) :-
    format('  - ~w~n', [C]),
    afficher_competences(Reste).

% Afficher les métiers du top avec leurs scores
afficher_top_metiers([], _, _).
afficher_top_metiers([score(Score, Metier)|Reste], CompUtilisateur, Position) :-
    format('~d. ~w (~1f%)~n', [Position, Metier, Score]),
    competences_manquantes(Metier, CompUtilisateur, Manquantes),
    (Manquantes = [] ->
        write('   >> Vous avez toutes les competences!~n') ;
        (write('   Competences a developper: '),
         afficher_liste_simple(Manquantes),
         nl)),
    NextPos is Position + 1,
    afficher_top_metiers(Reste, CompUtilisateur, NextPos).

% Afficher une liste simple
afficher_liste_simple([]).
afficher_liste_simple([X]) :-
    format('~w', [X]).
afficher_liste_simple([X,Y|Reste]) :-
    format('~w, ', [X]),
    afficher_liste_simple([Y|Reste]).
