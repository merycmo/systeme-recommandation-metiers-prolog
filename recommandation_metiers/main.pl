% =====================================================
% MAIN.PL - Point d'entrée du Système Expert
% =====================================================

% Chargement des modules du projet
:- consult('faits.pl').     % Base de connaissances 
:- consult('questions.pl'). % Interaction 
:- consult('regles.pl').    % Logique métier 
:- consult('moteur.pl').    % Pilotage 

% Commande principale de lancement : ?- start.
start :-
    % Nettoyage des anciennes réponses en mémoire vive
    retractall(oui(_)),
    retractall(non(_)),
    
    write('************************************************'), nl,
    write('*   BIENVENUE SUR L\'IA D\'ORIENTATION MASTER BD   *'), nl,
    write('************************************************'), nl,
    write('Conseil : Répondez par "oui." ou "non."'), nl, nl,
    
    % On lance l'exécution du moteur
    executer_moteur.
