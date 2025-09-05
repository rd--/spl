# remove

- _remove(c, x)_

Remove the item _x_ from the elements of the collection _c_.
Answer _x_ unless no element is equal to _x_,
in which case raise an `error`.

At `List`:

```
>>> let c = [1 .. 5];
>>> let x = c.remove(3);
>>> (c, x)
([1 2 4 5], 3)
```

Removes only one matching element:

```
>>> let c = [1 2 3 2 1];
>>> let x = c.remove(2);
>>> (c, x)
([1 3 2 1], 2)
```

At `Set`:

```
>>> let c = Set([1 2 3]);
>>> let x = c.remove(1);
>>> (c.asList, x)
([2 3], 1)
```

If no item matches an `error` is signaled:

```
>>> {
>>> 	[1 2 3].remove(4)
>>> }.ifError { true }
true

>>> {
>>> 	Set([1 2 3]).remove(4)
>>> }.ifError { true }
true
```

* * *

See also: add, Removable, removeAll, removeAllSuchThat, removeAt, removeKey, removeKeyIfAbsent, without

Guides: Dictionary Functions, List Functions

References:
_Smalltalk_
5.7.5.3

Categories: Removing
