# System Stats Script

This Bash script provides an overview of system statistics, including CPU usage, memory usage, system uptime, and the top resource-consuming processes. It is designed to give a quick snapshot of the system's health and performance.

## Features

- **System Information**: Displays OS version, system uptime, CPU usage, and load average.
- **Memory Usage Details**: Shows total memory, used memory, free memory, and available memory, along with percentages.
- **Top Processes**:
  - Lists the top 5 CPU-consuming processes.
  - Lists the top 5 memory-consuming processes.

## Usage

1. Copy the script into a file, e.g., `Script.sh`.
2. Make the script executable using:
   ```bash
   chmod +x Script.sh
   ```
3. Run the script:
   ```bash
   ./Script.sh
   ```

## Output

### Example Output:
```
---------------------------
        SYSTEM STATS       
---------------------------

OS Version : Ubuntu 20.04.5 LTS
System Uptime : 2 hours 35 minutes
CPU usage : 12.3%
Load Average : 0.14, 0.20, 0.18
Current User : user

--------MEMORY DETAILS------------
Total Memory         7988 MB
Used                 2450 MB      30.68%
Free                 1500 MB      18.78%
Available            4000 MB      50.12%

----Top 5 CPU-consuming processes----
COMMAND         %CPU
process1        25.0
process2        15.0
process3        10.0
...

---Top 5 MEMORY-consuming processes---
COMMAND         %MEM
processA        20.5
processB        15.3
processC        12.7
...
```

### Tools Used

- `top`: Provides CPU usage statistics.
- `uptime`: Displays system uptime and load averages.
- `free`: Provides memory usage details.
- `ps`: Lists processes with resource usage.
- `awk`: Used for text processing.
### Project URL
https://roadmap.sh/projects/server-stats




