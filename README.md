
# Mihail's Scripts

Some arguably useful scripts made or modified by me.

## .NET Scripts

The .NET scripts have their own README in the `dotnet` directory.

## Perf Scripts

The perf scripts have their own README in the `perf` directory.

## Track Script

A persistent stopwatch.

### Start

To start a stopwatch use:

```sh
track start <name>
```

### Stop

To stop the stopwatch use:

```sh
track stop <name>
```

The total time measured by the stopwatch is returned (in seconds).

### Current Time

To get the current time (amount passed since **last** `start`) use:

```sh
track current <name>
```

### Total Time

To get the total time (amount passed since **first** `start`) use:

```sh
track total <name>
```

### View All

To view all stopwatches use (set `NO_TABLE` to disable table generation):

```sh
track
```

### Delete

To delete a stopwatch use:

```sh
track end <name>
```

### Environment Variables

- `TRACKER_DIRECTORY` - The path where the files created by this script should get stored at (defaults to `$HOME/.local/share/time`).
- `NO_TABLE` - If this variable is set to any non-empty value the script won't generate tables or format text.

## Git Utilities

Git helper functions.

### `find_repo_root`

Outputs the path of the current repository.

> [!TIP]
> This function also has an alias called `find-repo-root`.

```sh
source "git-utils.sh"

REPO_PATH=$(find_repo_root)
```

### `check_branch`

Check if the current branch is equal to some value, exits if it's not.

```sh
source "git-utils.sh"

check_branch "dev"
```

### `check_clean`

Checks if the local repo has changes that need to be pushed to the remote repo, exits if there are any changes.

```sh
check_clean
```

### `sync_branches`

Syncs `$2` with `$1` by checking out to `$2` and rebasing from `$1`, then rebasing `$1` from `$2` while pushing changes to remote.

```sh
sync_branches "dev" "master"
```

> [!WARNING]
> This function does `push --force-with-lease` on `$1` when rebasing from `$2` in the second part of the sync process.
> This step is unnecessary and doesn't do anything when `$1` is ahead of `$2` before the sync.
> If there are actual conflicts the `sync_branches` command should fail at the first rebase.
