#!/bin/bash

# Log start time
echo "Running at $(date)" >> /Users/morrykolman/rand_git/desktop_clock/cron.log

# Source the shell profile
source ~/.bashrc  # or ~/.zshrc depending on your shell
echo "Sourced shell profile" >> /Users/morrykolman/rand_git/desktop_clock/cron.log

# Ensure pyenv is in the PATH
export PATH="$HOME/.pyenv/bin:$PATH"
echo "PATH: $PATH" >> /Users/morrykolman/rand_git/desktop_clock/cron.log

# Initialize pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
echo "Pyenv initialized" >> /Users/morrykolman/rand_git/desktop_clock/cron.log

# Activate the correct pyenv environment
pyenv activate desktop_clock
echo "Pyenv environment activated: $(pyenv version)" >> /Users/morrykolman/rand_git/desktop_clock/cron.log

# Verify Python version and packages
echo "Python version: $(python3 --version)" >> /Users/morrykolman/rand_git/desktop_clock/cron.log
echo "Pip list: $(pip list)" >> /Users/morrykolman/rand_git/desktop_clock/cron.log

# Navigate to the script directory
cd /Users/morrykolman/rand_git/desktop_clock/
echo "Changed directory to $(pwd)" >> /Users/morrykolman/rand_git/desktop_clock/cron.log

# Run the Python script
python3 /Users/morrykolman/rand_git/desktop_clock/make_arrow_once.py >> /Users/morrykolman/rand_git/desktop_clock/cron.log 2>&1
echo "Script executed" >> /Users/morrykolman/rand_git/desktop_clock/cron.log
