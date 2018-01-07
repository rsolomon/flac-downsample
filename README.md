# flac-downsample
Very basic script to convert your 24-bit flac collection to 16-bit. For when you buy a Sonos and don't realize it doesn't support high res!

This was created as a quick and dirty solution, and may not provide the robustness and functionality you are looking for. All pull requests to improve the script are appreciated.


## Dependencies

### operating system

This was created with OS X in mind. It may work elsewhere, but it has not been tested.

### encoder

```
brew install sox --with-flac
```

## Usage

### arguments

1. source directory
2. destination directory
3. *optional* should copy non-flac files

### only convert flac files within a directory

```
bash "path-to-music-root" "path-to-dest-root"
```

### include non-flac files (album art, etc)

```
bash "path-to-music-root" "path-to-dest-root" 1

```

