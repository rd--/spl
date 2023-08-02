# valueWithReturn -- non-local control flow

- _valueWithReturn(aBlock:/1)_

Provides a return block to _aBlock_, which can be used exit directly from _aBlock_, returning a value.
By convention the return block is called return.

Where supported valueWithReturn is displayed as a downwards arrow, ↓,
and both return and return:/1 are displayed as an upwards arrow, ↑.

Where supported an editor command inserts the conventional spelling of this construct,
i.e. _spl-insert-non-local-return (C-c C-r)_ in Emacs.

* * *

See also: [Non-local Return]

Unicode: U+2193 ↓ Downwards Arrow
Unicode: U+2191 ↑ Upwards Arrow
