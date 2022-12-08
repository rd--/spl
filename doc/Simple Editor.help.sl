# Simple Editor

There are two editor panes.
The left is for _documents_ and the right is for _programs_.
Both panes are editable and resizeable.
Documents are _rich text_, programs are _plain text_.
Help files open in the document pane.

## Key Commands

- Ctrl-Enter ⇒ Play selection or program
- Ctrl-Shift-Enter ⇒ Evaluate selection or program
- Ctrl-Shift-> ⇒ Clear schedule
- Ctrl-. ⇒ Clear schedule and reset synthesiser
- Ctrl-Shift-H ⇒ Open help document for selected text
- Ctrl-Shift-L ⇒ Open file selection dialog and load selected file

There are two distinct _evaluation_ key commands.
_Ctrl-Enter_ wraps the selected text in _{ ... }.play_ before evaluation.
The _play_ method inspects the answer of evaluating the procedure, and if it is an _output signal_ sends it to the synthesiser.
This makes it possible to _play_ expressions that are not synthesiser programs, for instance [Texture Programs].

## History

Whenever a file is loaded or a help file is visited an entry is made in the history of the editor.
The address indicates these state changes, showing _?load/f0-tw-1591161283591782401.sl_ or _?help/VarSaw_ respectively.
The ordinary mechanisms can be used to move about within this history.
