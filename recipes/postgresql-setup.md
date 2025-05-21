# PostgreSQL Setup on macOS

This guide helps you set up PostgreSQL on macOS using Homebrew, specifically for version 15.

## Problem

When using PostgreSQL installed via Homebrew (e.g., `postgresql@15`), you might encounter:

```bash
zsh: command not found: psql
```

## Solution

### Step 1: Check Installation

Check if PostgreSQL is installed:

```bash
brew list --versions | grep postgresql
```

If not installed:

```bash
brew install postgresql@15
```

### Step 2: Verify Installation Path

Check the installation details:

```bash
brew info postgresql@15
```

You should see the binary path, typically:
```
/opt/homebrew/opt/postgresql@15/bin
```

### Step 3: Force Link Binary

If you prefer using symlinks (use with caution if no other PostgreSQL version is installed globally):

```bash
brew link postgresql@15 --force
```

### Step 4: Verify Setup

Test the installation:

```bash
psql --version
# Should return: psql (PostgreSQL) 15.x
```

### Step 5: Initial Setup

Connect and set up the postgres user:

```bash
psql -U postgres
ALTER USER postgres WITH PASSWORD 'new_password';
```

## Pro Tips

- Consider adding an alias for `psql` in your shell configuration
- Include these steps in your shell setup script for new machines
- If you need to switch between different PostgreSQL versions, consider using `brew unlink` and `brew link` commands

## References

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Homebrew PostgreSQL Formula](https://formulae.brew.sh/formula/postgresql@15) 
