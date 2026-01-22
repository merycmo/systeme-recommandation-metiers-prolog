% main.pl
:- consult('faits.pl').
:- consult('questions.pl').
:- consult('regles.pl').
:- consult('moteur.pl').

start :-
    % Nettoyage mémoire vive
    retractall(competence(_)),
    retractall(domaine_interesse(_)),
    
    write('-------------------------------------------'), nl,
    write('    SYSTEME EXPERT ORIENTATION IT v3.0     '), nl,
    write('-------------------------------------------'), nl,
    
    % Lancement du moteur
    executer_moteur,
    
    nl, write('Consultation terminee.'), nl.
