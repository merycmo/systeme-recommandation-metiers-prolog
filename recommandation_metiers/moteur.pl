% =====================================================
% MOTEUR.PL - Moteur d'inférence et de pilotage
% =====================================================

% Prédicats dynamiques pour stocker les réponses
:- dynamic oui/1.
:- dynamic non/1.

% Ce prédicat lance le cycle : 
% 1. Pose les questions (via questions.pl)
% 2. Collecte les réponses positives
% 3. Appelle le générateur de rapport de regles.pl
executer_moteur :-
    nl, write('--- DEBUT DE L\'ANALYSE DE PROFIL ---'), nl,
    
    % On demande à questions.pl de poser toutes les questions nécessaires
    poser_questions, 
    
    % On récupère toutes les compétences validées
    findall(Comp, competence(Comp), ListeCompetences),
    
    % On vérifie si l'utilisateur a au moins une compétence
    (   ListeCompetences \= []
    ->  generer_rapport(ListeCompetences) % Prédicat de regles.pl
    ;   write('Erreur : Aucune competence n\'a ete saisie. Impossible d\'orienter.'), nl
    ),
    
    nl, write('--- FIN DE LA CONSULTATION ---'), nl.

% Utilitaire pour forcer l'affichage de tous les métiers (si besoin de démo brute)
lister_tous_metiers_possibles :-
    metier(M, _),
    format('- ~w~n', [M]),
    fail.
lister_tous_metiers_possibles.

