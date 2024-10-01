# 🐚 Bash Tutorial

## 📜 Introduction

Bash, ou "Bourne Again SHell", est un interpréteur de commandes qui sert d'outil puissant pour les systèmes basés sur Unix. Développé par Brian Fox en 1987 comme un remplacement gratuit du shell Bourne original (sh), il combine des fonctionnalités de divers shells, le rendant à la fois polyvalent et facile à utiliser.

Le nom "Bash" reflète son héritage et rend hommage à son prédécesseur. Au fil des ans, il est devenu un shell standard pour de nombreuses distributions Linux et macOS, facilitant l'administration système et l'automatisation.

Le scripting en Bash est essentiel pour automatiser des tâches répétitives, gérer des processus système et améliorer la productivité. En écrivant des scripts, les utilisateurs peuvent exécuter des commandes complexes avec facilité, rationaliser les flux de travail et garantir la cohérence des opérations, faisant de Bash une compétence incontournable pour les développeurs et les administrateurs système.

## 🛠️ Basic commands

```bash
# 📢 echo: Prints text to the terminal
echo "Hello, World!"

# ✨ touch: Creates a new empty file or updates timestamp
touch newfile.txt

# 📂 ls: Lists directory contents
ls
ls -l  # Detailed list
ls -a  # Shows hidden files

# 🚶‍♂️ cd: Changes the current directory
cd /path/to/directory
cd ..  # Move up one directory
cd ~   # Go to home directory

# 🗺️ pwd: Prints the current working directory
pwd

# 📁 mkdir: Creates a new directory
mkdir new_folder

# 🗑️ rm: Removes files or directories
rm file.txt
rm -r directory  # Removes a directory and its contents

# 📋 cp: Copies files or directories
cp source.txt destination.txt
cp -r source_dir destination_dir

# 🚚 mv: Moves or renames files or directories
mv oldname.txt newname.txt
mv file.txt /path/to/new/location/

# 📖 cat: Displays the contents of a file
cat file.txt

# 🔍 grep: Searches for patterns in files or command output
grep "pattern" file.txt
ls | grep "*.txt"  # Searches for .txt files in ls output

# 🔒 chmod: Changes file permissions
chmod u+x script.sh  # Makes a script executable

# 📚 man: Displays the manual page for a command
man ls  # Shows the manual for the ls command

# 🔗 Pipe operator: Sends output of one command as input to another
ls | grep ".txt"  # Lists all .txt files in current directory

# ↪️ Redirection operators
> # Redirects output to a file (overwrites existing content)
echo "Hello" > greeting.txt
>> # Appends output to a file
echo "World" >> greeting.txt

# 🚪 Exit codes
exit 0  # Exits the script with a success status
exit 1  # Exits the script with a failure status
# Note: Any non-zero exit code indicates an error
```

## 🚀 Don't forget the shebang and the permissions

```bash
# myscript.sh - top of the file
#!/bin/bash
```

```bash
chmod u+x ./myscript.sh
```

### 🏋️‍♀️ Exercise 1: Create your first script

Use only these commands in the terminal:

```sh
echo
chmod
```

## 🗝️ Key Concepts

1. **📊 Variables and Strings**

   - NO SPACES in variable assignments
   - ALL DATA ARE STRINGS by default
   - USE $ TO CALL VARIABLES OR EXPRESSIONS
   - USE DOUBLE QUOTES for STRING INTERPOLATION

   Example:

   ```bash
   name="Alice"
   age=30
   echo "Hello, $name! You are $age years old."
   ```

2. **🔀 Conditions**

   - USE [ condition ] FOR CONDITIONS

   Example:

   ```bash
   if [ "$age" -ge 18 ]; then
       echo "You are an adult."
   else
       echo "You are a minor."
   fi
   ```

3. **📦 Arrays**

   - USE () FOR ARRAYS
   - USE [@] FOR ALL VALUES IN ARRAY
   - USE [INDEX] TO ACCESS VALUE AT INDEX

   Example:

   ```bash
   fruits=("apple" "banana" "cherry")
   echo "All fruits: ${fruits[@]}"
   echo "Second fruit: ${fruits[1]}"
   ```

4. **🔣 Special Characters**

   - ESCAPE CHARACTERS WITH \ (not necessarily inside strings)

   Example:

   ```bash
   echo "This is a newline: \n"
   echo "This is a tab: \t"
   ```

### 🏋️‍♀️ Exercise 2

Create a script that asks for the user's name and age, then prints a personalized message based on their age.
Tip: Use the `read` command. Compare variables using -lt or -ge.

## 💡 Best Practices

- Use meaningful variable names
- Comment your code for clarity
- Use double quotes around variables to prevent word splitting
- Use `set -e` at the beginning of scripts to exit on error
- Use `set -u` to exit on undefined variables

## 📚 Further Resources

- [Learn Bash in X minutes](https://learnxinyminutes.com/docs/bash/)
- [Cheatsheet](https://devhints.io/bash)
- [My own notes that I exported for you](./ressources/bash_basics.md)


## 🎯 Exercises Solutions

### Exercise 1

```bash
echo '#!/bin/bash' > myscript.sh
echo "\\n \
echo \"hello world\"" >> myscript.sh
chmod u+x ./myscript.sh
./myscript.sh
```

### Exercise 2

```bash
#!/bin/bash

echo "What's your name? 👋"
read name

echo "How old are you? 🎂"
read age

# Use variables and conditions
if [ "$age" -lt 18 ]; then
    echo "Hello $name! At $age, you're still a minor. Enjoy your youth! 🌟"
elif [ "$age" -ge 18 ] && [ "$age" -lt 65 ]; then
    echo "Welcome, $name! At $age, you're in your prime working years. 💼"
else
    echo "Greetings, $name! At $age, you've earned your retirement. Enjoy! 🏖️"
fi
```
