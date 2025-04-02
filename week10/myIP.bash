#!/bin/bash

ip addr | grep -oP "inet \K10\.0\.17\.7"
