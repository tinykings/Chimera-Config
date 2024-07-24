#!/bin/bash

# Get the system uptime in seconds
UPTIME=$(awk '{print int($1)}' /proc/uptime)

# Check if the uptime is less than 300 seconds (5 minutes)
if [ "$UPTIME" -lt 300 ]; then
    # Sleep for the remaining time to complete 5 minutes
    sleep $((300 - UPTIME))
fi

exit 0
