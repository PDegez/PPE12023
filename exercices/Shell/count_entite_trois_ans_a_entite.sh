#!/usr/bin/bash

#script qui donne le nombre d'entité par année pour les 3 années du fichiers triés (cours shell)
ENTITE=$1

#Vérification du nombre d'arguments
if [ $# -ne 1 ]
then
    echo "Ce script a besoin d'un argument pour fonctionner : <ENTITE>. Reessayez"
    exit
fi

#Script boucle du script count_entite_aa_entite_annee.sh
ANNEE=2016
while [ -d ~/Documents/Cours/PPE/fichiers_tries/ann/$ANNEE ]
do
    bash count_entite_aa_entite_annee.sh $1 $ANNEE
    ANNEE=$(expr $ANNEE + 1)
done
