#!/usr/bin/bash

CHEMIN=$1

#Vérification du nombre d'arguments
if [ $# -ne 1 ]
then
	echo "Ce script a besoin d'un seul argument (chemin d'un fichier txt contenant des urls)"
	exit
fi

if [ -f $1 ]
then
	echo "le fichier existe"
else
	echo "le fichier n'existe pas"
	exit
fi

#Correction des urls : https://
lineno=1
while read -r line
do
url=$line
if [[ $url =~ ^https?:// ]]
	then
		echo "$url"
	else
		echo -e "https://$url"
fi
done < "$1" > "./urls_corrigees.txt"

#Changement de Leonard en Léonard
sed -i "s/Leonard/Léonard/g" ./urls_corrigees.txt

#Lecture urls_corrigees, extraction des données et organisation en données tabulées > ./tableau-fr.txt
lineno=1
while read -r line
do
	url=$line
	reponse=$(curl -I -s $url|grep -P HTTP|grep -P -o [[:digit:]]{3})
	encodage=$(curl -I -s $url|grep -P -o "charset=.*\b"|grep -v \"|cut -d = -f 2)
	echo -e "${lineno}\t${url}\t${reponse}\t${encodage}"
	lineno=$(expr $lineno + 1)
done < "./urls_corrigees.txt" > "../tableaux/tableau-fr.txt"

#Suppression du fichier temporaire de travail
rm "./urls_corrigees.txt"

#Message de status
echo "le tableau a été créé à l'emplacement /miniprojet/tableaux/tableau-fr.txt"

