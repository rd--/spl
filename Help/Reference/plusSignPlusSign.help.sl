# ++

- _c₁ ++ c₂_
- _c.++_

The binary case is the operator form of `concatenation`.

```
>>> [1 2 3] ++ [4 5 6]
concatenation([1 2 3], [4 5 6])
```

The unary case is the operator form of `catenate`:

```
>>> [1 2 3; 4 5 6].++
catenate([1 2 3; 4 5 6])
```

A sequence of intervals:

```
>>> [1:16 20:22 26:28 32:33 39:40 44:45].++
[
	1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
	20 21 22
	26 27 28
	32 33
	39 40
	44 45
]
```

Where supported `++` is displayed as ⧺.

The name of this operator is `plusSignPlusSign`.

_Note:_
In Smalltalk the binary form is the comma operator.

* * *

See also: +++, catenate, concatenation

Guides: Dictionary Functions, List Functions, Operator Lists

Unicode: U+29FA ⧺ Double plus

Categories: Copying
