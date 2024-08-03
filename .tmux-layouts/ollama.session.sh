# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/code/ollama/ollama-gui"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "ollama"; then

  # Create a new window inline within session layout definition.
  new_window "ollama"

split_h 50

  run_cmd "ollama start" 0    # runs in active pane


# Run commands.
run_cmd "yarn dev --host" 1 # runs in pane 1


select_pane 0



  # Create a new window inline within session layout definition.
  #new_window "misc"

  # Load a defined window layout.
  #load_window "example"

  # Select the default active window on session creation.
  #select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
