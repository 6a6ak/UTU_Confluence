#!/bin/bash

function install_java() {
    echo "Installing Java..."
    sudo apt update
    sudo apt install -y openjdk-11-jdk
    java -version
    echo "Java installation complete."
}

function download_confluence() {
    echo "Downloading Confluence..."
    mkdir -p ~/confluence-install
    cd ~/confluence-install
    wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-8.5.5-x64.bin
    chmod +x atlassian-confluence-8.5.5-x64.bin
    echo "Confluence installer downloaded and ready to execute."
}

function install_confluence() {
    echo "Starting the Confluence installation process..."
    if [ ! -f ~/confluence-install/atlassian-confluence-8.5.5-x64.bin ]; then
        echo "Confluence installer file not found."
        return 1
    fi
    sudo ~/confluence-install/atlassian-confluence-8.5.5-x64.bin
    echo "Confluence installation process initiated."
}

while true; do
    echo "Select an option:"
    echo "1. Install Java"
    echo "2. Download Confluence"
    echo "3. Install Confluence"
    echo "0. Exit"
    read -p "Enter option: " option

    case $option in
        1) install_java ;;
        2) download_confluence ;;
        3) install_confluence ;;
        0) break ;;
        *) echo "Invalid option";;
    esac
done
