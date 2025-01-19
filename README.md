# Mihail's Scripts
Some arguably useful scripts made or modified by me.

## Track Script

A stopwatch.

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

