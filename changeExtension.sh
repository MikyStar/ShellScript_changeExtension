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
                echo -e "${redFontForEcho}$diretory/$nameOfFile$newExtension already exists, original file hasn't been changed${noColorForEcho}"
            else
                mv "$file" "$diretory/$nameOfFile$newExtension"
            fi
        fi
    done
}

function printHelp()
{
    echo -e "${redFontForEcho}Syntax : changeExtension <path directory> <change this extension> <by this one>${noColorForEcho}"
    echo -e "${redFontForEcho}Exemple = changeExtension . '.js' '.txt'${noColorForEcho}"
}

function checkArguments()
{
    directory=$1
    oldExtension=$2
    newExtension=$3

    # Check if tere is 3 arguments
    if [ "$#" -ne 3 ] ; # Given that I've put "" around my var, no need to use doublme [] 
    then
        echo -e "${redFontForEcho}Error : Too few arguments${noColorForEcho}"
        printHelp
        exit
    fi

    # Check if first argument is directory  -> StackOverflow : https://goo.gl/3kPcpo
    if [ ! -d "$directory" ] ;
    then
        echo -e "${redFontForEcho}Error : You need to pass à folder as the first argument${noColorForEcho}"
        printHelp
        exit 
    fi

    # Check if second and third are null
    if [ -z "$oldExtension" ]  ;
    then 
        echo -e "${redFontForEcho}Error : Extension empty in second position${noColorForEcho}"
        printHelp
        exit
    fi

    if [ -z "$newExtension" ] ;
    then 
        echo -e "${redFontForEcho}Error : Extension empty in third position${noColorForEcho}"
        printHelp
        exit
    fi
}

########### Main's beginning ###########

# Arguments
directory=$1
oldExtension=$2
newExtension=$3

# Color for echox
redFontForEcho='\033[0;31m' # -> See : https://goo.gl/1UPaHU
noColorForEcho='\033[0m'

# Execution
checkArguments $directory $oldExtension $newExtension
renameFiles

############## Main's end ##############