#!/usr/bin/env bash

# processing
/usr/bin/processing-java --force --sketch=/home/simdax/.local/share/SuperCollider/Extensions/live/processing/rubiksCube/ --run --output=/home/simdax/.local/share/SuperCollider/Extensions/live/processing/rubiksCube/output &

#supercollider
sclang -D test.scd
