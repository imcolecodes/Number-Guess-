#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c" 

echo Enter your username:
read USERNAME

DATABASE_USERNAME=$($PSQL "SELECT username FROM players WHERE username='$USERNAME'")
if [[ -z $DATABASE_USERNAME ]]
then 
  echo Welcome, $USERNAME! It looks like this is your first time here.
  INSERT=$($PSQL "INSERT INTO players(username, games_played) VALUES('$USERNAME', 1)")
else 
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_score FROM players WHERE username='$USERNAME'")
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  UPDATE=$($PSQL "UPDATE players SET games_played=$GAMES_PLAYED+1 WHERE USERNAME='$USERNAME'")
fi

NUMBER=$(( RANDOM % 1001 ))
echo "Guess the secret number between 1 and 1000:"
read GUESS
NUMBER_OF_GUESSES=1


while [ "$GUESS" != "$NUMBER" ]
  do 
    if [[ ! "$GUESS" =~ ^[+-]?[0-9]+$ ]]
    then 
      echo "That is not an integer, guess again: " 
      read GUESS
    else
      (( NUMBER_OF_GUESSES++ ))
      if [ $GUESS -gt $NUMBER ]
      then
        echo -e "\nIt's lower than that, guess again:"
      else 
        echo -e "\nIt's higher than that, guess again:"
      fi
      read GUESS
    fi
done

BEST_GAME=$($PSQL "SELECT best_score FROM players WHERE username='$USERNAME'")

if [[ $NUMBER_OF_GUESSES > $BEST_GAME ]]
then
  UPDATE_BEST_GAME=$($PSQL "UPDATE players SET best_score=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
fi

PLAYER_ID=$($PSQL "SELECT id FROM players WHERE username='$USERNAME'")
INSERT_TO_SCOREBOARD=$($PSQL "INSERT INTO score_board(player_id, score) VALUES($PLAYER_ID, $NUMBER_OF_GUESSES)")
echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"
 
