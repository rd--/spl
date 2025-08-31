# do

- _do(c, f:/1)_

Evaluate the block _f_ with each element of the collection _c_ as the argument.
Answers _c_.

```
>>> let c = [];
>>> let x = 1:9.do { :each |
>>> 	c.add(each)
>>> };
>>> (x, c)
(1:9, [1 .. 9])
```

It is not safe to modify a mutable collection that is being iterated over,
instead a copy should be used:

```
>>> let c = [1 .. 9];
>>> c.copy.do { :each |
>>> 	each.isOdd.ifTrue {
>>> 		c.add(each)
>>> 	}
>>> };
>>> c
[1 2 3 4 5 6 7 8 9 1 3 5 7 9]
```

_Rationale:_
`do` is the only required method of the `Iterable` trait.
All collection types are iterable.

* * *

See also: associationsDo, collect, Iterable, keysAndValuesDo, keysDo, timesRepeat, valuesDo

Guides: Dictionary Functions, List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Do.html)
[2](https://reference.wolfram.com/language/ref/Scan.html),
_Smalltalk_
5.7.1.13

Categories: Enumerating
