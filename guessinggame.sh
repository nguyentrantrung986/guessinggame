#!/usr/bin/env bash

function guess_input {
        read -p "How many files are in this directory? Your guess: " guess
        echo $guess
}

file_cnt=$(ls | wc -l)
while [[ -z $guess || $file_cnt != $guess ]]
do
	guess=$(guess_input)
	if [[ ! $guess =~ ^[0-9]+$ ]]
	then
		echo "Please guess a number."
	elif [[ $file_cnt -lt $guess ]]
	then
		echo "Your guess is too high. Try again!"
	elif [[ $file_cnt -gt $guess ]]
	then
		echo "Your guess is too low. Try again!"
	else
		echo "Your guess is correct. Congratulation!"
	fi
done
