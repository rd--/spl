# in

- _in(anObject, aBlock:/1)_

Evaluate _aBlock_ with _anObject_ as argument and answer the answer of _aBlock_.
`in` is an alias for `with`, following the Squeak naming of this method.

`in` is `value` with argument order reversed, ie. _in(α, β)_ is equal to _value(β, α)_.

`in` can be used where a "cascade" would be in Smalltalk,
to apply a sequence of message sends to an object and answer the value of the last.

See `also` for a slight variation that answers _anObject_ instead.

```
>>> let d = (c: 1);
>>> let r = d.in { :x |
>>> 	x['c'] := 2;
>>> 	0
>>> };
>>> d = (c: 2) & { r = 0 }
true
```

* * *

See also: also, value, with

Categories: Accessing
