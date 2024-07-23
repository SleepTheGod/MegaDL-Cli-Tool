# MegaDL CLI Tool

## Description

The MegaDL CLI Tool is a command-line utility for downloading files from MEGA.nz links and extracting them using `unrar`. This tool supports Linux, macOS, and Windows (using Git Bash or MinGW). It simplifies the process of downloading and extracting MEGA files with just a few commands.

## Features

- Download files from MEGA.nz links using `megadl`.
- Extract `.rar` files using `unrar`.
- Cross-platform support (Linux, macOS, Windows).

## Installation

### Dependencies

Before running the tool, ensure you have the following dependencies installed:

- **megadl**: Part of the `megatools` package.
- **unrar**: Tool for extracting `.rar` files.

### Linux

To install dependencies on Linux, run:

# bash
sudo apt update
sudo apt install -y megatools unrar

# macOS
To install dependencies on macOS, run
brew install megatools unrar

# Usage
Running the Tool
Run the script with the following command
bash main.sh 

# Options
-h, --help: Show help message.
-u, --url <link>: Specify the MEGA link to download.

# Example
bash main.sh -u "https://mega.nz/file/yourfilelink"

# If no URL is provided via command-line options, you will be prompted to enter it.

Script Overview
Dependencies Check: The script checks and installs megatools and unrar based on your operating system.
Download: Downloads the file from the provided MEGA link.
Extraction: Extracts the downloaded file using unrar.
License
This project is licensed under the MIT License. See the LICENSE file for details.

Contributing
Contributions are welcome! Please fork the repository and submit pull requests for any enhancements or bug fixes.
