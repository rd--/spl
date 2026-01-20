# At Syntax

Rewrite rule:

- _c[i]_ ⟹ _at(c, i)_
- _c[i, j]_ ⟹ _at(c, i, j)_
- _c[i, j, k]_ ⟹ _at(c, i, j, k)_

Syntax for the `at` protocol.

```
>> 'c[i]'.splSimplify
at(c, i)

>> 'c[i, j]'.splSimplify
at(c, i, j)

>> 'c[i, j, k]'.splSimplify
at(c, i, j, k)
```

At `Range`:

```
>>> let a = 9:1:-1;
>>> a[7]
3
```

At `List`:

```
>>> let a = [9, 8 .. 1];
>>> a[7]
3
```

At `Record`:

```
>>> let a = (x: 1, y: 2, z: 3);
>>> a['z']
3
```

At matrix, a `List` of lists:

```
>>> let a = [4 2].iota;
>>> a[2, 1]
3
```

At a `Record` of records:

```
>>> let a = (x: (p: 1), y: (q: 2), z: (r: 3));
>>> a['z', 'r']
3
```

_Note:_
This syntax is for accessing containers that support multiple indices, such as a matrix.
It is not a syntax for the `atAll` protocol, see `AtAll Syntax`.

```
>>> let a = [5 5].iota;
>>> a[1:5, 3:3]
[3; 8; 13; 18; 23]
```

_Note:_
At present whitespace is allowed before the left bracket,
however this is confusing and should be disallowed:

```
>>> [1 2 3] [3]
3

>>> [[1 2 3] [3]]
[3]
```

* * *

See also: @, at, atAll, List, Range, Record

Guides: AtAll Syntax, AtPut Syntax, Property Read Syntax

References:
_Apl_
[1](https://aplwiki.com/wiki/Bracket_indexing)

Categories: Syntax
