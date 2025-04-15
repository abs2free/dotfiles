# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/code/go/go-common-master/library/cache/redis"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "vim"; then

  # Create a new window inline within session layout definition.
  new_window "vim"

split_h 10

# Run commands.
run_cmd "vim ." 0 # runs in pane 1


select_pane 0

  # Load a defined window layout.
  #load_window "video"

  # Select the default active window on session creation.
  #select_window 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
