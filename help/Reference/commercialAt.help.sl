# @

- _aNumber @ anotherNumber_

This operator is the point constructor in Smalltalk.

```
>>> 0@0
Point(0,0)
```

The name of this operator is _commercialAt_.

_Rationale_:
This operator is not given the simpler name of _at_ because that is the name of the lookup and indexing method in Smalltalk.

```
>>> let c = [1 2 3];
>>> c.at(2)
2
```

We want to ensure that the following is an error:

```
>>> let n = 23;
>>> { n[3] }.ifError { true }
true
```

We do however wish to have operator forms for variants of at,
such as atAll and atPath, and @* is a nice mnemonic for atAll.

```
>>> let c = [1 .. 9];
>>> c @ 3
3

>>> let c = [1 .. 9];
>>> c @* [3 5 7]
[3 5 7]
```

* * *

See also: at, [At Syntax]

Categories: Graphics, Accessing
