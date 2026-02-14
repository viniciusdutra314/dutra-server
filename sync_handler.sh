#!/bin/sh

cleanup() {
    echo "SIGTERM received! Running Destructor Sync..."
    #rsync -av --delete /ssd_path/ /hdd_path/
    echo "Destructor sync complete. Goodbye."
    exit 0
}

trap 'cleanup' SIGTERM
echo "Waiting for stack shutdown..."
sleep infinity & wait $!
