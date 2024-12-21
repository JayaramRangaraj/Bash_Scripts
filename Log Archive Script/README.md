https://roadmap.sh/projects/log-archive-tool


# Log Archive Script
---

This script is used to archive log directories (e.g., `/var/log/apache2`) into a compressed `.tar.gz` file. The archive is stored in the user's home directory under the `log_archive/` folder.

## Features

- **Directory Checking**: Verifies if the specified log directory exists.
- **Prompt for Confirmation**: If no directory is passed, it prompts the user to confirm whether to archive the entire `/var/log` directory.
- **Error Handling**: Gracefully handles errors such as missing directories or failed archiving.

## Prerequisites

- A Unix-based system (e.g., Ubuntu)
- `tar` and `sudo` installed

## Usage

### 1. **Archive a Specific Directory**

To archive a specific log directory, run the script with the directory path as an argument. For example, to archive `/var/log/apache2`:

```bash
./log-archive /var/log/apache2
```

If the directory doesn't exist, the script will display a message like:

```
Directory /var/log/apache2 does not exist.
These are the AVAILABLE LOGS :
apache2
syslog
...
```

### 2. **Archive the Default `/var/log` Directory**

If no directory is specified, the script will prompt you to confirm whether to archive the entire `/var/log` directory:

```bash
./log-archive
```

It will ask:

```
No directory is passed. Archive the entire LOG DIRECTORY /var/log (y/n):
```

If you answer `y`, it will proceed to archive the entire `/var/log` directory into a `.tar.gz` file.

### 3. **Output Location**

The archive is saved in your home directory under `log_archive/` with the filename format:

```
logs_archive_<current_date_time>.tar.gz
```

For example:

```
/home/ubuntu/log_archive/logs_archive_2024-12-21_07-55-32.tar.gz
```

### 4. **Exit Without Archiving**

If you answer `n` when prompted, the script will exit without archiving:

```
Exiting without archiving.
```

## Example Output

- **Successful Archive Creation**:
    
    ```
    Archive created successfully at: /home/ubuntu/log_archive/logs_archive_2024-12-21_07-55-32.tar.gz
    ```
    
- **Directory Not Found**:
    
    ```
    Directory /var/log/apache2 does not exist.
    These are the AVAILABLE LOGS :
    apache2
    syslog
    ...
    ```
    
- **Exit Without Archiving**:
    
    ```
    No directory is passed. Archive the entire LOG DIRECTORY /var/log (y/n):
    n
    Exiting without archiving.
    ```
    
