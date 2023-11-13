#!/usr/bin/bash

texte_brut=$1

if [ $# -ne 1 ]
then
    echo "ce script a besoin d'un argument pour fonctionner"
fi

if ! [ -f $1 ]
then
    echo "ce script prend un fichier existant en argument"
fi

cat $texte_brut | tr -d [:punct:] | tr -d "«" | tr -d "—" | tr -s " " | tr " " "\n" | tr -s "\n" | tr [:upper:] [:lower:]

