# also

_also(anObject, aBlock:/1)_

Evaluate _aBlock_ with _anObject_ as argument and answer _anObject_.

See _in_ (or _with_) for a slight variation that answers the answer of _aBlock_ instead.

```
>>> let d = (c: 1);
>>> let r = d.also { :x | x::c := 2; 0 };
>>> d = (c: 2) & { r == d }
true
```

* * *

See also: in, value, with

References:
_Kotlin_
[1](https://kotlinlang.org/docs/scope-functions.html#also)
[2](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/also.html)

Categories: Behaviour
