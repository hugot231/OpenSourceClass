#!/bin/bash
# this command will read and output the users'
echo "Choose(Paper, Scissors, Rock, or q for quit)"
read userChoice

while [ $userChoice != "q" ]; do
rightNow=$(date "+%B_%d-%A_%k_%M")
fileName="GamePlay_$rightNow.out"
dirName="RPS_$(date "+%B_%Y")"
timeStamp=$(date "+%k:%M:%S_%m-%d-%Y")
#declaring variables
declare -a rps # declare rps as array
rps=(zero Rock Paper Scissors)
compChoice=$(( ($RANDOM % 3) + 1 ))

echo "Computers' choice:  ${rps[$compChoice]}"
echo "Your choice $userChoice"

#keep track of the number of games
games=$(( $games + 1 ))

# if they tie
if [ $userChoice = ${rps[$compChoice]} ] ; then
	echo "Tie!"
	tie=$(( $tie + 1 ))	
#  if statements for user choice winning
# if rock beats scissors
elif [ $userChoice = "Rock" ] && [ ${rps[$compChoice]} = "Scissors" ] ; then
	echo "Your Rocks beat Scissors!"
	userWins=$(( $userWins + 1 ))
	winner="User"
# if paper beats rock
elif [ $userChoice = "Paper" ] && [ ${rps[$compChoice]} = "Rock" ] ; then
        echo "Your Paper beat Rock!"
	userWins=$(( $userWins + 1 ))
        winner="User"
# if scissors beats paper
elif [ $userChoice = "Scissors" ] && [ ${rps[$compChoice]} = "Paper" ] ; then
        echo "Your Scissors beat Paper!"
	userWins=$(( $userWins + 1 ))
        winner="User"
# if statement for the computers choice winning
# if rock beats scissors
elif [ $userChoice = "Scissors" ] && [ ${rps[$compChoice]} = "Rock" ] ; then
        echo "Your Scissors get beat by Rock!"
	compWins=$(( $compWins + 1 ))
        winner="Computer"
# if paper beats rock
elif [ $userChoice = "Rock" ] && [ ${rps[$compChoice]} = "Paper" ] ; then
        echo "Your Rock gets beat by Paper!"
	compWins=$(( $compWins + 1 ))
        winner="Computer"
# if scissors beats paper
elif [ $userChoice = "Paper" ] && [ ${rps[$compChoice]} = "Scissors" ] ; then
        echo "Your Paper gets beat by Scissors!"
	compWins=$(( $compWins + 1 ))
        winner="Computer"
else        
	echo "Please choose Rock, Paper, or Scissors"
fi
# make the directory to store RPS information
mkdir -p "$dirName"
echo "Time stamp:$timeStamp" >> ./$dirName/$fileName
echo "Users choice:$userChoice" >> ./$dirName/$fileName
echo "Computers choice:${rps[$compChoice]}" >> ./$dirName/$fileName
echo "Winner: $winner" >> ./$dirName/$fileName
echo "Choose(Paper, Scissors, Rock, or q to  quit)"
read userChoice
done
echo "Well Played!"
