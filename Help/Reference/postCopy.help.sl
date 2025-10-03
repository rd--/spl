# postCopy

- _postCopy(x)_

When an `Object` is copied, a shallow copy is made, and then `postCopy` is called on the shallow copy.
The answer of `postCopy` is unused and the default implementation answers `nil`.

This is the mechanism by which types can implement any neccesary further copying required.

* * *

See also: Copyable, copy, shallowCopy

Guides: Copying Functions

Categories: Copying
