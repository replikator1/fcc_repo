#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Initialize number to guess
TO_GUESS=$(($RANDOM % 1001))
echo $TO_GUESS

# Asking for user name
echo -e "\nEnter your username: "
read USER
# Query in db if user is present
USER_IN_DB=$($PSQL "select name from users where name = '$USER'")
if [[ -z $USER_IN_DB ]]
then
# If user is not present, create new user -> add him to db
    ADD_USER_TO_DB=$($PSQL "INSERT INTO users (name) VALUES ('$USER')")
    echo "Welcome, $USER! It looks like this is your fist time here."
else
# If user is present -> greet him
    echo user present
    # TODO: take stats and display greeting message
fi
READ_USER_ID=$($PSQL "select user_id from users where name='$USER'")
echo $TO_GUESS
# Start the game
read -p "Guess the secret number between 1 and 1000: " GUESS
INIT_GAME=$($PSQL "INSERT INTO games (user_id, to_guess) VALUES ('$READ_USER_ID', $TO_GUESS)")

# If users guess correctly within first attempt: 
if [ $GUESS -eq $TO_GUESS ]
then
    echo "You guessed it in 1 try. The secret number was $TO_GUESS. Nice job!"
    UPDATE_AFTER_WON=$($PSQL "update games set won=true where user_id = $READ_USER_ID and to_guess=$TO_GUESS")
else
    # If didn't get it correctly then loop until he does
    while [ $GUESS -ne $TO_GUESS ]
    do
        UPDATE_TRIES_CNT=$($PSQL "update games set tries = tries +1 where user_id=$READ_USER_ID and to_guess=$TO_GUESS")
        if [ $GUESS -gt $TO_GUESS ]
        then
            read -p "It's lower than that, guess again: " GUESS
        else
            read -p "It's higher than that, guess again: " GUESS
        fi

    done
    # Summary of game and congrats display
    TRIES=$($PSQL "select tries from games where user_id=$READ_USER_ID and to_guess=$TO_GUESS")
    echo -e "\nYou guessed it in $TRIES tries. The secret number was $TO_GUESS. Nice job!"
fi
