#!/bin/bash

# Color codes
BrightRed="\e[1;91m"
BrightGreen="\e[1;92m"
BrightYellow="\e[1;93m"
BrightWhite="\e[1;97m"
BrightBlue="\e[1;94m"

# Function to install dependencies
install_dependencies() {
    echo -e "${BrightWhite}[${BrightYellow}*${BrightWhite}] ${BrightYellow}Checking and installing dependencies..."

    if ! command -v curl &> /dev/null; then
        echo -e "${BrightWhite}[${BrightRed}!${BrightWhite}] ${BrightRed}curl not found, installing..."
        sudo apt-get install curl -y
    fi

    if ! command -v pyfiglet &> /dev/null; then
        echo -e "${BrightWhite}[${BrightRed}!${BrightWhite}] ${BrightRed}pyfiglet not found, installing..."
        sudo apt-get install pyfiglet -y
    fi
}

# Function to display banner
display_banner() {
    clear
    echo -e "${BrightGreen}"
    banner=$(pyfiglet -f slant "VENOMSCRAPER")
    echo -e "$banner"
    echo -e "${BrightYellow}Developer: Saconyfx AKA Terminal Venom${BrightWhite}"
    echo -e "${BrightBlue}Portfolio: https://Saconychukwu.com${BrightWhite}"
    echo -e "${BrightRed}GitHub Profile: https://github.com/Saconyfx${BrightWhite}"
    echo -e "${BrightYellow}GitHub Repo: https://github.com/Saconyfx/VenomScraper${BrightWhite}"
    echo -e "${BrightGreen}Other Profile: https://linktr.ee/Chidubemc${BrightWhite}\n"
    echo -e "${BrightYellow}Welcome to ${BrightRed}VenomScraper${BrightYellow}, a web scraping tool.${BrightWhite}\n"
}

# Function to scrape data
scrape_data() {
    local target_url="$1"
    local username="$2"
    local grep_pattern="$3"
    local email_option="$4"
    local phone_option="$5"
    local image_option="$6"
    local link_option="$7"
    local file_option="$8"
    local video_option="$9"
    local audio_option="${10}"
    local pdf_option="${11}"
    local csv_option="${12}"
    local json_option="${13}"
    local xml_option="${14}"
    local social_media_option="${15}"

    user_agents=("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:53.0) Gecko/20100101 Firefox/53.0")

    for ((i=0; i<100; i++)); do
        user_agent=${user_agents[$RANDOM % ${#user_agents[@]}]}
        curl -s -H "User-Agent: $user_agent" "$target_url" > temp_file.txt

        if [[ -n "$username" ]]; then
            echo -e "${BrightWhite}Scraping data for username: ${BrightYellow}$username${BrightWhite}..."
            grep -iE "$grep_pattern" temp_file.txt > filtered_file.txt
            target_file="filtered_file.txt"
        else
            echo -e "${BrightWhite}No username provided. Scraping all available data...${BrightWhite}"
            target_file="temp_file.txt"
        fi

        # Perform scraping based on selected options
        [[ "$email_option" =~ ^[Yy]$ ]] && email_scrape "$target_file"
        [[ "$phone_option" =~ ^[Yy]$ ]] && phone_scrape "$target_file"
        [[ "$image_option" =~ ^[Yy]$ ]] && image_scrape "$target_file"
        [[ "$link_option" =~ ^[Yy]$ ]] && link_scrape "$target_file"
        [[ "$file_option" =~ ^[Yy]$ ]] && file_scrape "$target_file"
        [[ "$video_option" =~ ^[Yy]$ ]] && video_scrape "$target_file"
        [[ "$audio_option" =~ ^[Yy]$ ]] && audio_scrape "$target_file"
        [[ "$pdf_option" =~ ^[Yy]$ ]] && pdf_scrape "$target_file"
        [[ "$csv_option" =~ ^[Yy]$ ]] && csv_scrape "$target_file"
        [[ "$json_option" =~ ^[Yy]$ ]] && json_scrape "$target_file"
        [[ "$xml_option" =~ ^[Yy]$ ]] && xml_scrape "$target_file"
        [[ "$social_media_option" =~ ^[Yy]$ ]] && social_media_scrape "$target_file"

        # Clean up
        rm temp_file.txt filtered_file.txt 2> /dev/null

        sleep 1
    done
}

# Scrape functions
email_scrape() {
    grep -o '[A-Za-z0-9._%+-]\+@[A-Za-z0-9.-]\+\.[A-Za-z]\{2,4\}' "$1" | sort -u >> email_output.txt
}

phone_scrape() {
    grep -o '\([0-9]\{3\}-[0-9]\{3\}-[0-9]\{4\}\)\|\([0-9]\{10\}\)' "$1" | sort -u >> phone_output.txt
}

image_scrape() {
    grep -Eo '<img[^>]*src="([^"]+)"' "$1" | cut -d'"' -f2 | sort -u >> image_output.txt
}

link_scrape() {
    grep -Eo '<a[^>]*href="([^"]+)"' "$1" | cut -d'"' -f2 | sort -u >> link_output.txt
}

file_scrape() {
    grep -Eo 'https?://[^" ]+\.(pdf|docx|xlsx|zip|jpg|png|jpeg)' "$1" | sort -u >> file_output.txt
}

video_scrape() {
    grep -Eo 'https?://[^" ]+\.(mp4|avi|mov|wmv|flv|mkv)' "$1" | sort -u >> video_output.txt
}

audio_scrape() {
    grep -Eo 'https?://[^" ]+\.(mp3|wav|ogg|aac|flac)' "$1" | sort -u >> audio_output.txt
}

pdf_scrape() {
    grep -Eo 'https?://[^" ]+\.pdf' "$1" | sort -u >> pdf_output.txt
}

csv_scrape() {
    grep -Eo 'https?://[^" ]+\.csv' "$1" | sort -u >> csv_output.txt
}

json_scrape() {
    grep -Eo 'https?://[^" ]+\.json' "$1" | sort -u >> json_output.txt
}

xml_scrape() {
    grep -Eo 'https?://[^" ]+\.xml' "$1" | sort -u >> xml_output.txt
}

social_media_scrape() {
    grep -Eo '(https?://www\.twitter\.com/[^" ]+|https?://www\.instagram\.com/[^" ]+|https?://www\.facebook\.com/[^" ]+)' "$1" | sort -u >> social_media_output.txt
}

# Input and validation
main() {
    read -r -p "Enter URL to scrape: " target_url
    if [[ $target_url =~ ^https?:// ]]; then
        read -r -p "Enter username to scrape (leave blank to scrape all): " username
        if [[ -n "$username" ]]; then
            read -r -p "Does this username have variations? (y/n): " has_variations
            if [[ "$has_variations" =~ ^[Yy]$ ]]; then
                read -r -p "Enter username variations (comma-separated): " username_variations
                grep_pattern="${username_variations//,/|}"
            else
                grep_pattern="$username"
            fi
        fi

        # Ask for data types to scrape
        read -r -p "Scrape emails? (y/n): " email_option
        read -r -p "Scrape phone numbers? (y/n): " phone_option
        read -r -p "Scrape image URLs? (y/n): " image_option
        read -r -p "Scrape website links? (y/n): " link_option
        read -r -p "Scrape file links (e.g., PDFs)? (y/n): " file_option
        read -r -p "Scrape video URLs? (y/n): " video_option
        read -r -p "Scrape audio URLs? (y/n): " audio_option
        read -r -p "Scrape PDF URLs? (y/n): " pdf_option
        read -r -p "Scrape CSV URLs? (y/n): " csv_option
        read -r -p "Scrape JSON URLs? (y/n): " json_option
        read -r -p "Scrape XML URLs? (y/n): " xml_option
        read -r -p "Scrape social media handles? (y/n): " social_media_option

        scrape_data "$target_url" "$username" "$grep_pattern" "$email_option" "$phone_option" "$image_option" "$link_option" "$file_option" "$video_option" "$audio_option" "$pdf_option" "$csv_option" "$json_option" "$xml_option" "$social_media_option"
        echo "Scraping completed. Check the output files."
    else
        echo "Invalid URL. Please try again."
        main
    fi
}

# Run the script
install_dependencies
display_banner
main

