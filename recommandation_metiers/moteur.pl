% =====================================================
% MOTEUR.PL - Moteur d'inférence et de pilotage
% =====================================================

% Ce prédicat lance le cycle : 
% 1. Pose les questions (via questions.pl)
% 2. Collecte les réponses positives
% 3. Appelle le générateur de rapport de regles.pl
executer_moteur :-
    nl, write('--- DEBUT DE L\'ANALYSE DE PROFIL ---'), nl,
    
    % On demande à questions.pl de poser toutes les questions nécessaires
    poser_questions_competences, 
    
    % On récupère toutes les compétences validées (les 'oui')
    findall(Comp, oui(Comp), ListeCompetences),
    
    % On vérifie si l'utilisateur a au moins une compétence
    (   ListeCompetences \= []
    ->  generer_rapport(ListeCompetences) % Prédicat puissant de regles.pl
    ;   write('Erreur : Aucune compétence n\'a été saisie. Impossible d\'orienter.'), nl
    ),
    
    nl, write('--- FIN DE LA CONSULTATION ---'), nl.

% Utilitaire pour forcer l'affichage de tous les métiers (si besoin de démo brute)
lister_tous_metiers_possibles :-
    compatible(M),
    format('- ~w~n', [M]),
    fail.
lister_tous_metiers_possibles.
