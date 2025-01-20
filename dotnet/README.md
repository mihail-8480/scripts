
# .NET Scripts

Scripts for building and profiling .NET applications (with NativeAOT support).

## Common Functions

Helper functions for the other scripts.

### `get_rid`

Gets the runtime identifier of the current framework.

> [!TIP]
> This function also has an alias called `get-rid`.

```sh
source "common.sh"

RID=$(get_rid)
```

### `get_framework`

Gets the .NET verison in `netX` format (ex: `net9`).

> [!TIP]
> This function also has an alias called `get_framework`.

```sh
source "common.sh"

FRAMEWORK=$(get_framework)
```

## Build Project

Builds a project using `dotnet publish` and moves the released files into the `artifacts` directory (located at the root of the git repository).

```sh
dotnet/build <project> [configuration]
```

## Profile Project

Builds and profiles a project using the `perf` scripts.

> [!TIP]
> For a NativeAOT build with the `native` option `<PublishAot>true</PublishAot>` is required to be put in the `.csproj`.

```sh
dotnet/profile native|jit <project> [configuration]
```

## Clean Project

Deletes all build artifacts from the repository.

> [!IMPORTANT]
> This script attempts to source `projects.sh` from the root of the repository.

```sh
dotnet/clean
```

### `projects.sh` Format

The `projects.sh` file must export an array with the name `PROJECTS` which contains all the directories which contain .NET projects.

It might also contain a `PROJECT_ROOT` export which overrides the repository root as the root directory for the other .NET scripts.

```sh
#!/usr/bin/env bash

export REPO_ROOT="src"

export PROJECTS=(
  "src/Project1"
  "src/Project2"
)
```
