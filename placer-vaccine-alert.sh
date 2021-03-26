#!/bin/bash

FL_OUTPUT=$(curl "https://www.placer.ca.gov/vaccineclinics#grounds")
FIFTY_PLUS='50+'
APRIL_FIRST='April 1'

FILE=/tmp/vaccine-alert-fired
if [[ "$FL_OUTPUT" == *"$FIFTY_PLUS"* || "$FL_OUTPUT" == *"$APRIL_FIRST"* ]]; then
  if ! test -f "$FILE"; then
    touch $FILE
    aws sns publish --region "us-east-1" --target-arn "" --message "Vaccine Available for 50+. Go to https://www.placer.ca.gov/vaccineclinics#grounds"
  fi
fi
