#!/usr/bin/bash

#script qui donne le nombre de location par année pour les fichiers triés (cours shell)


echo "Nombre de locations pour l'année 2016 :"
cat ~/Documents/Cours/PPE/fichiers_tries/ann/2016/*/*.ann|grep "Location"|cut -f 3|sort|uniq -c|wc -l
echo "Nombre de locations pour l'année 2017 :"
cat ~/Documents/Cours/PPE/fichiers_tries/ann/2017/*/*.ann|grep "Location"|cut -f 3|sort|uniq -c|wc -l
echo "Nombre de locations pour l'année 2018 :"
cat ~/Documents/Cours/PPE/fichiers_tries/ann/2018/*/*.ann|grep "Location"|cut -f 3|sort|uniq -c|wc -l
