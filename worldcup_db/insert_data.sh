#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Truncate table at beginning
echo $($PSQL "TRUNCATE TABLE games, teams")

## Reading csv file and skiping headline
tail -n +2 games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WG OG
do 
## First load teams into teams table
# get winner and opponent id's
WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
# if not found load into teams table
if [[ -z $WINNER_ID ]]
then
echo $($PSQL "insert into teams(name) values('$WINNER')")
fi
if [[ -z $OPPONENT_ID ]]
then
echo $($PSQL "insert into teams(name) values('$OPPONENT')")
fi

## Loading data into games table, make sure foreign key is correct
# Query for team_id for opponent and winner from teams table
WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
# Insert data
echo $($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WG, $OG)")
done
echo "Everything done!"
