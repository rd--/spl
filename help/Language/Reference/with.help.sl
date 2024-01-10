# with -- behaviour

- _with(anObject, aBlock:/1)_

Evaluate _aBlock_ with _anObject_ as argument and answer the answer of _aBlock_.

This is _value_ with argument order reversed, ie. _with(x, f)_ is equal to _value(f, x)_.

It is can be used where a "cascade" would be in Smalltalk,
to apply a sequence of message sends to an object and answer the value of the last.

See _also_ for a slight variation that answers _anObject_ instead.

```
let d = (c: 1);
let r = d.with { :x | x::c := 2; 0 };
d = (c: 2) & { r = 0 }
```

* * *

See also: also, value
