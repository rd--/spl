# applyList

- _applyList(f/n, [x₁ x₂ …])_

Apply the block _f_ to the arguments at the list _x_.
It is an error if _x_ is not a `List` or has the wrong number of arguments.

```
>>> { :x :y |
>>> 	x * y + y
>>> }.applyList([3.141 23])
95.243

>>> +.applyList([3 4])
7
```

C.f. `apply`:

```
>>> { :x :y |
>>> 	x * y + y
>>> }.apply(3.141, 23)
95.243

>>> +.apply(3, 4)
7
```

There is an unchecked form:

```
>>> { :x :y |
>>> 	x * y + y
>>> }.uncheckedApplyList([3.141 23])
95.243

>>> +.uncheckedApplyList([3 4])
7
```

* * *

See also: Block, List, apply, cull

Guides: Block Functions

References:
_Lisp_
[1](http://clhs.lisp.se/Body/f_apply.htm),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Apply.html)

Categories: Evaluating
