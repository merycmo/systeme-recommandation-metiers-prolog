% moteur.pl
executer_moteur :-
    % 1. Appelle le bloc questions de la Personne 2
    poser_questions, 
    
    % 2. Récupère les compétences stockées
    findall(C, competence(C), ListeUser),
    
    % 3. Génère le rapport via la Personne 1
    (   ListeUser \= []
    ->  generer_rapport(ListeUser) 
    ;   nl, write('Aucune competence selectionnee. Fin du programme.'), nl
    ).
