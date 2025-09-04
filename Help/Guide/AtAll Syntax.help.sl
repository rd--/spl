# AtAll Syntax

Rewrite rule,
where _i_ and _j_ are instances of `Range Syntax` or `List Syntax`:

- _c[i]_ ⟹ _atAll(c, i)_
- _c[i, j]_ ⟹ _atAll(c, i, j)_
- _&etc_

Syntax for the `atAll` protocol.

At `Range`:

```
>>> let c = (9 .. 1);
>>> (c[3:7], c[[7, 3]])
([7 6 5 4 3], [3 7])
```

At `List`:

```
>>> let c = [9 8 7 6 5 4 3 2 1];
>>> (c[3:7], c[[7, 3]])
([7 6 5 4 3], [3 7])
```

At a `List` of lists:

```
>>> let c = [5 5].iota;
>>> (
>>> 	c[1:2, 3:4],
>>> 	c[[2, 1], [4, 3]]
>>> )
([3 4; 8 9], [9 8; 4 3])
```

Select one column of a matrix:

```
>>> let m = [5 5].iota;
>>> m[1:5, 3:3]
[3; 8; 13; 18; 23]
```

The @* operator expresses this operation succinctly at vectors:

```
>>> let c = [9 .. 1];
>>> c @* 3:7
[7 6 5 4 3]
```

* * *

See also: @*, at, atAll, atPath

Guides: At Syntax, AtPut Syntax, Property Read Syntax

References:
_Apl_
[1](https://aplwiki.com/wiki/Bracket_indexing)

Categories: Syntax
