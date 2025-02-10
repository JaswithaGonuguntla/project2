#!/bin/bash

# Function to count files in the directory
count_files() {
  ls -l | grep -c "^-"  # Count regular files only (not directories)
}

# Main game loop
play_game() {
  local actual_count=$(count_files)

  echo "How many files are in the current directory?"

  while true; do
    read -p "Enter your guess: " user_guess

    if [[ ! "$user_guess" =~ ^[0-9]+$ ]]; then #check for valid integer input
      echo "Invalid input. Please enter a number."
      continue
    fi

    if [[ "$user_guess" -lt "$actual_count" ]]; then
      echo "Too low!"
    elif [[ "$user_guess" -gt "$actual_count" ]]; then
      echo "Too high!"
    else
      echo "Congratulations! You guessed correctly."
      break  # Exit the loop
    fi
  done
}

play_game # Start the game
