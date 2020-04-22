#!/bin/bash
set -e

echo "Entering entry point"

if [ ! -f /already_run ]; then
    echo "Step: touch already_run"
    touch /already_run
    echo "Step: exec $@"
    exec "$@"
fi

echo "Leaving entry point"
