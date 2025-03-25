# Browser_History_Delete

A powerful batch script tool to automatically close multiple browsers and clear all browser data—including browsing history, cookies, cache, saved passwords, bookmarks, and extensions—in one go.

> **Warning:** This tool **permanently deletes** all browser data. Use it only if you fully understand the consequences.

---

## Table of Contents

- [Features](#features)
- [Usage](#usage)
- [How It Works](#how-it-works)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Important Considerations](#important-considerations)
- [License](#license)
- [Contributing](#contributing)
- [Acknowledgements](#acknowledgements)

---

## Features

- **Multi-Browser Support:**  
  Supports Google Chrome, Mozilla Firefox, Microsoft Edge, Opera, Opera GX, Brave, and Vivaldi.

- **Comprehensive Cleanup:**  
  Deletes browsing history, cookies, cache, saved passwords, bookmarks, and extensions.

- **Logging:**  
  Generates a timestamped log file that records every action performed by the script.

- **User Confirmation:**  
  Displays warnings and waits for user confirmation before executing irreversible actions.

- **Automation:**  
  Closes open browser processes and clears temporary files automatically.

---

## Usage

1. **Download the Script:**  
   Clone or download this repository to your local machine.

2. **Review the Code:**  
   Open the batch file in a text editor to review and customize paths or browser names if needed.

3. **Run as Administrator:**  
   Right-click the script and select **Run as Administrator** to ensure it has the necessary permissions.

4. **Confirm Execution:**  
   Read the warning message carefully and press any key to proceed with clearing browser data.

---

## How It Works

1. **Browser Closure:**  
   The script first closes any running browser processes using the `taskkill` command.

2. **Data Deletion:**  
   It then deletes user data directories where browsers store their profiles. This removes history, cookies, cache, and more.

3. **Temporary File Cleanup:**  
   Additionally, it clears temporary files that may include remnants of browser cache (e.g., `.tmp` and `.crdownload` files).

4. **Logging:**  
   All operations are logged to a timestamped log file saved in the system’s temporary directory.

---

## Prerequisites

- **Operating System:**  
  Windows (the script is tailored for Windows environments)

- **Permissions:**  
  Administrator rights are required to delete system files and close browser processes.

---

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/lighty7/Browser_History_Delete.git
