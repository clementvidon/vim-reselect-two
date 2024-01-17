# Reselect Two

### Intro

Often frustrated by the impossibility of juggling between the last Selection and
the one which precedes it.  I missed the possibility of being able to invoke the
previous Selection regularly enough to end up creating this base.  This work in
progress is dirty, buggy, and **open to contributions**.

### Description

In addition to the well known *gv* which reselect the last VISUAL Selection, you
can press *gb* to reselect the previous VISUAL Selection, the one that is
overwritten by *gv* when a new selection is done.

### Get Started

* Install with *vim-plug* or any other plugin manager:

  `Plug 'clemedon/vim-reselect-two'`

* Press *v*, *V* or *Ctrl-V* to create a 1st VISUAL Selection.
* Quit VISUAL mode with *<Esc>*.
* Press *v*, *V* or *Ctrl-V* to create a 2nd VISUAL Selection.
* Quit VISUAL mode with *<Esc>*.
* Switch between the 1st and the 2nd Selection with *gv* and *gb*.
