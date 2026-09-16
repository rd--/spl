# highBitOfInteger

- _highBitOfInteger(n)_

Answer the index of the high order bit of the magnitude of the integer _n_,
or `zero` if _n_ is `zero`.

At `SmallFloat`:

```
>>> (127 << 8).highBitOfInteger
15
```

At `LargeInteger`:

```
>>> 479363082683256994034920463268L
>>> .highBitOfInteger
99
```

* * *

See also: Binary, highBit

Categories: Bitwise
