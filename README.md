# ⚙️ 00.config --- Centralized Developer Environment

A centralized, version-controlled configuration repository designed to
make machine migration fast, reproducible, and clean across macOS and
Linux environments (both graphical and terminal-only).

This repository represents my personal Infrastructure-as-Code approach
for local development environments.

------------------------------------------------------------------------

# 🎯 Purpose

The main goal of `00.config` is to:

-   Centralize all developer environment configurations
-   Avoid configuration drift between machines
-   Enable fast migration to new hardware
-   Maintain reproducibility across macOS and Linux
-   Keep configurations modular and version-controlled
-   Reduce setup time from hours to minutes

I have worked in:

-   macOS (Apple Silicon environments)
-   Linux with graphical interface
-   Linux terminal-only environments (server-style setups)

This repository ensures consistency across all of them.

------------------------------------------------------------------------

# 📂 Repository Structure

    00.config/
    ├── 00.ssh      # SSH key management and scripts
    ├── 01.zsh      # Zsh + Oh My Zsh configuration
    ├── 02.git      # Git configuration and commit templates
    ├── 03.nvim     # Neovim configuration

Each folder is self-contained and documented independently.

------------------------------------------------------------------------

# 🧠 Philosophy

This repository follows a DevOps mindset:

-   Environment as Code
-   Modular configuration
-   Version control for everything possible
-   Clean separation of concerns
-   Reproducibility over improvisation

Instead of manually reconfiguring tools on every machine, I clone this
repository and relink what is needed.

------------------------------------------------------------------------

# 🔁 Migration Workflow (New Machine Setup)

## 1️⃣ Clone repository

``` bash
git clone https://github.com/URICKVAN/00.config.git
```

## 2️⃣ Link required configurations

Example (Zsh):

``` bash
ln -s "/path/to/00.config/01.zsh/zshrc" ~/.zshrc
```

Example (Git config):

``` bash
ln -s "/path/to/00.config/02.git/gitconfig" ~/.gitconfig
```

Each module contains its own detailed setup instructions.

------------------------------------------------------------------------

# 🐧 Cross-Platform Compatibility

Designed to work in:

-   macOS
-   Linux (Ubuntu, Debian-based, minimal server installs)
-   GUI and headless environments

When platform differences exist, they are handled inside the
configuration files.

------------------------------------------------------------------------

# 🔧 What This Demonstrates (Professional Perspective)

From an engineering standpoint, this repository demonstrates:

-   Environment engineering discipline
-   DevOps best practices applied locally
-   Shell customization and automation
-   Git workflow standardization
-   SSH key management hygiene
-   Reproducible development environments

This is not just dotfiles --- this is structured environment
architecture.

------------------------------------------------------------------------
# 📌 Author

Jorge Emmanuel Godínez Rojas\
Systems Director \| Software Engineer\
Backend & DevOps-focused