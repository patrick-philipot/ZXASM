#!/bin/bash

if [ -f _snapshot.sna ]
then

    echo "Renaming _snapshot.sna to" $1.sna
    mv _snapshot.sna $1.sna

    echo "Renaming _tape.tap to" $1.tap
    mv _tape.tap $1.tap

fi

