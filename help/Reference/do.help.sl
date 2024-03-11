# do

- _do(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each element of _aCollection_ as the argument.

```
>>> let list = [];
>>> 1:9.do { :each | list.add(each) };
>>> list
[1 .. 9]
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
