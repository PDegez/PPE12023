#!usr/bin/bash

fichier=$1
nombre=$2

#vérification au moins 1 argument
if [ $# -lt 1 ]
then
    echo "ce script a besoin d'au moins un argument pour fonctionner."
fi

#vérification argument = fichier non vide
if ! [ -s $1 ]
then
    echo "le premier argument du script doit être un fichier texte non vide."
fi

#condition pour argument optionnel + script traitement + classement
if [ -z $2 ]
then
    classement=$(bash ./traitement_texte.sh $1 | sort -i | uniq -c | sort -n -r| head -n 25)
else
    classement=$(bash ./traitement_texte.sh $1 | sort -i | uniq -c | sort -n -r | head -n $2)
fi

#retour resultat stdout
echo "$classement"
