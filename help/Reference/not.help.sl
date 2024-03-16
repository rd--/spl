# not

- _not(aBoolean)_

Answer `true` if argument is `false`, else `false`.

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

`not` is its own inverse:

```
>>> true.not.not
true
```

Where supported `not` is displayed as ¬.

* * *

See also: false, true

References:
_Apl_
[1](https://aplwiki.com/wiki/Not),
_Smalltalk_
5.3.3.9

Unicode: U+007E ~ Tilde, U+00AC ¬ Not sign

Categories: Logic, Operator
