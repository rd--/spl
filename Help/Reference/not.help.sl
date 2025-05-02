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
>>> (1 > 1.pi).not
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

Truth table for `not`:

```
>>> [true false].collect { :each |
>>> 	[each each.not]
>>> }
[
	true false;
	false true
]
```

Where supported `not` is displayed as ¬.

* * *

See also: bitNot, false, true

Guides: Boolean Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Not),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Not.html),
_Smalltalk_
5.3.3.9,
_W_
[1](https://en.wikipedia.org/wiki/Negation)

Unicode: U+00AC ¬ Not sign

Categories: Logic, Operator
