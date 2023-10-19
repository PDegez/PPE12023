#!/usr/bin/bash

#script qui donne le nombre d'entité par année pour les 3 années du fichiers triés (cours shell)

ENTITE=$1

#Vérification du nombre d'arguments
if [ $# -ne 1 ]
then
    echo "Ce script a besoin d'un argument pour fonctionner : <ENTITE>. Reessayez"
    exit
fi

DOSSIER_ANNEE=$(ls ~/Documents/Cours/PPE/fichiers_tries/ann)
ANNEE=$ANNEE

#prendre la liste du dossier comme une liste d'élément pour une boucle
for ANNEE in $DOSSIER_ANNEE
do
	bash ~/Documents/Cours/PPE/git/DG_ppe/exercices/Shell/count_entite_aa_entite_annee.sh $1 $ANNEE
done

echo "fin du programme"
