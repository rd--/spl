# keyAtValue

- _keyAtValue(d, x)_

Answer the key that is the external name for the value _x_ in the dictionary _d_.

At `Record`:

```
>>> (x: 1, y: 2, z: 3).keyAtValue(3)
'z'
```

At `Map`:

```
>>> [1: 'x', 2: 'y', 3: 'z']
>>> .keyAtValue('z')
3
```

If there is no such value, signal an `error`:

```
>>> {
>>> 	(x: 1, y: 2).keyAtValue(3)
>>> }.hasError
true
```

This is the `Dictionary` form of the `indexOf` method at `Indexable`.

* * *

See also: keyAtValueIfAbsent, indexOf

References:
_Smalltalk_
5.7.2.8

Categories: Accessing
