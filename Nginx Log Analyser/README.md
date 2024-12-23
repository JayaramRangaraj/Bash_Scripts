Nginx Log Analyzer

Project Description

This project provides a shell script tool to analyze Nginx access logs from the command line. It is designed to help users practice and refine their shell scripting skills by extracting meaningful insights from server log data.

The script processes an Nginx access log file and outputs key statistics, including:

1. Top 5 IP addresses with the most requests.


2. Top 5 most requested URLs.


3. Top 5 HTTP response status codes.


4. Top 5 User-Agent strings.



Features

Log Analysis: Extracts and displays critical information from the log file in a user-friendly format.

Customization: Easy to modify and extend for additional analysis.

Efficiency: Leverages awk, sort, uniq, cut, and other Unix tools for fast data processing.


Prerequisites

A Unix-based system with shell access.

Basic knowledge of shell scripting.

Nginx access log file (download from the project description or use your own).


Usage

Script Requirements

Ensure the following tools are installed and accessible on your system:

awk

sort

uniq

cut

grep


Running the Script

1. Save the script as log_analyzer.sh.


2. Make the script executable:

chmod +x log_analyzer.sh


3. Execute the script with the log file as an argument:

./log_analyzer.sh access.log



Example Output

---Nginx Log Analyze---

---Top 5 IP addresses---
45.76.135.253 - 1000 requests
142.93.143.8 - 600 requests
178.128.94.113 - 50 requests
43.224.43.187 - 30 requests
178.128.94.113 - 20 requests

---Top 5 requested URLs---
/api/v1/users - 1000 requests
/api/v1/products - 600 requests
/api/v1/orders - 50 requests
/api/v1/payments - 30 requests
/api/v1/reviews - 20 requests

---Top 5 HTTP response codes---
200 - 1000 requests
404 - 600 requests
500 - 50 requests
401 - 30 requests
304 - 20 requests

---Top 5 User-Agents---
Mozilla/5.0 - 800 requests
curl/7.68.0 - 400 requests
PostmanRuntime/7.26.8 - 200 requests

Error Handling

If no log file is provided, the script will display an error message:

File is required

Code Explanation

1. File Validation: Ensures a file is provided as input.


2. Top 5 IP Addresses: Uses awk to extract the first column (IP addresses), sorts them, and finds the top 5 most frequent entries.


3. Top 5 URLs: Extracts the request path using cut, sorts and counts occurrences, and displays the top 5.


4. HTTP Response Codes: Extracts the 9th field, filters valid status codes with grep, and displays the top 5.


5. User-Agents: Extracts the User-Agent string using cut, sorts, and displays the top 5 entries.

