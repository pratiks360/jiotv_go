#!/bin/bash


JIOTV_GO="/root/.jiotv_go/bin/jiotv_go"
# Check if port 5001 is open on host 7.0.0.10
nc -zv 7.0.0.10 5001

# If the above command has an error, then the port is not open
if [ $? -ne 0 ]; then
    echo "Port 5001 is not open, restarting service..."
    # Restart the service
    $JIOTV_GO bg start --args "--host 7.0.0.10 --port 5001"
else
    echo "Port 5001 is open."
fi