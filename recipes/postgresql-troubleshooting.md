# PostgreSQL Startup Troubleshooting

This guide helps you diagnose and fix PostgreSQL startup issues on macOS when the service shows `error 1` status.

## Problem

When checking Homebrew services, PostgreSQL shows an error status:

```bash
brew services list
# postgresql@15 error 1 vasily ~/Library/LaunchAgents/homebrew.mxcl.postgresql@15.plist
```

The `error 1` status means launchd attempted to start the service, but the process exited quickly with code 1. You need to check logs and identify the root cause.

## Solution

Follow these steps in order to diagnose and fix the issue.

### Step 1: Check Service Details

Get detailed information about the PostgreSQL service:

```bash
brew services info postgresql@15
```

### Step 2: Check Launchd Logs

View the most recent logs related to PostgreSQL (most useful for diagnosis):

```bash
log show --last 20m --predicate 'process == "postgres" OR eventMessage CONTAINS "postgresql@15" OR eventMessage CONTAINS "homebrew.mxcl.postgresql@15"' --info
```

This will show you the exact error message that caused the startup failure.

### Step 3: Check Port 5432 Availability

A very common cause of `error 1` is port 5432 being already in use by another process (another PostgreSQL version, Docker container, etc.):

```bash
lsof -nP -iTCP:5432 -sTCP:LISTEN
```

If something is listening on port 5432:
- Either free the port by stopping the conflicting service
- Or change the port in PostgreSQL configuration

### Step 4: Manual Startup (See Error Directly)

Try starting PostgreSQL manually to see the error message directly in the console. This is especially useful for Apple Silicon Macs:

```bash
# Stop the service first
brew services stop postgresql@15

# Start PostgreSQL manually (for Apple Silicon)
/opt/homebrew/opt/postgresql@15/bin/postgres -D /opt/homebrew/var/postgresql@15
```

**This usually prints the exact cause immediately** (missing data directory, permission issues, port conflict, corrupted data directory, invalid config).

To stop: Press `Ctrl+C`.

### Common Issues and Fixes

#### Missing Data Directory

If the data directory doesn't exist or is corrupted:

```bash
# Initialize a new database cluster
/opt/homebrew/opt/postgresql@15/bin/initdb -D /opt/homebrew/var/postgresql@15
```

#### Permission Issues

Ensure the data directory has correct permissions:

```bash
chmod 700 /opt/homebrew/var/postgresql@15
```

#### Port Conflict

If another PostgreSQL instance is using port 5432, you can either:
- Stop the conflicting service
- Change PostgreSQL port in `/opt/homebrew/var/postgresql@15/postgresql.conf`

#### Stale Lock File (postmaster.pid)

If you see this error:

```
FATAL: lock file "postmaster.pid" already exists
HINT: Is another postmaster (PID 791) running in data directory "/opt/homebrew/var/postgresql@15"?
```

This means PostgreSQL found a stale lock file from a previous instance. The PID mentioned (e.g., 791) has likely been reused by the system for another process, but the lock file remains. PostgreSQL won't start because it thinks another instance is already running.

**Solution (safely remove the stale lock file):**

1. **Verify PostgreSQL is not actually running:**

```bash
pgrep -fl 'postgres|postmaster'
```

2. **Verify port 5432 is free:**

```bash
lsof -nP -iTCP:5432 -sTCP:LISTEN
```

If both commands show **no PostgreSQL-related processes**, continue.

3. **Remove the stale lock file:**

```bash
rm /opt/homebrew/var/postgresql@15/postmaster.pid
```

(If it says the file doesn't exist, that's fine — it may have been cleaned up already.)

4. **Restart the service:**

```bash
brew services start postgresql@15
brew services list
```

## Pro Tips

- Always check logs first (`log show`) — they usually contain the exact error
- Manual startup (`postgres -D`) is the fastest way to see the error message
- Port conflicts are the most common cause of `error 1` status
- For Intel Macs, the path might be `/usr/local/opt/postgresql@15` instead of `/opt/homebrew/opt/postgresql@15`

## References

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Homebrew Services Documentation](https://docs.brew.sh/Manpage#services-subcommand)
