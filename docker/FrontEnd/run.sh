#!/bin/bash

exec python3 ./callInterface.py &
exec python3 ./receiveInterface.py &
exec python3 ./Production.py
