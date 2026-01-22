:- dynamic competence/1.
:- dynamic domaine_interesse/1.

poser_questions :-
    nl, write('=== ORIENTATION PROFESSIONNELLE ==='), nl,
    write('Repondez par oui. ou non.'), nl, nl,
    poser_questions_domaines,
    nl, write('=== EVALUATION DES COMPETENCES ==='), nl,
    poser_questions_detaillees.

% Questions sur les domaines
poser_questions_domaines :-
    poser_question_domaine(developpement, 'Etes-vous interesse par le DEVELOPPEMENT ?'),
    poser_question_domaine(data_ia, 'Etes-vous interesse par les DONNEES et l\'IA ?'),
    poser_question_domaine(securite, 'Etes-vous interesse par la CYBERSECURITE ?'),
    poser_question_domaine(design, 'Etes-vous interesse par le DESIGN (UI/UX) ?'),
    poser_question_domaine(gestion, 'Etes-vous interesse par la GESTION DE PROJETS ?'),
    poser_question_domaine(cloud_devops, 'Etes-vous interesse par le CLOUD et DEVOPS ?'),
    poser_question_domaine(qualite, 'Etes-vous interesse par la QUALITE/TESTS ?'),
    poser_question_domaine(support, 'Etes-vous interesse par le SUPPORT/CONSEIL ?').

poser_question_domaine(Domaine, Question) :-
    write(Question), write(' : '),
    read(Reponse),
    (Reponse == oui -> assertz(domaine_interesse(Domaine)) ; true).

% Questions filtrées
poser_questions_detaillees :-
    setof(C, (metier(_, L), member(C, L)), Toutes),
    forall(
        (member(Comp, Toutes), competence_pertinente(Comp)),
        poser_question(Comp)
    ).

competence_pertinente(Comp) :- domaine_interesse(D), competence_pour_domaine(D, Comp), !.
competence_pertinente(_) :- \+ domaine_interesse(_).

% Mapping (extraits)
competence_pour_domaine(developpement, C) :- member(C, [programmation, html, css, javascript, python, java, cpp, kotlin, swift, bases_donnees, api, unity]).
competence_pour_domaine(data_ia, C) :- member(C, [python, mathematiques, statistiques, machine_learning, deep_learning, analyse_donnees, visualisation_donnees, sql, hadoop, spark, excel]).
competence_pour_domaine(securite, C) :- member(C, [securite_informatique, reseaux, ethical_hacking, cryptographie, linux, windows, cisco]).
competence_pour_domaine(design, C) :- member(C, [ui_ux, creativite, sens_artistique, figma, photoshop, html, css]).
competence_pour_domaine(gestion, C) :- member(C, [gestion_projet, communication, leadership, organisation, agile, analyse_besoins]).
competence_pour_domaine(cloud_devops, C) :- member(C, [cloud, aws, azure, docker, kubernetes, ci_cd, linux, automatisation]).
competence_pour_domaine(qualite, C) :- member(C, [tests_logiciels, automatisation, selenium, attention_details, programmation]).
competence_pour_domaine(support, C) :- member(C, [communication, patience, service_client, materiel_informatique, systemes_exploitation, conseil]).
competence_pour_domaine(_, C) :- member(C, [travail_equipe, resolutions_problemes, logique]).

poser_question(Competence) :-
    competence(Competence), !. % Déjà posée
poser_question(Competence) :-
    format('Avez-vous des competences en "~w" ? ', [Competence]),
    read(Reponse),
    (Reponse == oui -> assertz(competence(Competence)) ; true).
