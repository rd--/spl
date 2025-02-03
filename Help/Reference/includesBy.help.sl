# includesBy

- _includesBy(aCollection, anObject, aBlock:/1)_

Answer whether _aCollection_ contains _anObject_ as a member using the equality predicate _aBlock_.

Is a number close to five close to an element of a `List`:

```
>>> [1 3 5 7 9].includesBy(5.00001, ~)
true
```

At `Range`:

```
>>> 1:5.includesBy(5.00001, ~)
true
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).includesBy(3.00001, ~)
true
```

At `String`, `isSameAs` is a case insensitive equality predicate:

```
>>> 'String'.includesBy('I', isSameAs:/2)
true
```

* * *

See also: anySatisfy, includes

Categories: Testing
