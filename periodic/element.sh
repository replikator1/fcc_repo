#! /bin/bash

# Initialize command to simpler query
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align --tuples-only -c"

# Check if user run program without argument
if [[ $# -eq 0 ]]
then
  echo -e "Please provide an element as an argument."
else
  #User provide number or symbol or full name of element
  # user input is number
  if [[ $1 =~ ^[0-9] ]]
  then
    # Query for informations
    ATOMIC_NUMBER=$1
    SYMBOL=$($PSQL "select symbol from elements where atomic_number = $1")
    NAME=$($PSQL "select name from elements where atomic_number = $1")
  # user input is symbol
  elif [[ $1 =~ ^[A-Z]{1}[a-zA-Z]{0,1}$ ]]
  then
    # Query for informations
    SYMBOL=$1
    NAME=$($PSQL "select name from elements where symbol = '$1'")
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol = '$1'")
  # user input is full name 
  else
    # Query for informations
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where name = '$1'")
    SYMBOL=$($PSQL "select symbol from elements where name = '$1'")
    NAME=$1
  fi
  # Check if provided element is in db
  if [[ -z $SYMBOL ]]
    then
      echo "I could not find that element in the database."
  else 
  # Query for additional info
  ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
  MELTING_POINT=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
  BOILING_POINT=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
  T=$($PSQL "select type_id from properties where atomic_number=$ATOMIC_NUMBER")
  TYPE=$($PSQL "select type from types where type_id = $T")
  # Display all quered info
  echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi

