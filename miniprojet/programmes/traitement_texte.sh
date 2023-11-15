#!/usr/bin/bash

texte_brut=$1

#vérifications
if [ $# -ne 1 ]
then
    echo "ce script a besoin d'un argument pour fonctionner"
fi

if ! [ -f $1 ]
then
    echo "ce script prend un fichier existant en argument"
fi

#traitement du texte : suppression ponctuation | suppression guillemets fr | supperssion tiret fr | transformation suite d'espace en un seul espace | transformation espace en retour ligne | transformation maj en min
#cat $texte_brut | tr -d [:punct:] | tr -d "«" | tr -d "—" | tr -s " " | tr " " "\n" | tr -s "\n" | tr [:upper:] [:lower:]
texte_final=$(cat $texte_brut | grep -P -o '\p{Latin}+' | tr [:upper:] [:lower:] | tr 'ÉÈÀ' 'éèà')

echo "$texte_final"
