# Simple Editor

There are two editor panes.
The left is for _documents_ and the right is for _programs_.
Both panes are editable and resizeable.
Documents are _rich text_, programs are _plain text_.
Help files open in the document editor.

The ⇧ button opens a file selection dialog and loads the selected file.
The _?_ button opens the initial help document.
The _易_ button opens a program by chance.
The _--Program Menu--_ loads the selected program.
The ⇱ button requests full screen mode.

## Key Commands

- Ctrl-Enter ⇒ Play selection or program
- Ctrl-Shift-Enter ⇒ Evaluate selection or program

There are two distinct _evaluation_ key commands.
_Ctrl-Enter_ wraps the selected text in _{ ... }.play_ before evaluation.
The _play_ method inspects the answer of evaluating the procedure, and if it is an _output signal_ sends it to the synthesiser.
This makes it possible to _play_ expressions that are not synthesiser programs, for instance [Texture Programs].

- Ctrl-. ⇒ Clear schedule and reset synthesiser
- Ctrl-Shift-> ⇒ Clear schedule

When the synthesiser is reset the schedule is cleared.
There is a separate command to simply clear the schedule, which allows existing sounds to end ordinarily.

- Ctrl-Shift-? ⇒ Open help or manual document for selected text
- Ctrl-Shift-H ⇒ Open help document for selected text
- Ctrl-m ⇒ Open manual document for selected text

The _manual_ documents the language and the standard library.
The _help_ documents the synthesiser interface.
_Ctrl-?_ works by requesting both files, and displaying whichever arrives.

- Ctrl-Shift-L ⇒ Open file selection dialog and load selected file

The simple editor is only an experiment.
The document editor could utilise something like [ProseMirror](https://prosemirror.net/).
The program editor could utilise something like [CodeMirror](https://codemirror.net/).
At present, for actual work [Emacs Editor] is a more appropriate environment.

## History

Whenever a file is loaded or a help file is visited an entry is made in the history of the editor.
The address indicates these state changes, showing _?load/f0-tw-1591161283591782401.sl_ or _?help/VarSaw_ respectively.
The ordinary mechanisms can be used to move about within this history.
