#!/bin/bash

echo "Start Zenzo Server"
cd /
./zenzo-2.1.0/bin/zenzod

echo "Start Zenzo Forge"

cd /forge/lib
pm2 start index.js