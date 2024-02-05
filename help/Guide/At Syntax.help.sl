# At Syntax

Rewrite rule:

- _c[i]_ ⟹ _at(c, i)_
- _c[i, j]_ ⟹ _at(c, i, j)_
- _c[i, j, k]_ ⟹ _at(c, i, j, k)_

Syntax for the _at_ protocol.

At List:

```
>>> let list = [1 2 3 4 5 6];
>>> list[3]
3
```

At Record:

```
>>> let record = (x: 1, y: 2, z: 3);
>>> record['z']
3
```

At List of List:

```
>>> let list = [1 2; 3 4; 5 6];
>>> list[2, 2]
4
```

At Record of Record:

```
>>> let record = (x: (p: 1), y: (q: 2), z: (r: 3));
>>> record['y', 'q']
2
```

_Note:_
This syntax is for accessing containers that support multiple indices, such as a matrix.
It is not a syntax for the _atAll_ protocol.

```
>>> let list = [1 .. 9];
>>> list.atAll([1 3 7])
[1 3 7]
```

The @* operator expresses this method succinctly:

```
>>> let list = [1 .. 9];
>>> list @* [1 3 7]
[1 3 7]
```

* * *

See also: [AtIfAbsent Syntax], [AtPut Syntax], [Quoted At Syntax]

Categories: Syntax
