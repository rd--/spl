# isInteger

_isInteger(anObject)_

Answers true if the receiver is a number and is an integer, else false.

At SmallFloat:

```
>>> 23.isInteger
true

>>> 3.141.isInteger
false

>>> inf.isInteger
false
```

At Fraction:

```
>>> 2/3.isInteger
false

>>> 2/2.isInteger
true
```

At Complex:

```
>>> 2j3.isInteger
false
```

At non-number types:

```
>>> '23'.isInteger
false

>>> nil.isInteger
false

>>> false.isInteger
false
```

* * *

See also: isNumber, isGaussianInteger, isSmallInteger

Categories: Predicate
