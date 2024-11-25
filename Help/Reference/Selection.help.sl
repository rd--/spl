# Selection

A `Type` to indicate the range of selected text,
or the current position of the caret.
Each `Document` is associated with a unique `Selection` value,
which can be retrieved by `selection`.

The `anchorNode` and `anchorOffset` say where the selection began,
the `focusNode` and `focusOffset` say where the selection ends.

A selection is composed of one or more `DocumentRange` values.
The `rangeCount` tells how many range values there are,
and `getRangeAt` answers the indicated range.
Ordinarily there is only one range, and it is answered by `range`.

A selection has a `type`,
a `String` which is either _Range_ or _Caret_.
There are also predicates `isRange` and `isCaret`.

* * *

See also: Document, DocumentRange, Selection, Window

References:
_W3c_
[1](https://w3c.github.io/selection-api/#selection-interface)
