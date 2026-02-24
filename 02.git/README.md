# 02.git --- Complete Git Configuration Documentation

**Author:** Jorge Emmanuel Godínez Rojas 
  d          zb  ´::

------------------------------------------------------------------------

## Overview

`02.git` is part of my personal `00.config` infrastructure repository.

It defines my global Git configuration optimized for:

-   Clean commit history
-   Linear workflow
-   Reproducible environments
-   Production-ready standards
-   Modern Git best practices
-   Multi-device consistency

This module reflects a DevOps mindset applied to daily engineering
workflows.

------------------------------------------------------------------------

## Architecture Philosophy

This configuration is based on:

-   Infrastructure as Code
-   Configuration Versioning
-   Deterministic Workflows
-   Automation First
-   Clean History Strategy
-   Rebase-Based Collaboration

------------------------------------------------------------------------

## Directory Structure

    02.git/
    ├── gitconfig
    ├── gitignore_global
    └── templates/
        └── gitmessage.txt

------------------------------------------------------------------------

## Global Git Configuration

### Identity

``` ini
[user]
    name = JEGR
    email = urickvan7@gmail.com
```

Ensures consistent authorship across all machines.

------------------------------------------------------------------------

### Core Settings

``` ini
[core]
    editor = nvim
    excludesfile = /Users/iurickvan/Documents/00.config/02.git/gitignore_global
```

-   Uses Neovim as primary editor
-   Applies a global gitignore
-   Keeps repositories clean

------------------------------------------------------------------------

### Color Output

``` ini
[color]
    ui = auto
```

Improves terminal readability.

------------------------------------------------------------------------

### Productivity Aliases

``` ini
[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    lg = log --oneline --decorate --graph --all
```

Optimizes daily workflow and branch debugging.

------------------------------------------------------------------------

### Commit Template

``` ini
[commit]
    template = /Users/iurickvan/Documents/00.config/02.git/templates/gitmessage.txt
```

Implements structured Conventional Commits.

Benefits:

-   Clear history
-   Semantic versioning compatibility
-   Better code reviews
-   Release automation readiness

------------------------------------------------------------------------

## Senior Workflow Enhancements

``` ini
[pull]
    rebase = true

[rebase]
    autoStash = true

[fetch]
    prune = true
    pruneTags = true

[init]
    defaultBranch = main

[push]
    autoSetupRemote = true

[rerere]
    enabled = true
```

These settings ensure:

-   Linear history
-   Automatic conflict handling
-   Clean remote tracking
-   Modern branch standards
-   Reduced friction in collaboration

------------------------------------------------------------------------

## Installation

1.  Clone configuration repository:

``` bash
git clone https://github.com/URICKVAN/00.config.git
```

2.  Add include to `~/.gitconfig`:

``` ini
[include]
    path = /Users/iurickvan/Documents/00.config/02.git/gitconfig
```

3.  Verify:

``` bash
git config --global --list
```

------------------------------------------------------------------------

## DevOps Value Demonstrated

This setup showcases:

-   Professional Git workflow design
-   Configuration versioning
-   Automated branch hygiene
-   Structured commit standards
-   Multi-device portability

------------------------------------------------------------------------

## Security Considerations

Never commit:

-   Private keys
-   API tokens
-   Credentials
-   .env files

Always review:

-   `git status`
-   `git diff`

Avoid force pushing shared branches.

------------------------------------------------------------------------

## Conclusion

This Git configuration is a structured, versioned, and portable
engineering workflow designed to:

-   Reduce friction
-   Improve clarity
-   Maintain clean history
-   Enforce professional standards
-   Enable scalable collaboration

It reflects a DevOps-oriented systems engineering mindset.
