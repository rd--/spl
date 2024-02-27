# not

_not(aBoolean)_

True if argument is false, else false.

```
>>> true.not
false

>>> false.not
true
```

Negate assertions:

```
>>> (1 > pi).not
true
```

Collects over `List`:

```
>>> [false true true false true].not
[true false false true false]
```

Not is it’s own inverse:

```
>>> true.not.not
true
```

Where supported _not_ is displayed as ¬.

* * *

See also: false, true

References:
_Apl_
[1](https://aplwiki.com/wiki/Not)

Unicode: U+007E ~ TILDE, U+00AC ¬ Not sign

Categories: Logic, Operator
