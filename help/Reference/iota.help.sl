# iota

_iota(aNumber | aSequence)_

Index Generator.
In the scalar case answer a list of indices:

```
>>> 5.iota
[1 2 3 4 5]

>>> 2 ^ 6.iota
[2 4 8 16 32 64]
```

In the sequence case answer a list of indices reshaped to the indicated shape:

```
>>> [2 3].iota
[1 2 3; 4 5 6]

>>> 6.iota.reshape([2 3])
[1 2 3; 4 5 6]

>>> [3 2].iota
[1 2; 3 4; 5 6]

>>> 6.iota.reshape([3 2])
[1 2; 3 4; 5 6]
```

* * *

References:
_Apl_
[1](https://aplwiki.com/wiki/Index_Generator),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/idot)
