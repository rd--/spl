# apply

- _apply(f:/n, [x₁ x₂ …])_

Apply the block _f_ to the arguments at the list _x_.
It is an error if _x_ is not a `List` or has the wrong number of arguments.

```
>>> { :x :y |
>>> 	x * y + y
>>> }.apply([3.141 23])
95.243
```

C.f. `value`:

```
>>> { :x :y |
>>> 	x * y + y
>>> }.value(3.141, 23)
95.243
```

C.f. `valueWithArguments`:

```
>>> { :x :y |
>>> 	x * y + y
>>> }.valueWithArguments([3.141 23])
95.243
```

* * *

See also: Block, cull, List, value

Guides: Block Functions

Categories: Evaluating
