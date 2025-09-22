# asBit

- _asBit(aBoolean | anInteger)_

The numerical interpretation of _aBoolean_ as a one-bit number.
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

* * *

See also: asBoolean, boole, Boolean

Categories: Converting
