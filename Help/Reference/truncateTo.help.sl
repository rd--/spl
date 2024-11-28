# truncateTo

- _truncated(aNumber, anotherNumber)_
- _truncated(aString, anInteger)_

At `Number`,
answer the next multiple of _anotherNumber_ toward zero that is nearest the _aNumber_.

```
>>> 3.1479.truncateTo(0.01)
3.14

>>> 3.1479.truncateTo(0.1)
3.1

>>> 1923.truncateTo(10)
1920

>>> 3.1479.truncateTo(0.005)
3.145

>>> -3.1479.truncateTo(0.01)
-3.14
```

At `String`,
make a copy of the first _count_ places of _aString_:

```
>>> 'a short string'.truncateTo(7)
'a short'
```

If there are less places than requested answer the complete string:

```
>>> 'less'.truncateTo(7)
'less'
```

* * *

See also: contractTo, roundTo, truncated

References:
_Smalltalk_
5.6.2.42

Categories: Truncating, Rounding
