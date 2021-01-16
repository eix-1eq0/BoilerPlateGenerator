#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "boilerplate Class <-c|--constructor> <-m|--main>"
    echo " -m --main            lisatakse main() meetod"
    echo " -c --constructor     lisatakse Classi nimeleine konstruktor"
    exit
fi

main=$'\tpublic static void main(String[] args){\n\t}'
constructor=$'\t'$1$'(){\n\t}\t\n'
WRITE=''

#https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash#13359121
for i in "$@"
do
        case $i in
                -m|--main)
                WRITE=$WRITE$main

                ;;
                -c|--constructor)
                WRITE=$constructor$WRITE
                ;;
        esac
done

#Kirjutame faili
cat > $1.java << EOF
public class $1{
$WRITE
}
EOF
