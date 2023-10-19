#!/usr/bin/bash
#Version commit

#script qui donne le nombre d'entité par année pour les fichiers triés (cours shell)
ENTITE=$1
ANNEE=$2

#boucle de vérification du nombre d'arguments
if [ $# -ne 2 ]
then
	echo "Ce script a besoin de deux arguments : <ENTITE> <ANNEE>. Reessayez."
	exit
fi

#Script
echo "Nombre de $ENTITE pour l'année $ANNEE :"
cat ~/Documents/Cours/PPE/fichiers_tries/ann/$ANNEE/*/*.ann|grep "$ENTITE"|cut -f 3|sort|uniq -c|wc -l


