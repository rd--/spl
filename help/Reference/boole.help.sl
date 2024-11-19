# boole

- _boole(aBoolean)_

Answer 1 if _aBoolean_ is `true` and 0 if it is `false`.

```
>>> [false.boole, true.boole]
[0 1]
```

Threads over lists, convert a list of truth values to integers:

```
>>> [true false true true false].boole
[1 0 1 1 0]
```

The inverse of `boole` is `asBoolean`:

```
>>> [1 0 1 1 0].collect(asBoolean:/1)
[true false true true false]
```

It is an error if _anObject_ is not a `Boolean`:

```
>>> { 'true'.boole }.ifError { true }
true
```

* * *

See also: asBit, asBoolean, asInteger

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Boole.html)

Categories: Math, Numerical
