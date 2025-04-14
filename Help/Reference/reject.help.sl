# reject

- _reject(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each of the elements of _aCollection_ as the argument.
Collect into a new collection like the receiver only those elements for which _aBlock_ evaluates to _false_.
Answer the new collection.

At `Range`, answers `List`:

```
>>> 1:9.reject(isEven:/1)
[1 3 5 7 9]
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).reject(isEven:/1)
(x: 1, z: 3)
```

At a finite `Stream`:

```
>>> [1 .. 9].asStream
>>> .reject(isEven:/1)
>>> .upToEnd
[1 3 5 7 9]
```

At a finite `Stream`:

```
>>> (1 .. Infinity).asStream
>>> .reject(isEven:/1)
>>> .next(5)
[1 3 5 7 9]
```

Reject items that are integers:

```
>>> [1 'x' 2 3 'y' 9 'y'].reject(isInteger:/1)
['x' 'y' 'y']
```

* * *

See also: collect, detect, select

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteCases.html),
_Smalltalk_
5.7.1.21

Categories: Enumerating
