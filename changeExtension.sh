#/bin/bash

# Description : Program to change file extension on a specific directory
# Usage : changeExtension <path directory> <change this extension> <by this one>
# Exemple = changeExtension . ".js" ".txt"

function renameFiles()
{
    let "count = 0"

    for file in "$directory"/*"$oldExtension"
    do
        if [ -f "$file" ];
        then
            nameOfFile="${file//$oldExtension/}"

            # Check if the future file already exists
            if [ -e "$diretory/$nameOfFile$newExtension" ] 
            then
                 echo "$diretory/$nameOfFile$newExtension already exists, original file hasn't been change"
            else
                mv "$file" "$diretory/$nameOfFile$newExtension"
            fi
        fi
    done
}

function printHelp()
{
    echo "Syntax : changeExtension <path directory> <change this extension> <by this one>"
    echo "Exemple = changeExtension . '.js' '.txt'"
}

function checkArguments()
{
    directory=$1
    oldExtension=$2
    newExtension=$3

    # Check if tere is 3 arguments
    if [ "$#" -ne 3 ] ; # Given that I've put "" around my var, no need to use doublme [] 
    then
        echo "Error : Too few arguments"
        printHelp
        exit
    fi

    # Check if first argument is directory  -> StackOverflow : https://goo.gl/3kPcpo
    if [ ! -d "$directory" ] ;
    then
        echo "Error : You need to pass à folder as the first argument"
        printHelp
        exit 
    fi

    # Check if second and third are null
    if [ -z "$oldExtension" ]  ;
    then 
        echo "Error : Extension empty in second position"
        printHelp
        exit
    fi

    if [ -z "$newExtension" ] ;
    then 
        echo "Error : Extension empty in third position"
        printHelp
        exit
    fi
}

########### Main's beginning ###########

directory=$1
oldExtension=$2
newExtension=$3

checkArguments $directory $oldExtension $newExtension
renameFiles

############## Main's end ##############