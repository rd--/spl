# withoutAll

- _withoutAll(aCollection, anotherCollection)_

Remove every element of _aCollection_ that compares equal to an element of _anotherCollection_.
Answer _aCollection_.

```
>>> [1 2 2 3 3 3].withoutAll([1 3])
[2 2]

>>> [1 2 2 3 3 4].withoutAll([2 3])
[1 4]
```

Delete all instances of x and y from a list:

```
>>> [2 'x' 1 'x' 'a' 'y' 'x'].withoutAll(['x' 'y'])
[2 1 'a']
```

* * *

See also: without

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteElements.html)

Categories: Removing
