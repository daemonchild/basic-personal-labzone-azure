
// Project: Basic Personal Cloud Labzone
// Author:  Daemonchild
// Purpose: Build a basic environment for running other things

#    __ _ _____   _ _ __ ___ 
#   / _` |_  / | | | '__/ _ \
#  | (_| |/ /| |_| | | |  __/
#   \__,_/___|\__,_|_|  \___|   Version
                                            
// Utility 'Functions'

// When a unique name is required, append this:
resource "random_string" "random_suffix" {
  length  = 6
  special = false
  upper   = false
}

// End of file