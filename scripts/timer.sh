#!/bin/bash
 
convert_to_seconds() {
    # ... (reuse the convert_to_seconds function from Enhancement 2)
    local time_str=$1
    local total_seconds=0
    while [[ $time_str =~ ([0-9]+)([hms]) ]]; do
        local value=${BASH_REMATCH[1]}
        local unit=${BASH_REMATCH[2]}
        case $unit in
            h) total_seconds=$((total_seconds + value * 3600)) ;;
            m) total_seconds=$((total_seconds + value * 60)) ;;
            s) total_seconds=$((total_seconds + value)) ;;
        esac
        time_str=${time_str#*"${BASH_REMATCH[0]}"}
    done
    if [ -n "$time_str" ]; then
        echo "Error: Invalid time format. Use h (hours), m (minutes), s (seconds). Example: 1h30m" >&2
        exit 1
    fi
    echo $total_seconds
}
 
# Check for input
if [ $# -eq 0 ]; then
    echo "Error: Please provide a duration. Usage: $0 <time> (e.g., 5m, 1h30m, 45s)" >&2
    exit 1
fi
 
total_seconds=$(convert_to_seconds "$1")
if [ $total_seconds -le 0 ]; then
    echo "Error: Please enter a positive duration." >&2
    exit 1
fi
 
# Countdown loop with HH:MM:SS formatting
while [ $total_seconds -gt 0 ]; do
    # Calculate hours, minutes, remaining seconds
    hours=$((total_seconds / 3600))
    remaining_seconds=$((total_seconds % 3600))
    minutes=$((remaining_seconds / 60))
    seconds=$((remaining_seconds % 60))
 
    # Format with leading zeros (e.g., 01:05:03)
    printf -v formatted_time "%02d:%02d:%02d" $hours $minutes $seconds
 
    # Print formatted time
    clear
    figlet -f Bigfig.flf "$formatted_time"
    sleep 1
    total_seconds=$((total_seconds - 1))
done
 
echo -e "\rTimer complete!"
