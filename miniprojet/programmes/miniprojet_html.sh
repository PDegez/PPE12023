#!/usr/bin/bin/bash

URLS=$1

#vérification du nombre minimal d'arguments
if [ $# -ne 1 ]
then
	echo "ce script a besoin d'un argument pour fonctionner"
fi

#vérification de l'existence d'un argument = fichier non vide
if ! [ -s $1 ]
then
	echo "ce script prend un fichier texte non vide en argument (un ensemble d'urls)"
fi

#ouverture de la table, headers et ouverture du corps du tableau
echo -e "<table>\n\t<thead>\n\t\t<tr>\n\t\t\t<th>numero url</th>\n\t\t\t<th>url</th>\n\t\t\t<th>reponse</th>\n\t\t\t<th>encodage</th>\n\t\t</tr>\n\t</thead>\n\t<tbody>"

#boucle pour remplir les lignes du tableau avec balises
lineno=1
while read -r URL
do
	#récupération réponse serveur
	reponse=$(curl -I -s -L -w "%{http_code}" -o /dev/null $URL)

	#récupération encodage
	encodage=$(curl -I -s -L -w "%{content_type}" -o /dev/null $URL | grep -P -o "charset=\S+" | cut -d = -f 2)

	#ligne en html : lineno | URL (cliquable : <a href="urls"> texte à cliquer </a>) | reponse
	echo -e "\t\t<tr>\n\t\t\t<td>$lineno</td>\n\t\t\t<td><a href='$URL'>$URL</a></td>\n\t\t\t<td>$reponse</td>\n\t\t\t<td>$encodage</td>\n\t\t</tr>"

	#incrément boucle
	lineno=$(expr $lineno + 1)
done < "$URLS"

#fin des balises
echo -e "\t</tbody>\n</table>"
