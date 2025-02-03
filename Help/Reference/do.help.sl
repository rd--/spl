# do

- _do(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each element of _aCollection_ as the argument.
Answers _aCollection_.

```
>>> let list = [];
>>> let answer = 1:9.do { :each | list.add(each) };
>>> (answer, list)
(1:9, [1 .. 9])
```

It is not safe to modify a mutable collection that is being iterated over,
instead a copy should be used:

```
>>> let list = [1 .. 9];
>>> list.copy.do { :each |
>>> 	each.isOdd.ifTrue {
>>> 		list.add(each)
>>> 	}
>>> };
>>> list
[1 2 3 4 5 6 7 8 9 1 3 5 7 9]
```

_Rationale:_
`do` is the only required method of the `Iterable` trait.
All collection types are iterable.

* * *

See also: associationsDo, collect, Iterable, keysAndValuesDo, keysDo, timesRepeat, valuesDo

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Do.html)
[2](https://reference.wolfram.com/language/ref/Scan.html),
_Smalltalk_
5.7.1.13

Categories: Enumerating
