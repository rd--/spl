# includesBy

- _includesBy(c, x, f:/1)_

Answer whether the collection _c_ contains the object _x_ as a member using the equality predicate block _f_.

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

At `String`,
a specialised implementation to ensure that _x_ is a character:

```
>>> 'String'.includesBy('i', =)
true

>>> {
>>> 	'String'.includesBy('Str', =)
>>> }.hasError
true
```

`isSameAs` is a case insensitive equality predicate:

```
>>> 'String'.includesBy('I', isSameAs:/2)
true
```

* * *

See also: anySatisfy, includes

Categories: Testing
