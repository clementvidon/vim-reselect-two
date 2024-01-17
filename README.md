# Reselect Two

## Description

This plugin allows you to **restore**, not only the **last selection area** (like does the '**gv**' command) but also the previous one: the **penultimate selection area** (with '**gV**'). See `:h reselect-Visual`, `:h reselect-two`.

### Examples
  
|  Selection Area   |  Reselection                           |
| ----------------- | -------------------------------------- |
|  "`HELL`o world!" |  **gv** -> `HELL`,   **gV** -> `HELL`  |
|  "hello `WORLD`!" |  **gv** -> `WORLD`,  **gV** -> `HELL`  |
|  "`HELLO` world!" |  **gv** -> `HELLO`,  **gV** -> `WORLD` |

Here we create two selections and alternate from one to the other using **gv** and **gV**.

![Vim Reselect Two](./doc-assets/vim-reselect-two.gif)

## Get Started

* Install with *vim-plug* or any other plugin manager.

  `Plug 'clemedon/vim-reselect-two'`

* Read the man: `:h reselect-two`

## Contribute

This is a **work in progress** and may have bugs. **Contributions are welcome**!

## Dev Notes

### Issue

- 240116 **Cursor position** should be restored when the selection is restored.

### Alternative Solution

- 240116 When selection area start, save all keys pressed until the end of the
  selection `ModeChanged`, alongside with `visualmode()` and beg position.
  Replay them like a macro when the selection is restored.
