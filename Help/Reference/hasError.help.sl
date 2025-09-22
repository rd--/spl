# hasError

- _ifError(f:/0)_

Evaluate the no-argument block _f_ and answer `true` if there is an error else `false`.

```
>>> { 1.anUnknownMessage }.hasError
true
```

The answer of _f_ is discarded:

```
>>> { }.hasError
false
```

Note in particular that an answer of `true` is ignored:

```
>>> { true }.hasError
false
```

This method is widely used thoughout the help files to illustrate erroneous programs.

_Rationale_:
This is not called `isError` since that is the type predicate for `Error` values.
This does not answer the value of _f_ so that blocks that answer `true` correctly answer `false`.

* * *

See also: ifError, isError

Guides: Block Functions, Control Functions

Categories: Evaluating
