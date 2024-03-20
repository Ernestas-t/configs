#!/bin/bash

# Check if a tmux session named 'coding' exists
if ! tmux has-session -t coding 2>/dev/null; then
    # If not, create a new session named 'coding' with a window named 'Backend'
    tmux new-session -d -s coding -n Backend

    # Split the window vertically, making the new pane 2 lines tall
    tmux split-window -v -l 2

    # Send commands to the first pane
    tmux send-keys -t 1 "cd ~/Coding/Nuolaidauk-Stage/Backend; vim" C-m
    tmux send-keys -t 1 " " n

    # Send commands to the second pane
    tmux send-keys -t 2 "cd ~/Coding/Nuolaidauk-Stage/Backend/venv/bin/; source activate; cd ~/Coding/Nuolaidauk-Stage/Backend/; clear" C-m
    tmux send-keys -t 2 "clear" C-m
    tmux send-keys -t 2 "python manage.py runserver 3000"

    # Create a new window named 'Frontend'
    tmux new-window -n Frontend

    # Split the window vertically, making the new pane 2 lines tall
    tmux split-window -v -l 2

    # Send commands to the first pane
    tmux send-keys -t 1 "cd ~/Coding/Nuolaidauk-Stage/Frontend; vim" C-m
    tmux send-keys -t 1 " " n

    # Send commands to the second pane
    tmux send-keys -t 2 "cd ~/Coding/Nuolaidauk-Stage/Frontend" C-m
    tmux send-keys -t 2 "clear" C-m
    tmux send-keys -t 2 "npm start"

    # Select the first pane
    tmux select-pane -t 1
fi

# Check if a tmux session named 'notes' exists
if ! tmux has-session -t notes 2>/dev/null; then
    # If not, create a new session named 'notes' with a window named 'Notes'
    tmux new-session -d -s notes -n Notes

    # Send commands to the first pane
    tmux send-keys -t 1 "cd ~/notes; vim index.norg" C-m
fi

# Check if a tmux session named 'odoo' exists
if ! tmux has-session -t odoo 2>/dev/null; then
    # If not, create a new session named 'odoo' with a window named 'Odoo'
    tmux new-session -d -s odoo -n Odoo

    # Send commands to the first pane
    tmux send-keys -t 1 "cd ~/Work/odoo" C-m
    tmux send-keys -t 1 "clear" C-m
    tmux send-keys -t 1 "python3 odoo-bin -c odoo.conf -d game"
fi

# Attach to the 'coding' session
tmux attach -t coding
