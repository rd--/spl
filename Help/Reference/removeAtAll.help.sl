# removeAtAll

- _removeAtAll(c, [i₁ i₂ …])_

Remove the element at each index in the index collection _i_ from the collection _c_.
Answers a `List` of the removed elements.

Remove first and third item of a `List`:

```
>>> let l = [1 2 3 4 5];
>>> (l.removeAtAll([1 3]), l)
([1 3], [2 3 5])
```

If is an error if any index is not valid:

```
>>> let l = [1 2 3 4 5];
>>> {
>>> 	l.removeAtAll([1 7])
>>> }.hasError
true
```

At `Record`, alias for `removeAllKeys`:

```
>>> let r = (x: 1, y: 2, z: 3);
>>> (r.removeAtAll(['x' 'z']), r)
(['x' 'z'], (y: 2))
```

* * *

See also: at, insertAt, removeAt, removeFirst, removeKey, removeLast

Categories: Removing
