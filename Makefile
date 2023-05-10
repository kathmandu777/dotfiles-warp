# Do everything.
all: init link # defaults brew setup other_apps

# Set initial preference.
init:
	@echo "\033[0;34mRun init.sh\033[0m"
	@bin/init.sh
	@echo "\033[0;34mDone.\033[0m"

# Link dotfiles.
link:
	@echo "\033[0;34mRun link.sh\033[0m"
	@bin/link.sh
	@echo "\033[0;32mDone.\033[0m"

# # Set macOS system preferences.
# defaults:
# 	@echo "\033[0;34mRun defaults.sh\033[0m"
# 	@bin/defaults.sh
# 	@echo "\033[0;32mDone.\033[0m"

# # Install macOS applications.
# brew:
# 	@echo "\033[0;34mRun brew.sh\033[0m"
# 	@bin/brew.sh
# 	@echo "\033[0;32mDone.\033[0m"

# # Setup tools.
# setup:
# 	@echo "\033[0;34mRun setup.sh\033[0m"
# 	@bin/setup.sh
# 	@echo "\033[0;32mDone.\033[0m"

# # Setup Other apps
# other_apps:
# 	@echo "\033[0;34mRun other_apps.sh\033[0m"
# 	@bin/other_apps.sh
# 	@echo "\033[0;32mDone.\033[0m"