# in

- _in(x, f/1)_

Evaluate the block _f_ with the object _x_ as argument and answer the answer of _f_.
`in` is an alias for `with`, following the Squeak naming of this method.

`in` is `swap` of `unaryApply`, ie. _in(α,β)_ is equal to _unaryApply(β,α)_.

`in` can be used where a "cascade" would be in Smalltalk,
to apply a sequence of message sends to an object and answer the value of the last.

See `also` for a slight variation that answers _x_ instead.

```
>>> let d = (c: 1);
>>> let r = d.in { :x |
>>> 	x['c'] := 2;
>>> 	0
>>> };
>>> d = (c: 2) & { r = 0 }
true

>>> (3 * 3 * 3).in(cubeRoot/1)
3
```

* * *

See also: also, value, with

Guides: Block Functions

Categories: Accessing, Behaviour
