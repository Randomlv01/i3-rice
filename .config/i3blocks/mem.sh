#!/bin/bash

mem=$(free -m | awk '/Speicher:/ {print $3}')

echo "  ${mem} M"
