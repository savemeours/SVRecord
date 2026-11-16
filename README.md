# Rockstar Editor Menu for FiveM

SVRecord adds a Rockstar Editor recording menu to FiveM using `ox_lib`. It requires no additional framework.

## Installation

1. Install [ox_lib](https://github.com/overextended/ox_lib/releases) in your FiveM server's resources directory.
2. Copy the repository into the resources directory as `SVRecord`, with `fxmanifest.lua` at the root of that folder.
3. Add these lines to `server.cfg`, keeping `ox_lib` first.

```cfg
ensure ox_lib
ensure SVRecord
```

4. Restart the server, join it, and run `/recordmenu` in chat or press `F9`.

## Recording controls

- **Start Recording** starts a clip.
- **Stop and Save** ends the recording and saves the clip.
- **Stop and Discard** ends the recording and deletes the clip.
- **Open Rockstar Editor** opens the built-in editor where supported.

If the menu does not open, check the server console for resource startup errors. Try `/recordmenu` if `F9` conflicts with another keybind. Stopping or restarting `SVRecord` while it is recording discards the active clip. Save it from the menu first if you want to keep it.
