:- dynamic competence/1.
:- dynamic domaine_interesse/1.

% =====================================================
% QUESTIONS GÉNÉRALES D'ORIENTATION
% =====================================================

poser_questions :-
    nl,
    write('=== ORIENTATION PROFESSIONNELLE ==='), nl,
    write('Nous allons determiner vos domaines d\'interet'), nl, nl,
    
    % Questions générales sur les domaines
    poser_questions_domaines,
    
    % Questions détaillées selon les domaines choisis
    nl,
    write('=== EVALUATION DES COMPETENCES ==='), nl,
    poser_questions_detaillees,
    
    nl,
    write('=== ANALYSE TERMINEE ==='), nl.

% -------------------------
% Questions sur les domaines
% -------------------------
poser_questions_domaines :-
    poser_question_domaine(developpement, 'Etes-vous interesse par le DEVELOPPEMENT (creation d\'applications, sites web, logiciels) ?'),
    poser_question_domaine(data_ia, 'Etes-vous interesse par les DONNEES et l\'INTELLIGENCE ARTIFICIELLE ?'),
    poser_question_domaine(securite, 'Etes-vous interesse par la CYBERSECURITE et les RESEAUX ?'),
    poser_question_domaine(design, 'Etes-vous interesse par le DESIGN et l\'experience utilisateur (UI/UX) ?'),
    poser_question_domaine(gestion, 'Etes-vous interesse par la GESTION DE PROJETS IT et le management ?'),
    poser_question_domaine(cloud_devops, 'Etes-vous interesse par le CLOUD et DEVOPS (automatisation, infrastructure) ?'),
    poser_question_domaine(qualite, 'Etes-vous interesse par la QUALITE et les TESTS logiciels ?'),
    poser_question_domaine(support, 'Etes-vous interesse par le SUPPORT TECHNIQUE et le conseil ?').

poser_question_domaine(Domaine, Question) :-
    write(Question), write(' (oui/non) : '),
    read(Reponse),
    (Reponse = oui -> assertz(domaine_interesse(Domaine)) ; true).

% -------------------------
% Questions détaillées selon domaines
% -------------------------
poser_questions_detaillees :-
    forall(
        (competence_disponible(C), competence_pertinente(C)),
        poser_question(C)
    ).

% Vérifier si une compétence est pertinente selon les domaines choisis
competence_pertinente(Comp) :-
    domaine_interesse(D),
    competence_pour_domaine(D, Comp), !.

% Si aucun domaine choisi, poser toutes les questions
competence_pertinente(_) :-
    \+ domaine_interesse(_).

% -------------------------
% Mapping Compétences <-> Domaines
% -------------------------

% Développement
competence_pour_domaine(developpement, programmation).
competence_pour_domaine(developpement, html).
competence_pour_domaine(developpement, css).
competence_pour_domaine(developpement, javascript).
competence_pour_domaine(developpement, python).
competence_pour_domaine(developpement, java).
competence_pour_domaine(developpement, cpp).
competence_pour_domaine(developpement, kotlin).
competence_pour_domaine(developpement, swift).
competence_pour_domaine(developpement, bases_donnees).
competence_pour_domaine(developpement, api).
competence_pour_domaine(developpement, unity).

% Data et IA
competence_pour_domaine(data_ia, python).
competence_pour_domaine(data_ia, mathematiques).
competence_pour_domaine(data_ia, statistiques).
competence_pour_domaine(data_ia, machine_learning).
competence_pour_domaine(data_ia, deep_learning).
competence_pour_domaine(data_ia, analyse_donnees).
competence_pour_domaine(data_ia, visualisation_donnees).
competence_pour_domaine(data_ia, sql).
competence_pour_domaine(data_ia, hadoop).
competence_pour_domaine(data_ia, spark).
competence_pour_domaine(data_ia, excel).

% Sécurité
competence_pour_domaine(securite, securite_informatique).
competence_pour_domaine(securite, reseaux).
competence_pour_domaine(securite, ethical_hacking).
competence_pour_domaine(securite, cryptographie).
competence_pour_domaine(securite, linux).
competence_pour_domaine(securite, windows).
competence_pour_domaine(securite, cisco).

% Design
competence_pour_domaine(design, ui_ux).
competence_pour_domaine(design, creativite).
competence_pour_domaine(design, sens_artistique).
competence_pour_domaine(design, figma).
competence_pour_domaine(design, photoshop).
competence_pour_domaine(design, html).
competence_pour_domaine(design, css).

% Gestion
competence_pour_domaine(gestion, gestion_projet).
competence_pour_domaine(gestion, communication).
competence_pour_domaine(gestion, leadership).
competence_pour_domaine(gestion, organisation).
competence_pour_domaine(gestion, agile).
competence_pour_domaine(gestion, analyse_besoins).

% Cloud et DevOps
competence_pour_domaine(cloud_devops, cloud).
competence_pour_domaine(cloud_devops, aws).
competence_pour_domaine(cloud_devops, azure).
competence_pour_domaine(cloud_devops, docker).
competence_pour_domaine(cloud_devops, kubernetes).
competence_pour_domaine(cloud_devops, ci_cd).
competence_pour_domaine(cloud_devops, linux).
competence_pour_domaine(cloud_devops, automatisation).

% Qualité
competence_pour_domaine(qualite, tests_logiciels).
competence_pour_domaine(qualite, automatisation).
competence_pour_domaine(qualite, selenium).
competence_pour_domaine(qualite, attention_details).
competence_pour_domaine(qualite, programmation).

% Support
competence_pour_domaine(support, communication).
competence_pour_domaine(support, patience).
competence_pour_domaine(support, service_client).
competence_pour_domaine(support, materiel_informatique).
competence_pour_domaine(support, systemes_exploitation).
competence_pour_domaine(support, conseil).

% Compétences transversales (posées pour tous)
competence_pour_domaine(_, travail_equipe).
competence_pour_domaine(_, resolutions_problemes).
competence_pour_domaine(_, logique).

% -------------------------
% Poser une question
% -------------------------
poser_question(Competence) :-
    formuler_question(Competence, Question),
    write(Question), write(' (oui/non) : '),
    read(Reponse),
    traiter_reponse(Reponse, Competence).

% -------------------------
% Traitement de la réponse
% -------------------------
traiter_reponse(oui, Competence) :-
    assertz(competence(Competence)).
traiter_reponse(non, _) :- true.
traiter_reponse(_, Competence) :-
    write('Reponse invalide. Veuillez repondre par oui ou non.'), nl,
    poser_question(Competence).

% -------------------------
% Formulation des questions
% -------------------------
formuler_question(programmation, 'Aimez-vous la programmation ?').
formuler_question(html, 'Connaissez-vous le HTML ?').
formuler_question(css, 'Connaissez-vous le CSS ?').
formuler_question(javascript, 'Connaissez-vous JavaScript ?').
formuler_question(python, 'Connaissez-vous Python ?').
formuler_question(java, 'Connaissez-vous Java ?').
formuler_question(cpp, 'Connaissez-vous le C++ ?').
formuler_question(kotlin, 'Connaissez-vous Kotlin ?').
formuler_question(swift, 'Connaissez-vous Swift ?').
formuler_question(sql, 'Connaissez-vous le SQL ?').
formuler_question(bases_donnees, 'Avez-vous des connaissances en bases de donnees ?').
formuler_question(api, 'Avez-vous deja travaille avec des API ?').
formuler_question(reseaux, 'Avez-vous des connaissances en reseaux ?').
formuler_question(linux, 'Utilisez-vous Linux ?').
formuler_question(windows, 'Utilisez-vous Windows ?').
formuler_question(cloud, 'Avez-vous des connaissances en Cloud Computing ?').
formuler_question(aws, 'Connaissez-vous AWS ?').
formuler_question(azure, 'Connaissez-vous Microsoft Azure ?').
formuler_question(docker, 'Connaissez-vous Docker ?').
formuler_question(kubernetes, 'Connaissez-vous Kubernetes ?').
formuler_question(ci_cd, 'Connaissez-vous les pipelines CI/CD ?').
formuler_question(securite_informatique, 'Vous interessez-vous a la securite informatique ?').
formuler_question(ethical_hacking, 'Vous interessez-vous a l ethical hacking ?').
formuler_question(cryptographie, 'Avez-vous des connaissances en cryptographie ?').
formuler_question(mathematiques, 'Etes-vous a l aise avec les mathematiques ?').
formuler_question(statistiques, 'Avez-vous des connaissances en statistiques ?').
formuler_question(machine_learning, 'Vous interessez-vous au machine learning ?').
formuler_question(deep_learning, 'Vous interessez-vous au deep learning ?').
formuler_question(analyse_donnees, 'Aimez-vous analyser des donnees ?').
formuler_question(visualisation_donnees, 'Aimez-vous la visualisation de donnees ?').
formuler_question(ui_ux, 'Vous interessez-vous au design UI/UX ?').
formuler_question(creativite, 'Etes-vous une personne creative ?').
formuler_question(sens_artistique, 'Avez-vous un sens artistique ?').
formuler_question(figma, 'Connaissez-vous Figma ?').
formuler_question(photoshop, 'Connaissez-vous Photoshop ?').
formuler_question(gestion_projet, 'Avez-vous des competences en gestion de projet ?').
formuler_question(communication, 'Avez-vous de bonnes competences en communication ?').
formuler_question(leadership, 'Avez-vous un esprit de leadership ?').
formuler_question(organisation, 'Etes-vous bien organise ?').
formuler_question(travail_equipe, 'Aimez-vous le travail en equipe ?').
formuler_question(resolutions_problemes, 'Aimez-vous resoudre des problemes ?').
formuler_question(logique, 'Avez-vous un bon raisonnement logique ?').
formuler_question(attention_details, 'Faites-vous attention aux details ?').
formuler_question(tests_logiciels, 'Avez-vous des connaissances en tests logiciels ?').
formuler_question(automatisation, 'Aimez-vous automatiser des taches ?').
formuler_question(agile, 'Connaissez-vous les methodes Agile ?').
formuler_question(analyse_besoins, 'Savez-vous analyser les besoins des clients ?').
formuler_question(service_client, 'Aimez-vous le contact avec les clients ?').
formuler_question(patience, 'Etes-vous patient ?').
formuler_question(conseil, 'Aimez-vous conseiller les autres ?').
formuler_question(expertise_technique, 'Avez-vous une expertise technique avancee ?').
formuler_question(materiel_informatique, 'Connaissez-vous le materiel informatique ?').
formuler_question(systemes_exploitation, 'Connaissez-vous les systemes d exploitation ?').
formuler_question(hadoop, 'Connaissez-vous Hadoop ?').
formuler_question(spark, 'Connaissez-vous Apache Spark ?').
formuler_question(excel, 'Utilisez-vous Excel ?').
formuler_question(unity, 'Connaissez-vous Unity ?').
formuler_question(physique, 'Avez-vous des connaissances en physique ?').
formuler_question(recherche, 'Aimez-vous la recherche ?').
formuler_question(selenium, 'Connaissez-vous Selenium ?').
formuler_question(cisco, 'Connaissez-vous les technologies Cisco ?').
