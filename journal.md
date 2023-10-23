Programmation et projet encadré

#exercice/actions
?? question
!! remarque

COURS D'INTRODUCTION

1 - linux => tout est fichier et donc manipulable
    -> importance d'être organisé sur sa machine pour éviter un bazar absolu et des difficultés de manipulation : garder une arborescence propre.
2 - chemin absolu vers un fichier (chemin depuis /root)
vs chemin relatif (chemin depuis autre répertoire que /root : /home, ~/, répertoire courant etc...)
3 - Dossier > fichier
4 - commandes principales de navigation (voir slides 00-Shell)
5 - présentation de git (gestion de versions : permet de conserver les différentes versions d'un projet)

#exercice de tri de fichier par ligne de commande. Utilisation de mkdir, mv, et de la wildcard *

?? est-il possible d'automatiser le procédé en créant une boucle pour éviter de devoir modifier systématiquement un caractère avant de pouvoir bouger les fichiers (01,02,03...) ??


SEMAINE 2 : UTILISER GIT

1 - création d'un jeu de clé de sécurité ssh encodage ed25519
    - une clé publique (signature des actions publiques)
    - une clé personnelle (non communiquée avec l'exterieur, sécurisation des données lors des échanges avec git)
    - un code est joint est est demandé par git avant les manipulations qui modifient le répertoire
2 - syntaxe des commandes git : git <sous commande> [-options...] [arguments...]
3 - clonage du git du cours sur la machine afin de pouvoir récupérer les différents contenus via git
4 - mise à jour de la version locale à partir de la version en ligne :
    - git fetch (cherche le log pour répertorier les changements)
    - git pull (récupère les changements vers le répertoire local)
5 - ajout de fichier local sur la version en ligne :
    - git add (fichier à uploader)
    - git commit [-m message] (regroupement des derniers add)
    - git push (upload des changement indiqués par le dernier commit)
6 - ajout de tag (mettre en avant certains commits pour indiquer une étape importante)
    - git tag [-a] [-m message] <tagname> [commit]
    [-a] ajout d'un message
    [commit] indique le commit à tagger (sinon, dernier commit)
!! espace non accepté dans le nom du tag
7 - état du git :
    - git status
    - git log

#exercice : clonage de notre git personnel sur la machine
#exercice : push modification du journal de bord et de l'exercice de la session d'introduction
#perso : installation et configuration de powertop pour optimiser la vie de la batterie sur ubuntu
#perso : modification du nom de fichier pour éviter les espaces et les majuscules

SEMAINE 3 : CORRIGER UNE ERREUR SUR GIT

3 états de git :
    - Modified means that you have changed the file but have not committed it to your database yet.
    - Staged means that you have marked a modified file in its current version to go into your next commit snapshot.
    - Committed means that the data is safely stored in your local database

Deux moyens différents pour corriger des erreurs sur git :
    - git reset : pour reset des commits non poussés (défaire les changements non partagés en ligne)
            git reset HEAD~[N] :    annule des changements NON COMMITE
            - revient à la version -N du dépôt (par défaut, N=1, cad le commit parent)
            - répertoire inchangé
            - annule la mise en place (staging = liste de add)
            git reset --soft HEAD~
            - revient à la version HEAD
            - répertoire inchangé
            - n'annule pas le staging
            git reset --hard HEAD~
            - revient à la version HEAD
            - répertoire changé pour correspondre à la version HEAD
            - annule le staging
            git reset <commit> (commit = un tag ou un identifiant commit)
            - revenir à un commit spécifique (soft et hard s'appliquent de la même façon)
    - git revert <commit> : annuler des changements commités
    crée un nouveau commit ou les changements sont annulés (conserve une trace des commits effectués)

#Exercice : fichier "oups" avait été commit+push par erreur en cours. A été remove du git par la suite.
#Exercice refait tel qu'il aurait dû avoir lieu :
1 - fichier oups créé en local
2 - fichier oups modifié à la place du journal en local
3 - fichier oups commité
4 - git revert git-seance3-init
5 - copier coller modifications de oups dans journal de bord. Add ces changements
6 - git commit -a -m "séance3, version finale des exercices de git"
7 - push


SEMAINE 4 : FLux,  Pipelines et Scripts

Gestion par défaut du flux de données :
- stdin		standard input channel (defaut = clavier)
- stdout	standard output channel (defaut = écran)
- stderr	standard output channel for mistakes

Les flux sont redirigeables :
<	remplacer stdin par un fichier
>	écrit stdout dans un fichier en écrasant le fichier d'origine
>>	ecrit stdout dans un fichier en ajoutant au fichier d'origine
2>	écrit stderr dans un fichier (écraser. Pour ajouter en fin de fichier, 2>>)
>&	écrit stdout et stderr dans un fichier (écraser. Pour ajouter en fin de fichier : >>&)

Les pipelines sont des enchainements de commandes séparées par un pipe |, tel que
- cmd1|cm2
- la commande 2 prend pour input l'output de la commande 1

Quelques commandes utiles :
- grep (lancer une expression régulière pour extraire un motif)
- sort (trier les fichier. Attention, l'ordre par défaut est alphabétique)
- uniq (regroupe les entrées redondantes en une seule entrée préfacée par son nombre)
- cat (concatène le contenu des fichiers)
- wc (affiche le nombre de lignes, de mots et d'octet)
- echo (renvoie l'argument)


Les scripts permettent de rendre executables des enchainements de commandes et pipelines
- commence par un shebang : #!/usr/bin/bash
- rendu exécutable par la commande chmod +x
- exécuté directement ou par la commande bash
- par defaut $1, $2, $3 indiquent les arguments et leur position attendue dans la commande
- bonne pratique : nommer explicitement la variable (ex: $1=FICHIER_URL)
!pas d'espace autour du = en bash
- pour référencer la valeur de la variable, $NOM_VARIABLE (ex: $FICHIER_URL)

#Exercice pipelines : slide 24, cours Shell: /exercices/exercice_pipelines
#Exercices script : nom du script = resultat + a|aa|aaa (nombre d'argument) + arguments
#slide 29, cours Shell: /exercices/locations_annee
#slide 32, cours Shell:
#Exercice 1: /exercices/count_entite_aa_entite_annee	/exercices/count_entite_trois_ans_a_entite
#Exercice 2: /exercices/classement_location_aaa_annee_mois_nombre  


SEMAINE 5 : Conditions, Boucles et Lynx

1) rediger des instructions de contrôle pour les scripts : if + condition
- vérifier que le nombre d'arguments entrés est conforme à celui attendu
- interrompre le script et faire un feedback à l'utilisateur en cas de non conformité (exit / echo)
2) syntaxe des conditions : if [condition]. Le script vérifie que la condition est vraie:
-> sur les chemins :
- -f <fichier> vraie si <fichier> existe ( -s si il existe et n'est pas vide)
- -d <dossier> vraie si <dossier> existe
-> sur les chaines
- -n <chaine> vraie si la chaine n'est pas vide (-z si elle est vide : ex argument non fourni)
- égalité ou différence = !=
- ordre alphabétique > <
-> sur les entiers
- a -eq b (equal)
- a -ne	b (not equal)
- a -lt b (less than)
- a -gt b (greater than)
- a -le b (less or equal)
- a -ge	b (greater or equal)
-> regex
if [[$1 =~ <regex> ]]
3) les boucles : similaire à python mais il faut indiquer la FIN de la boucle également
- boucle for :
for x in y
do
	something
done
- boucle en while
while [condition]
do
	something
done
#Exercices: ajouter vérification aux scripts de la séance 4.
!! jusqu'à présent, j'ai opté pour des chemins absolus dans les scripts afin de pouvoir potentiellement les déplacer sans problèmes, mais si l'objectif est de les partager (et de les rendre emboitables), il faudra sans doute revenir sur des chemins relatifs du type ./ qui sont exécutables sur n'importe quelle machine du moment que toutes les données manipulées sont dans le même dossier.
!! projet : discussion du mot à choisir avec Siman et Alix. Plusieurs possibilités en discussion : religion, vaccin, handicap etc. Nous essayons de favoriser des sujets qui peuvent déclencher des opinions tranchées dans les co-textes.



