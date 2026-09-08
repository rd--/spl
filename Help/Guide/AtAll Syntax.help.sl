# AtAll Syntax

- _c[i]_

Syntax for the `atAll` protocol.

Rewrite rule,
where _i_ is an instance of `Range Literal Syntax` or `List Syntax`:

```
>>> 'c[i:j]'.splSimplify
'atAll(c, rangeOrRelativeRange(i, j, 1))'

>>> 'c[[i, j, k]]'.splSimplify
'atAll(c, [i, j, k])'
```

At `Range`:

```
>>> let c = [9, 8 .. 1];
>>> (c[3:7], c[[7, 3]])
([7 6 5 4 3], [3 7])
```

At `List`:

```
>>> let c = [9 8 7 6 5 4 3 2 1];
>>> (c[3:7], c[[7, 3]])
([7 6 5 4 3], [3 7])
```

The @* operator expresses this operation succinctly at vectors:

```
>>> let c = [9, 8 .. 1];
>>> (c @* 3:7, c @* [7 3])
([7 6 5 4 3], [3 7])
```

At `Map`:

```
>>> let m = Map[0 3; 1 2; 2 1];
>>> m[0:2]
[3 2 1]
```

* * *

See also: @*, at, atAll, atPath

Guides: At Syntax, AtPut Syntax, Property Read Syntax

References:
_Apl_
[1](https://aplwiki.com/wiki/Bracket_indexing)

Categories: Syntax
