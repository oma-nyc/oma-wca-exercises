#!/bin/bash 

#BLD_SCRIPT_VERSION=1

# Define variables
TARGET_HOST="your_rhel9_host"
TEMPLATE_FILE="/path/to/httpd.conf.template"
WWWROOT="/ibmroot/htdocs"
INDEX_HTML="/path/to/index.html"
PACKAGE_NAME="httpd"

# Function to install package
function InstallPackage {
    nsh -h $1 -e "yum install -y $2"
}

# Function to copy configuration file
function CopyConfig {
    nsh -h $1 -e "cp $2 $3"
}

# Function to create directory
function CreateDirectory {
    nsh -h $1 -e "mkdir -p $2"
}

# Function to copy index.html
function CopyIndexHTML {
    nsh -h $2 -e "cp $1 $3"
}

# Install httpd package
InstallPackage $TARGET_HOST $PACKAGE_NAME

# Sleep for a moment to ensure the installation is complete before copying config file
sleep 10

# Copy httpd.conf using template
CopyConfig $TARGET_HOST $TEMPLATE_FILE /etc/httpd/conf/httpd.conf

# Create wwwroot directory
CreateDirectory $TARGET_HOST $WWWROOT

# Copy index.html to wwwroot directory
CopyIndexHTML $INDEX_HTML $TARGET_HOST $WWWROOT/index.html
