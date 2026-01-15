
% MÉTIERS EN DÉVELOPPEMENT

metier(developpeur_web, [
    programmation,
    html,
    css,
    javascript,
    resolutions_problemes,
    travail_equipe
]).

metier(developpeur_mobile, [
    programmation,
    java,
    kotlin,
    swift,
    ui_ux,
    resolutions_problemes
]).

metier(developpeur_backend, [
    programmation,
    bases_donnees,
    api,
    python,
    java,
    logique
]).

metier(developpeur_frontend, [
    programmation,
    html,
    css,
    javascript,
    ui_ux,
    creativite
]).

metier(developpeur_fullstack, [
    programmation,
    html,
    css,
    javascript,
    bases_donnees,
    api,
    resolutions_problemes
]).

metier(developpeur_jeux_video, [
    programmation,
    cpp,
    unity,
    creativite,
    mathematiques,
    physique
]).

% MÉTIERS EN DATA ET IA

metier(data_scientist, [
    mathematiques,
    statistiques,
    python,
    machine_learning,
    analyse_donnees,
    logique
]).

metier(data_analyst, [
    statistiques,
    analyse_donnees,
    sql,
    excel,
    visualisation_donnees,
    logique
]).

metier(ingenieur_ia, [
    mathematiques,
    python,
    machine_learning,
    deep_learning,
    programmation,
    recherche
]).

metier(ingenieur_big_data, [
    programmation,
    bases_donnees,
    hadoop,
    spark,
    analyse_donnees,
    logique
]).

% MÉTIERS EN CYBERSÉCURITÉ ET RÉSEAU


metier(expert_cybersecurite, [
    securite_informatique,
    reseaux,
    ethical_hacking,
    cryptographie,
    logique,
    resolutions_problemes
]).

metier(pentester, [
    securite_informatique,
    ethical_hacking,
    reseaux,
    programmation,
    resolutions_problemes,
    analyse_donnees
]).

metier(administrateur_systeme, [
    systemes_exploitation,
    reseaux,
    linux,
    windows,
    resolutions_problemes,
    organisation
]).

metier(administrateur_reseau, [
    reseaux,
    cisco,
    securite_informatique,
    resolutions_problemes,
    logique,
    communication
]).

% MÉTIERS EN DESIGN ET UX/UI


metier(designer_ui_ux, [
    ui_ux,
    creativite,
    figma,
    photoshop,
    sens_artistique,
    communication
]).

metier(web_designer, [
    html,
    css,
    creativite,
    ui_ux,
    photoshop,
    sens_artistique
]).

% MÉTIERS EN GESTION ET MANAGEMENT IT

metier(chef_projet_it, [
    gestion_projet,
    communication,
    leadership,
    organisation,
    travail_equipe,
    logique
]).

metier(product_owner, [
    gestion_projet,
    communication,
    analyse_besoins,
    organisation,
    leadership,
    logique
]).

metier(scrum_master, [
    gestion_projet,
    communication,
    leadership,
    travail_equipe,
    organisation,
    agile
]).

% MÉTIERS EN DEVOPS ET CLOUD

metier(ingenieur_devops, [
    programmation,
    linux,
    docker,
    kubernetes,
    ci_cd,
    automatisation
]).

metier(ingenieur_cloud, [
    cloud,
    aws,
    azure,
    reseaux,
    securite_informatique,
    automatisation
]).

% MÉTIERS EN QUALITÉ ET TESTS


metier(testeur_qa, [
    tests_logiciels,
    resolutions_problemes,
    attention_details,
    logique,
    communication,
    organisation
]).

metier(ingenieur_qa_automation, [
    programmation,
    tests_logiciels,
    selenium,
    automatisation,
    logique,
    resolutions_problemes
]).


% MÉTIERS EN SUPPORT ET ASSISTANCE


metier(technicien_support, [
    resolutions_problemes,
    communication,
    patience,
    systemes_exploitation,
    materiel_informatique,
    service_client
]).

metier(consultant_it, [
    communication,
    analyse_besoins,
    resolutions_problemes,
    expertise_technique,
    gestion_projet,
    conseil
]).


% LISTE DE TOUTES LES COMPÉTENCES DISPONIBLES

% Cette liste sert de référence pour les questions à poser

competence_disponible(programmation).
competence_disponible(html).
competence_disponible(css).
competence_disponible(javascript).
competence_disponible(python).
competence_disponible(java).
competence_disponible(cpp).
competence_disponible(kotlin).
competence_disponible(swift).
competence_disponible(sql).
competence_disponible(bases_donnees).
competence_disponible(api).
competence_disponible(reseaux).
competence_disponible(linux).
competence_disponible(windows).
competence_disponible(cloud).
competence_disponible(aws).
competence_disponible(azure).
competence_disponible(docker).
competence_disponible(kubernetes).
competence_disponible(ci_cd).
competence_disponible(securite_informatique).
competence_disponible(ethical_hacking).
competence_disponible(cryptographie).
competence_disponible(mathematiques).
competence_disponible(statistiques).
competence_disponible(machine_learning).
competence_disponible(deep_learning).
competence_disponible(analyse_donnees).
competence_disponible(visualisation_donnees).
competence_disponible(ui_ux).
competence_disponible(creativite).
competence_disponible(sens_artistique).
competence_disponible(figma).
competence_disponible(photoshop).
competence_disponible(gestion_projet).
competence_disponible(communication).
competence_disponible(leadership).
competence_disponible(organisation).
competence_disponible(travail_equipe).
competence_disponible(resolutions_problemes).
competence_disponible(logique).
competence_disponible(attention_details).
competence_disponible(tests_logiciels).
competence_disponible(automatisation).
competence_disponible(agile).
competence_disponible(analyse_besoins).
competence_disponible(service_client).
competence_disponible(patience).
competence_disponible(conseil).
competence_disponible(expertise_technique).
competence_disponible(materiel_informatique).
competence_disponible(systemes_exploitation).
competence_disponible(hadoop).
competence_disponible(spark).
competence_disponible(excel).
competence_disponible(unity).
competence_disponible(physique).
competence_disponible(recherche).
competence_disponible(selenium).
competence_disponible(cisco).


% PRÉDICATS UTILITAIRES


% Lister tous les métiers disponibles
lister_metiers :-
    write('=== MÉTIERS DISPONIBLES ==='), nl,
    forall(
        metier(M, _),
        (format('- ~w~n', [M]))
    ).

% Lister toutes les compétences disponibles
lister_competences :-
    write('=== COMPÉTENCES DISPONIBLES ==='), nl,
    forall(
        competence_disponible(C),
        (format('- ~w~n', [C]))
    ).

% Afficher les détails d'un métier
details_metier(Metier) :-
    metier(Metier, Competences),
    format('Métier: ~w~n', [Metier]),
    write('Compétences requises:'), nl,
    forall(
        member(C, Competences),
        format('  - ~w~n', [C])
    ).

% Compter le nombre de métiers
nombre_metiers(N) :-
    findall(M, metier(M, _), Metiers),
    length(Metiers, N).

% Compter le nombre de compétences
nombre_competences(N) :-
    findall(C, competence_disponible(C), Competences),
    length(Competences, N).


