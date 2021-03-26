#!/bin/bash

FL_OUTPUT=$(curl "https://www.exploretock.com/tfl/")
SUB='Reservations are unavailable'

FILE=/tmp/alert-fired
if [[ "$FL_OUTPUT" != *"$SUB"* ]]; then
  if ! test -f "$FILE"; then
    echo "It's not there."
    touch $FILE
    aws sns publish --region "us-east-1" --topic-arn "" --message "French Laundry is Accepting Reservations. Go to https://www.exploretock.com/tfl/ to reserve a table."
  fi
fi
