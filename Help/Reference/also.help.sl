# also

- _also(x, f:/1)_

Evaluate the block _f_ with the object _x_ as argument and answer _x_.

See `in` (or `with`) for a slight variation that answers the answer of _f_ instead.

```
>>> let d = (c: 1);
>>> let r = d.also { :x |
>>> 	x['c'] := 2;
>>> 	0
>>> };
>>> d = (c: 2) & { r == d }
true
```

* * *

See also: in, value, with

Guides: Block Functions

References:
_Kotlin_
[1](https://kotlinlang.org/docs/scope-functions.html#also)
[2](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/also.html)

Categories: Behaviour
