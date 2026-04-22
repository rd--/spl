# ignoreError

- _ignoreError(f:/0)_

Evaluate the no-argument block _f_ and ignore any error it raises.

If there is no error answer the answer of _f_:

```
>>> { 3 + 4 }.ignoreError
7
```

If there is an error answer `nil`:

```
>>> { nil.error }.ignoreError
nil
```

Continue after error:

```
>>> { nil.error }.ignoreError;
>>> true
true
```

* * *

See also: error, ifError

Guides: Error Functions
