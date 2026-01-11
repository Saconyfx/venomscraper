# venomscraper
A web scraping tool designed to extract various types of data from websites.

## Table of Contents
* [Introduction](#introduction)
* [Features](#features)
* [Requirements](#requirements)
* [Installation](#installation)
* [Usage](#usage)
* [Options](#options)
* [Output](#output)
* [Troubleshooting](#troubleshooting)
* [License](#license)
* [Contributing](#contributing)
* [Disclaimer](#disclaimer)

## Introduction
VenomScraper is a command-line web scraping tool written in Bash. It's designed to extract various types of data from websites, including emails, phone numbers, image URLs, website links, file links, video URLs, audio URLs, PDF URLs, CSV URLs, JSON URLs, XML URLs, and social media handles.

## Features
* Extracts emails, phone numbers, image URLs, website links, file links, video URLs, audio URLs, PDF URLs, CSV URLs, JSON URLs, XML URLs, and social media handles from websites
* Supports multiple user agents to avoid being blocked by websites
* Can handle large amounts of data
* Outputs data to text files

## Requirements
* Bash 4.0 or later
* curl 7.0 or later
* pyfiglet 2.0 or later

## Installation
To install VenomScraper, follow these steps:

1. Clone the repository: `git clone https://github.com/Saconyfx/VenomScraper.git`
2. Change into the repository directory: `cd VenomScraper`
3. Run the installation script: `./install.sh`

## Usage
To use VenomScraper, follow these steps:

1. Run the script: `./venomscraper.sh`
2. Enter the URL of the website you want to scrape: `Enter URL to scrape: https://example.com`
3. Enter the username to scrape (leave blank to scrape all): `Enter username to scrape (leave blank to scrape all):`
4. Select the data types to scrape: `Scrape emails? (y/n): y`
5. Wait for the script to finish scraping the data

## Options
The following options are available:

* `--help`: Display help message
* `--version`: Display version number
* `--url`: Specify the URL of the website to scrape
* `--username`: Specify the username to scrape
* `--email`: Scrape emails
* `--phone`: Scrape phone numbers
* `--image`: Scrape image URLs
* `--link`: Scrape website links
* `--file`: Scrape file links
* `--video`: Scrape video URLs
* `--audio`: Scrape audio URLs
* `--pdf`: Scrape PDF URLs
* `--csv`: Scrape CSV URLs
* `--json`: Scrape JSON URLs
* `--xml`: Scrape XML URLs
* `--social-media`: Scrape social media handles

## Output
The script will output the scraped data to the following text files:

* `email_output.txt`: Emails
* `phone_output.txt`: Phone numbers
* `image_output.txt`: Image URLs
* `link_output.txt`: Website links
* `file_output.txt`: File links
* `video_output.txt`: Video URLs
* `audio_output.txt`: Audio URLs
* `pdf_output.txt`: PDF URLs
* `csv_output.txt`: CSV URLs
* `json_output.txt`: JSON URLs
* `xml_output.txt`: XML URLs
* `social_media_output.txt`: Social media handles

## Troubleshooting
If you encounter any issues while using VenomScraper, try the following:

* Check the URL of the website you're trying to scrape
* Check the username you're trying to scrape
* Check the data types you're trying to scrape
* Check the output files for errors

# License
Venomscrapper is released under the GNU General Public License version 3 (GPL-3.0). See the LICENSE file for details.

GPL-3.0 License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later vers>

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/.

# Contributing
Contributions are welcome! If you'd like to contribute to Venomscrapper, please fork the repository and submit a pull request.

# Disclaimer

Venomscrapper is designed for educational purposes only. It should not be used for malicious activities
By using Venomscrapper, you acknowledge that you have read and understood the terms of the GPL-3.0 License and agree to abide by them.


