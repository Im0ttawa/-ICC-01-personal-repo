#!/bin/bash

echo Chose one:
echo 1.Goku
echo 2.Vegeta

read choice

case $choice in
            1)
                echo "Hello Goku";;
            
            2)
                echo "hello Vegeta";;
            *)
                echo wrong choice;;
esac