# removeAllSuchThat

- _removeAllSuchThat(c, f:/1)_

Evaluate the block _f_ for each element of the collection _c_ and remove all elements that evaluate to `true`.
Use a copy to enumerate collections whose order changes when an element is removed (i.e. sets).

At `List`, answer a copy:

```
>>> let c = [1 2 2 3 3 3 4 4 4 4];
>>> let z = c.removeAllSuchThat { :each |
>>> 	[2 3].includes(each)
>>> };
>>> (c, c ~= z)
([1 4 4 4 4], true)
```

At `Record` modify in place,
see also `associationsRemove`:

```
>>> let r = (x: 1, y: 2, z: 3);
>>> let z = r.removeAllSuchThat { :each |
>>> 	[2 3].includes(each)
>>> };
>>> (r, z)
((x: 1), ['y', 'z'])
```

* * *

See also: associationsRemove, keysAndValuesRemove, reject, remove, removeAll

Categories: Removing
