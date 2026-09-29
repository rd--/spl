# InPlace Syntax

- _f!_

InPlace syntax allows the last letter of an identifier to be an exclamation mark,
which is re-written as the text _InPlace_.

Rewrite rules:

```
>> 'sort!'.splSimplify
sortInPlace

>> 'sort!/1'.splSimplify
sortInPlace/1

>> 'sort!(x)'.splSimplify
sortInPlace(x)

>> 'x.sort!'.splSimplify
sortInPlace(x)
```

This follows the Scheme language convention of naming in-place,
or mutating,
procedures with a trailing exclamation mark.

In place sort:

```
>>> let x = [1 3 5 4 2];
>>> let y = x.sort!;
>>> (x, x == y)
([1 2 3 4 5], true)
```

In place sort on:

```
>>> let x = [1 2 3; 4 5; 6];
>>> let y = x.sortOn!(size/1);
>>> (x, x == y)
([6; 4 5; 1 2 3], true)
```

In place reverse:

```
>>> let x = [1 3 5 4 2];
>>> let y = x.reverse!;
>>> (x, x == y)
([2 4 5 3 1], true)
```

In place reverse sort:

```
>>> let x = [1 3 5 2 4];
>>> let y = x.reverseSort!;
>>> (x, x == y)
([5 4 3 2 1], true)
```

In place `add`:

```
>>> let x = [1 2 3];
>>> let y = x.add!(4);
>>> (x, y)
([1 2 3 4], 4)
```

In place `addAll`:

```
>>> let x = [1 2 3];
>>> let y = x.addAll!([4 5 6]);
>>> (x, y)
([1 2 3 4 5 6], [4 5 6])
```

In place `remove`:

```
>>> let x = [1 2 3 4];
>>> let y = x.remove!(4);
>>> (x, y)
([1 2 3], 4)
```

In place `removeAll`:

```
>>> let x = [1 2 3 4 5 6];
>>> let y = x.removeAll!([4 5 6]);
>>> (x, y)
([1 2 3], nil)
```

* * *

See also: reverse, reverseSort, sort, sortOn
