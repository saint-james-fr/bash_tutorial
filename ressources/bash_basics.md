# Basics

# Links

[GitHub - jlevy/the-art-of-command-line: Master the command line, in one page](https://github.com/jlevy/the-art-of-command-line)

[explainshell.com - match command-line arguments to their help text](https://explainshell.com/)

[Learn X in Y minutes Where X=bash](https://learnxinyminutes.com/docs/bash/)

[Bash scripting cheatsheet](https://devhints.io/bash)

[A User's Guide to the Z-Shell](https://zsh.sourceforge.io/Guide/zshguide03.html#l52)

---

# Syntaxe

```bash
# NO SPACE
# ALL DATA ARE STRING
# USE DOUBLE PARENTHESIS FOR ARITHMETICS OR LET OR EXPR (prints directly)
# USE $ TO CALL VARIABLES OR EXPRESSIONS!
# USE DOUBLE QUOTES for STRING INTERPOLATION
# USE [ condition ] FOR CONDITIONS
# USE () FOR ARRAYS
# USE [@] FOR ALLVALUES IN ARRAY, [INDEX] TO ACCESS VALUE AT INDEX
# ESCAPE CHARACTERS WITH \ (not necessarily inside strings)
# BRACE EXPANSION 
# VARIABLE EXPANSION ((A.K.A. parameter expansion and parameter substitution)

# Variables
var="some string" # SPACE MATTERS!
# Parameters expansion
echo "$var" # Best practice is to call variable by surrounding by double quotes
echo '$var' # incorrect! 
echo $var # correct but not recommended

# Arithmetics
# No need to add double quotes if already in a double quote expression
# use parenthesis for arithmetics
var1="7"
var2="9"
echo "$((var1*var2))"
echo $(( 2 + 3)) 

# String substitution in variables (only the first char)
echo "${variable/string/replacement}"
# Ex:
input="baba"
echo "${input/ba/bo}"

# Brace Expansion
ls *.{jpg,jpeg,png}    # expands to *.jpg *.jpeg *.png

echo a{p,c,d,b}e # ape ace ade abe
echo {a,b,c}{d,e,f} # ad ae af bd be bf cd ce cf
echo {1..10} # 1 2 3 4 5 6 7 8 9 10
echo {a..z}

from=1
to=10
echo {$from..$to} # => {$from..$to}

# `pwd` stands for "print working directory".
# We can also use the built-in variable `$PWD`.
echo $PWD # is the same as 
echo ${pwd}

# Commands can be substituted within other commands using $( ):
# The following command displays the number of files and directories in the
# current directory.
echo "There are $(ls | wc -l) items here."

# The same can be done using backticks `` but they can't be nested -
# the preferred way is to use $( ).
echo "There are `ls | wc -l` items here."

```

---

# Commandes Basiques

`>` create in a new file OR erase by new content

`>>` append operator

`diff <file1> <file2>` permet d'ouvrir les deux fichiers en même temps

`history` : all commands
`!!`  bang bang, reproduit la même commande
!curl : reproduit la dernière commande curl par exemple
!14 : reproduit la 14e commande (après avoir checké history)

`^ + R` : permet de rechercher parmi les dernières commandes

`head <file>` : permet de voir les 10premières lignes
`tail` : permet de voir les 10dernières lignes

`less` : navigation interactive
`/<string>` lance une recherche
`n` next
`N` previous
`G` end
`g` beginning
`^ + F` move forward one page
`^ + B` move backward one page

`which <nomduprogramme>` locates a programm

`ps` show processes
`top` show processs sorted
`kill -15 <pid>` kill process
`pkill -15 -f <name>` kill matching process

`history | less` : historique des commandes CLI

`ls`  liste ///
`ls -a` avec fichiers cachés
`ls -l` avec plus de détails
`ls -rtl` par reverse time of modification (-r -t
l`s -tl` par time of modification

`ls  <string>*` liste tous ceux qui COMMENCENT par <string>
`ls  *<string>*` liste ceux qui CONTIENNENT par <string>
`ls  *<string>` liste ceux qui TERMINENET par <string> : ex ls -d *.txt

`ls -h` human readable, affiche en kO, mO etc

`ls -hartl` combine toutes les options

`cd <filename>` entrer dans un dossier
`cd` (seul) : ramène à la racine
`cd ..` retour au dossier parent

`mkdir` créer un dossier
`pwd` affiche le nom du fichier courant et son chemin
`cp` copier des fichiers/copie et renomme
ex: cp bonjour bonsoir

`mv` déplacer des fichiers/renommer.
ex: mv bonjour bonsoir
mv bonsoir /desktop

`mv -f /path/subfolder/{.,}* /path/` To move ALL files including hidden files 

`rm` supprimer un fichier
`rmdir` : supprimer un dossier vide
`rm -r` supprimer un dossier non vide (rm récursif)

`grep`rechercher des fragments de texte
`grep -i` case insensitive
`grep -n` donne le numéro de ligne

`grep -r ./*`   cherche récursivement dans un dossier

`top` afficher la liste des processus
`exit` fermer le terminal
`man` : afficher manuel de la commande
`info` : afficher des info sur la commande
`-h` : afficher une aide

`curl -O` télécharger à partir d'une url spécifique et enregistrer dansle dossier où l'on se trouve `curl -o` enregistrer dans un fichier que l'on spécifie.
Ex: `curl -o monnouveaufichier.tx https://...`

`wc`  compte! les octets, les caractères etc

`cat <filename> | less` afficher le contenu 'un fichier page par page
`bat`  pareil mais en plus beau
`awk` —manipuler et transformer des flux de texte (exemple rechercher et remplacer)

`tr` —manipuler et transformer des flux de texte (exemple rechercher et remplacer)

`sed` —manipuler et transformer des flux de texte (exemple rechercher et remplacer)
`touch` créer un fichier  ex: touch .gitignore / touch log.txt
`clear` / `CTRL + L` : nettoyage

---

# String Manipulation  / Research & Replace

```bash
# SEARCH AND REPLACE in a file
sed -i -e 's/string_to_search/string_to_replace/g' file.txt
-i # edit files in place
-e # gives the following option to sed

# REPLACE from a string
#To replace the first occurrence
#use ${initial/pattern/replacement}:
firstString="I love Suzi and Marry"
secondString="Sara"
echo "${firstString/Suzi/$secondString}"    

# To replace all occurrences, use ${initial//pattern/replacement}:
# please note below the DOUBLE DASH!

# GETS LENGTH
${#string}

# GETS ONLY Nth CHARACTAERS
echo "${string:1: -1}"
echo "${string:0:7}" # => return only 7 first characters

# 
```

---

---

# Conditional Statements

```bash
# Syntaxe
if true ;
then ;
fi

# Exemples
if [[ $n1>$n2 ]]; then 
echo "$n1 is bigger"; 
else echo "$n2 is bigger" ; 
fi

if [[ black = white ]]; then
    print Yellow is no colour.
fi

read var
  if [[ $var = yes ]]; then
    print Read yes
  elif [[ $var = no ]]; then
    print Read no
  else
    print Read something else
  fi

# CASE 
read var
  case $var in
    (yes) print Read yes
          ;;
    (no) print Read no
         ;;
    (*) print Read something else
        ;;
   esac

read var
  case $var in
    (yes|true|1) print Reply was affirmative
                 ;;
    (no|false|0) print Reply was negative
                 ;;
    (*) print Reply was cobblers

# There is also conditional execution
echo "Always executed" || echo "Only executed if first command fails"
# => Always executed
echo "Always executed" && echo "Only executed if first command does NOT fail"
# => Always executed

# => Only executed if first command does NOT fail
[[ condition ]] && some_code
cd "$SOMEWHERE" && ./do_something || echo "An error occurred" >&2
```

---

 

---

# Arrays

```bash
array=(one two three four five six)
# Print nth element
echo "${array[0]}" 

# Print all elements
echo "${array[@]}"

# Print the number of elements:
echo "${#array[@]}" # => "6"

# Print 2 elements starting from fourth:
echo "${array[@]:3:2}"

# Print all elements each of them on new line.
for item in "${array[@]}"; do
    echo "$item"
done

```

---

# Loop

```bash
# FOR loop
for el in {1..10} ; do 
echo 'hello world';
done

# Over an ARRAY
data=(a b c)                      
for el in "${data[@]}"; do 
echo $el; 
done

# WHILE loops
i=0
  while (( i++ < 3 )); do
    print $i
  done

```

---

# Arithmetics Operations

```bash
-eq # equal (for numbers, otherwise use == for strings)
-nq # not equal
-gt # greater than
-ge # greater than or equals
-lt 
-le 

#For strings
==
!=
>
<
<=
>=

# There is also the `=~` operator, which tests a string against the Regex pattern:
```

---

# Functions

```bash
fn() { print The time now is $(date); }

# Now you can call function fn
```

Unlike functions in “real” programming languages, Bash functions don’t allow you to return a value when called. 

When a bash function completes, its return value is the status of the last statement executed in the function, `0` for success and non-zero decimal number in the 1 - 255 range for failure.

---

# Jobs

```bash
# A single ampersand & after a command runs it in the background. A background command's
# output is printed to the terminal, but it cannot read from the input.
sleep 30 &
# List background jobs
jobs # => [1]+  Running                 sleep 30 &
# Bring the background job to the foreground
fg
# Ctrl-C to kill the process, or Ctrl-Z to pause it
# Resume a background process after it has been paused with Ctrl-Z
bg
# Kill job number 2
kill %2
# %1, %2, etc. can be used for fg and bg as well
```