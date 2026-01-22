% MÉTIERS EN DÉVELOPPEMENT
metier(developpeur_web, [programmation, html, css, javascript, resolutions_problemes, travail_equipe]).
metier(developpeur_mobile, [programmation, java, kotlin, swift, ui_ux, resolutions_problemes]).
metier(developpeur_backend, [programmation, bases_donnees, api, python, java, logique]).
metier(developpeur_frontend, [programmation, html, css, javascript, ui_ux, creativite]).
metier(developpeur_fullstack, [programmation, html, css, javascript, bases_donnees, api, resolutions_problemes]).
metier(developpeur_jeux_video, [programmation, cpp, unity, creativite, mathematiques, physique]).

% MÉTIERS EN DATA ET IA
metier(data_scientist, [mathematiques, statistiques, python, machine_learning, analyse_donnees, logique]).
metier(data_analyst, [statistiques, analyse_donnees, sql, excel, visualisation_donnees, logique]).
metier(ingenieur_ia, [mathematiques, python, machine_learning, deep_learning, programmation, recherche]).
metier(ingenieur_big_data, [programmation, bases_donnees, hadoop, spark, analyse_donnees, logique]).

% MÉTIERS EN CYBERSÉCURITÉ ET RÉSEAU
metier(expert_cybersecurite, [securite_informatique, reseaux, ethical_hacking, cryptographie, logique, resolutions_problemes]).
metier(pentester, [securite_informatique, ethical_hacking, reseaux, programmation, resolutions_problemes, analyse_donnees]).
metier(administrateur_systeme, [systemes_exploitation, reseaux, linux, windows, resolutions_problemes, organisation]).
metier(administrateur_reseau, [reseaux, cisco, securite_informatique, resolutions_problemes, logique, communication]).

% MÉTIERS EN DESIGN ET UX/UI
metier(designer_ui_ux, [ui_ux, creativite, figma, photoshop, sens_artistique, communication]).
metier(web_designer, [html, css, creativite, ui_ux, photoshop, sens_artistique]).

% MÉTIERS EN GESTION ET MANAGEMENT IT
metier(chef_projet_it, [gestion_projet, communication, leadership, organisation, travail_equipe, logique]).
metier(product_owner, [gestion_projet, communication, analyse_besoins, organisation, leadership, logique]).
metier(scrum_master, [gestion_projet, communication, leadership, travail_equipe, organisation, agile]).

% MÉTIERS EN DEVOPS ET CLOUD
metier(ingenieur_devops, [programmation, linux, docker, kubernetes, ci_cd, automatisation]).
metier(ingenieur_cloud, [cloud, aws, azure, reseaux, securite_informatique, automatisation]).

% MÉTIERS EN QUALITÉ ET TESTS
metier(testeur_qa, [tests_logiciels, resolutions_problemes, attention_details, logique, communication, organisation]).
metier(ingenieur_qa_automation, [programmation, tests_logiciels, selenium, automatisation, logique, resolutions_problemes]).

% MÉTIERS EN SUPPORT ET ASSISTANCE
metier(technicien_support, [resolutions_problemes, communication, patience, systemes_exploitation, materiel_informatique, service_client]).
metier(consultant_it, [communication, analyse_besoins, resolutions_problemes, expertise_technique, gestion_projet, conseil]).

% LISTE DES COMPÉTENCES DISPONIBLES
competence_disponible(C) :- metier(_, L), member(C, L).
% Unifier les compétences pour éviter les doublons
toutes_competences(L) :- setof(C, competence_disponible(C), L).
