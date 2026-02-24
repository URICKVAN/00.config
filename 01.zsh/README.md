# 🐚 01.zsh --- Centralized Zsh Configuration

Centralized and version-controlled Zsh configuration designed for
portability, reproducibility, and clean DevOps workflows.

This setup allows me to:

-   Maintain a single source of truth for my shell configuration
-   Version control my environment
-   Replicate my terminal setup across machines in minutes
-   Keep aliases modular and documented
-   Avoid configuration drift

Part of my broader developer environment strategy under `00.config`.

------------------------------------------------------------------------

# 📂 Project Structure

    /Users/iurickvan/Documents/00.config/01.zsh/
    ├── zshrc        # Main Zsh configuration (Oh My Zsh + options)
    └── aliases.zsh  # Documented custom aliases

The local `~/.zshrc` file is replaced with a symbolic link pointing to
this centralized configuration.

------------------------------------------------------------------------

# 🎯 Objective

Instead of editing `~/.zshrc` directly on each machine, this setup:

-   Centralizes configuration in a versioned directory
-   Uses symbolic links for clean separation
-   Keeps aliases modular
-   Enables Git tracking
-   Allows full environment replication in new systems

This follows an Infrastructure-as-Code mindset for local development
environments.

------------------------------------------------------------------------

# 🔗 Symbolic Link Setup

## 1️⃣ Backup existing configuration

``` bash
mv ~/.zshrc ~/.zshrc.bak
```

## 2️⃣ Create symbolic link

``` bash
ln -s "/Users/iurickvan/Documents/00.config/01.zsh/zshrc" ~/.zshrc
```

## 3️⃣ Verify

``` bash
ls -l ~/.zshrc
```

Expected output:

    .zshrc -> /Users/iurickvan/Documents/00.config/01.zsh/zshrc

------------------------------------------------------------------------

# 📥 Loading Modular Aliases

Inside `zshrc`:

``` bash
if [ -f "/Users/iurickvan/Documents/00.config/01.zsh/aliases.zsh" ]; then
    source "/Users/iurickvan/Documents/00.config/01.zsh/aliases.zsh"
fi
```

After editing aliases:

``` bash
source ~/.zshrc
```

------------------------------------------------------------------------

# 🧩 Sample Aliases

``` bash
alias ls='ls -lG'
alias ll='ls -laG'
alias la='ls -la'
alias addkey='sh /Users/iurickvan/Documents/00.config/00.ssh/add_ssh_key.sh'
```

------------------------------------------------------------------------

# 🔧 Version Control Strategy

Initialize:

``` bash
cd /Users/iurickvan/Documents/00.config/01.zsh
git init
git add zshrc aliases.zsh
git commit -m "feat(zsh): initialize centralized configuration"
```

Commit updates:

``` bash
git add zshrc aliases.zsh
git commit -m "refactor(zsh): improve alias documentation"
```

------------------------------------------------------------------------

# 🚀 Setup on a New Machine

1.  Install Oh My Zsh:

``` bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2.  Clone your config:

``` bash
git clone https://github.com/URICKVAN/00.config.git
```

3.  Create symbolic link:

``` bash
ln -s "/Users/iurickvan/Documents/00.config/01.zsh/zshrc" ~/.zshrc
```

4.  Reload:

``` bash
source ~/.zshrc
```

------------------------------------------------------------------------

# 🧠 DevOps Perspective

This configuration demonstrates:

-   Environment reproducibility
-   Infrastructure-as-code mindset
-   Modular configuration management
-   Version-controlled shell
-   Machine portability
