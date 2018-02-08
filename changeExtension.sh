#/bin/bash

:'
Description : Program to change file extension on a specific directory

Usage : changeExtension <path directory> <change this extension> <by this one>

Exemple = changeExtension . ".js" ".txt"
'

########### Main's beginning ###########

$directory=$1
$oldExtension=$2
$newExtension=$3



############## Main's end ##############


function getAllFiles()
{
    let "compteur = 0"

    for file in "$directory"/*"$oldExtension"
    do
        if [ -f "$file" ];
        then
            let "compteur++"
            echo "$file"
        fi
    done
}

function renameFiles()
{
    mv
}

function printHelp()
{
    
}

function checkArguments()
{

    # Check if first argument is direcrory  -> StackOverflow : https://goo.gl/3kPcpo
    if [ ! -d $directory ] ;
    then
        echo "You need to pass à folder as the first argument"
        printHelp()
        exit 1
    fi

    # Check if second and third
    regex=".*"
    if [ [ ! $oldExtension =~ $regex ] && [ ! $newExtension =~$regex ]] ;
    then
        echo "You need to pass extension on the format '.[extension]'"
        printHelp()
        exit 1
    fi
}
