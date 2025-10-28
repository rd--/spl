# asBit

- _asBit(x)_

The numerical interpretation of the `Boolean` _x_ as a one-bit number.
This extends nicely to _n_-bit numbers, as long as they treat 0 as `false`, and anything else as `true`.

```
>>> false.asBit
0

>>> true.asBit
1
```

At integer allows `zero` or `one`:

```
>>> 0.asBit
0

>>> 1.asBit
1
```

else it is an error:

```
>>> { 2.asBit }.hasError
true
```

Threads over lists:

```
>>> [0 false 1 true].asBit
[0 0 1 1]
```

* * *

See also: asBoolean, boole, Boolean

Guides: Bitwise Functions, Number Functions

Categories: Converting
