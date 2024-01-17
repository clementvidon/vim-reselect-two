# Reselect Two

## TL;DR

This is a **work in progress** and may have bugs. **Contributions are welcome**!

## Description

This plugin extends the capacity of **gv** `:h reselect-Visual` which allows you
to restore the last visual selection by making it possible to **restore the
penultimate visual selection** with **gV** `:h reselect-two`.


|  Visual Selection |  Visual Reselection                    |
| ----------------- | -------------------------------------- |
|  "`HELL`o world!" |  **gv** -> `HELL`,   **gV** -> `HELL`  |
|  "hello `WORLD`!" |  **gv** -> `WORLD`,  **gV** -> `HELL`  |
|  "`HELLO` world!" |  **gv** -> `HELLO`,  **gV** -> `WORLD` |

In the following example we create two selections and alternate from one to the
other using **gv** and **gV**.

![Vim Reselect Two](./doc-assets/vim-reselect-two.gif)

## Get Started

* Install with *vim-plug* or any other plugin manager.

  `Plug 'clemedon/vim-reselect-two'`

* Read the man: `:h reselect-two`

## Dev Notes

### Issue

- 240116 **Cursor position** should be restored when the selection is restored.

### Alternative Solution

- 240116 When visual selection start, save all keys pressed until the end of the
  selection `ModeChanged`, alongside with `visualmode()` and beg position.
  Replay them like a macro when the selection is restored.
