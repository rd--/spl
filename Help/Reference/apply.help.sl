# apply

- _apply(f:/n, [x₁ x₂ …])_

Apply the block _f_ to the arguments at the list _x_.
It is an error if _x_ is not a `List` or has the wrong number of arguments.

```
>>> { :x :y |
>>> 	x * y + y
>>> }.apply([3.141 23])
95.243

>>> +.apply([3 4])
7
```

C.f. `value`:

```
>>> { :x :y |
>>> 	x * y + y
>>> }.value(3.141, 23)
95.243

>>> +.value(3, 4)
7
```

C.f. `valueWithArguments`:

```
>>> { :x :y |
>>> 	x * y + y
>>> }.valueWithArguments([3.141 23])
95.243

>>> +.valueWithArguments([3 4])
7
```

* * *

See also: Block, cull, List, value

Guides: Block Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Apply.html)

Categories: Evaluating
