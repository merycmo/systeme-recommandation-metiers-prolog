
:- dynamic competence/1.

% -------------------------
% Lancement des questions
% -------------------------
poser_questions :-
    nl,
    write('=== Evaluation des competences ==='), nl,
    forall(competence_disponible(C), poser_question(C)),
    nl,
    write('=== Analyse terminee ==='), nl.





% -------------------------
% Poser une question
% -----------------------
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

