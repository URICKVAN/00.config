# 🔐 SSH Key Management Module

A secure and structured SSH key management workflow built with Bash.

This project standardizes how SSH keys are integrated into a local
development environment, enforcing security best practices,
configuration automation, and operational consistency.

------------------------------------------------------------------------

## 📌 Overview

Managing SSH keys manually often leads to:

-   Disorganized key storage
-   Duplicate host aliases
-   Insecure file permissions
-   Manual configuration errors
-   Accidental key exposure in repositories

This module automates and standardizes the process while maintaining
strict security controls.

------------------------------------------------------------------------

## 🎯 Key Features

-   External key generation (Bitwarden)
-   Structured directory per key
-   Automated `ssh config` updates
-   Strict UNIX permission enforcement
-   SSH agent integration
-   Optional remote key provisioning
-   Defensive input validation
-   Git-safe design

------------------------------------------------------------------------

## 🏗 Project Structure

    00.ssh/
    ├── alta_ssh_key.sh
    ├── config
    ├── .gitignore
    └── <project_key>/
        ├── <project_key>_ed25519
        └── <project_key>_ed25519.pub

Each key is isolated in its own directory to maintain traceability and
prevent overlap.

------------------------------------------------------------------------

## 🔐 Security Model

### Key Generation

Keys are generated externally in:

Bitwarden Password Manager\
Algorithm: ed25519

Rationale:

-   Centralized encrypted vault
-   Hardware independent
-   Recoverable across machines
-   Avoids local key generation risks

------------------------------------------------------------------------

### Permission Hardening

The script enforces:

    chmod 700 <key_directory>
    chmod 600 <private_key>
    chmod 600 <public_key>
    chmod 600 config

This prevents:

-   SSH rejection due to permissive permissions
-   Unauthorized read access
-   Accidental exposure

------------------------------------------------------------------------

## ⚙️ Script Workflow

### 1️⃣ Input Validation

-   Non-empty key name
-   No whitespace
-   No duplicate directory
-   Unique host alias in config
-   Valid port range (1--65535)

------------------------------------------------------------------------

### 2️⃣ Secure Key Capture

Keys are pasted manually and validated to ensure non-empty content.

------------------------------------------------------------------------

### 3️⃣ Automated SSH Config Block

Adds:

    Host alias
        HostName domain_or_ip
        User username
        Port port
        IdentityFile absolute_path

Enables simple connection:

    ssh alias

------------------------------------------------------------------------

### 4️⃣ SSH Agent Integration

    eval "$(ssh-agent -s)"
    ssh-add private_key

Exit status is validated for proper feedback.

------------------------------------------------------------------------

### 5️⃣ Optional Remote Provisioning

If selected:

    ssh-copy-id -i key.pub user@host

Supports custom port.

------------------------------------------------------------------------

## 🚀 Usage

Make executable:

``` bash
chmod +x alta_ssh_key.sh
```

Run:

``` bash
./alta_ssh_key.sh
```

Follow the interactive prompts.

------------------------------------------------------------------------

## 🔒 Git Security Policy

### ❌ Never Version

-   Private keys (`*_ed25519`)
-   Public keys (`*.pub`)
-   `known_hosts`
-   Key subdirectories

### ✅ Safe to Version

-   `alta_ssh_key.sh`
-   `config`
-   `.gitignore`

------------------------------------------------------------------------

### Recommended `.gitignore`

    # Ignore all key directories
    */

    # Allow only base files
    !config
    !alta_ssh_key.sh
    !.gitignore

    # Ignore sensitive files
    known_hosts
    *_ed25519
    *.pub

------------------------------------------------------------------------

## 🧠 DevOps Concepts Demonstrated

-   Secure configuration management
-   Defensive scripting
-   Exit code validation
-   File permission enforcement
-   Operational automation
-   Infrastructure hygiene
-   Idempotent config updates
-   Controlled secret handling

------------------------------------------------------------------------

## 💼 Portfolio Context

This project reflects real-world infrastructure automation principles:

-   Secure secret handling
-   Automation over manual configuration
-   Operational reliability
-   DevOps mindset applied to daily tooling

------------------------------------------------------------------------

## 👤 Author

Jorge Emmanuel Godínez Rojas
