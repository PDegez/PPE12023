##!usr/bin/bash

fichier=$1
nombre=$2

#verification nombre d'argument et type d'argument
if [ $# -lt 1 ]
then
    echo "Ce script a besoin d'au moins un argument pour fonctionner"
fi

if ! [ -s $1 ]
then
    echo "Ce script prend un fichier texte non vide en premier argument"
fi

#appel du script traitement_texte, travail dans 2 fichiers temporaires
texte=$(bash traitement_texte.sh $1)
echo "$texte" > ./temp2.txt
echo -e "\n$texte" > ./temp1.txt

#creation et classement des bigrammes
if [ -z $2 ]
then
    nombre=25
fi

if ! [[ $nombre =~ ^0*[1-9][0-9]* ]]
then
    echo "le deuxième argument doit être vide ou un nombre entier"
fi

freq_bigram=$(paste ./temp1.txt ./temp2.txt | tr "\t" " " | sort -i | uniq -c | sort -n -r | head -n $nombre )

#retour resultat stdout
echo "$freq_bigram"

#suppression fichiers temporaires de travail
rm ./temp1.txt
rm ./temp2.txt
