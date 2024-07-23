#!/bin/bash

# ASCII Art to display when the tool is run for the first time
ASCII_ART=" ██████   ██████                                ██████████   █████          ███████████                   ████ 
░░██████ ██████                                ░░███░░░░███ ░░███          ░█░░░███░░░█                  ░░███ 
 ░███░█████░███   ██████   ███████  ██████      ░███   ░░███ ░███          ░   ░███  ░   ██████   ██████  ░███ 
 ░███░░███ ░███  ███░░███ ███░░███ ░░░░░███     ░███    ░███ ░███              ░███     ███░░███ ███░░███ ░███ 
 ░███ ░░░  ░███ ░███████ ░███ ░███  ███████     ░███    ░███ ░███              ░███    ░███ ░███░███ ░███ ░███ 
 ░███      ░███ ░███░░░  ░███ ░███ ███░░███     ░███    ███  ░███      █       ░███    ░███ ░███░███ ░███ ░███ 
 █████     █████░░██████ ░░███████░░████████    ██████████   ███████████       █████   ░░██████ ░░██████  █████
░░░░░     ░░░░░  ░░░░░░   ░░░░░███ ░░░░░░░░    ░░░░░░░░░░   ░░░░░░░░░░░       ░░░░░     ░░░░░░   ░░░░░░  ░░░░░ 
                          ███ ░███                                                                             
                         ░░██████                                                                              
                          ░░░░░░                                                                               
"

# Display ASCII art
echo "$ASCII_ART"

# Function to check and install megatools and unrar
install_dependencies() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux specific installation
        if ! command -v megadl &> /dev/null; then
            echo "megadl could not be found, installing megatools..."
            sudo apt update
            sudo apt install -y megatools
        fi
        if ! command -v unrar &> /dev/null; then
            echo "unrar could not be found, installing unrar..."
            sudo apt update
            sudo apt install -y unrar
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS specific installation
        if ! command -v megadl &> /dev/null; then
            echo "megadl could not be found, installing megatools..."
            brew install megatools
        fi
        if ! command -v unrar &> /dev/null; then
            echo "unrar could not be found, installing unrar..."
            brew install unrar
        fi
    elif [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
        # Windows with Git Bash or MinGW specific installation
        if ! command -v megadl &> /dev/null; then
            echo "megadl could not be found, please install megatools manually from https://megatools.megous.com/"
            exit 1
        fi
        if ! command -v unrar &> /dev/null; then
            echo "unrar could not be found, please install unrar manually from https://www.rarlab.com/rar_add.htm"
            exit 1
        fi
    else
        echo "Unsupported OS type: $OSTYPE"
        exit 1
    fi
}

# Function to display usage information
show_help() {
    echo "Usage: megadl [OPTIONS]"
    echo
    echo "Options:"
    echo "  -h, --help     Show this help message and exit"
    echo "  -u, --url      Specify the MEGA link to download"
}

# Parse command-line arguments
MEGA_LINK=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -u|--url)
            MEGA_LINK="$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter passed: $1"
            show_help
            exit 1
            ;;
    esac
done

if [[ -z "$MEGA_LINK" ]]; then
    read -p "Please enter the MEGA link to download: " MEGA_LINK
fi

# Install dependencies
install_dependencies

# Download the file
echo "Downloading file from MEGA..."
megadl "$MEGA_LINK"

# Extract the file name from the MEGA link (the downloaded file name)
FILE_NAME=$(ls -t | head -n 1)  # Get the most recently downloaded file

# Check if the downloaded file exists
if [[ -f $FILE_NAME ]]; then
    echo "Extracting $FILE_NAME..."
    unrar x "$FILE_NAME"
else
    echo "Error: File $FILE_NAME not found!"
fi

echo "Download and extraction complete."

# Define the file name for extraction check
FILE_NAME="xsec.rar"

# Check if the file exists
if [[ -f $FILE_NAME ]]; then
    echo "Extracting $FILE_NAME..."
    unrar x "$FILE_NAME"
else
    echo "Error: File $FILE_NAME not found!"
fi

echo "Extraction complete."
