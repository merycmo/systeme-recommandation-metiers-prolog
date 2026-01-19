start :-
    % Nettoyage des anciennes réponses en mémoire vive
    retractall(oui(_)),
    retractall(non(_)),
    retractall(competence(_)),  % <-- AJOUTER CETTE LIGNE
    
    write('************************************************'), nl,
    write('*   BIENVENUE SUR L\'IA D\'ORIENTATION MASTER BD   *'), nl,
    write('************************************************'), nl,
    write('Conseil : Répondez par "oui." ou "non."'), nl, nl,
    
    % On lance l'exécution du moteur
    executer_moteur.

