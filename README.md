# Reselect Two

### TL;DR

This **work in progress** is dirty, buggy, and **open to contributions**.

### Description

This plugin extends the capacity of **gv** *reselect-Visual* which allows you to
restore the last visual selection by making it possible to restore the
penultimate visual selection.


|  Visual Selection |  Visual Reselection                    |
| ----------------- | -------------------------------------- |
|  "`HELL`o world!" |  **gv** -> `HELL`,   **gV** -> `HELL`  |
|  "hello `WORLD`!" |  **gv** -> `WORLD`,  **gV** -> `HELL`  |
|  "`HELLO` world!" |  **gv** -> `HELLO`,  **gV** -> `WORLD` |

In the example I create two selection, then I alternate from one to the other
using **gv** and **gV**.

![Vim Reselect Two](./doc-assets/vim-reselect-two.gif)

### Get Started

* Install with *vim-plug* or any other plugin manager:

  `Plug 'clemedon/vim-reselect-two'`

* Press **v**, **V**, **<C-V>** or **<C-Q>** to create a 1st VISUAL Selection.
* Quit VISUAL mode with **<Esc>**.
* ress **v**, **V**, **<C-V>** or **<C-Q>** to create a 2nd VISUAL Selection.
* Quit VISUAL mode with **<Esc>**.
* Switch between the 1st and the 2nd Selection with **gv** and **gV**.
