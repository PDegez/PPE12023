#!/usr/bin/bash

#script qui donne le nombre d'entité par année pour les 3 années du fichiers triés (cours shell)

ENTITE=$1

bash count_entite_aa_entite_annee.sh $1 2016
bash count_entite_aa_entite_annee.sh $1 2017
bash count_entite_aa_entite_annee.sh $1 2018
