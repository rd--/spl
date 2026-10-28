# timesPlus

- _timesPlus(i, j=1, k=0)_

Answer _i*j+k_.
In some cases this may be optimised as a fused multiply-add operator.
The identity function if _j=1_ and _k=0_.

```
>>> 3.timesPlus(4, 5)
3 * 4 + 5
```

The operator form is `*+`:

```
>>> 3.*+(4, 5)
17

>>> 3 * 4 + 5
17
```

Threads over lists:

```
>>> [1 2 3].timesPlus([4 5 6], [7 8 9])
[
	1 * 4 + 7,
	2 * 5 + 8,
	3 * 6 + 9
]

>>> [1 2 3] * [4 5 6] + [7 8 9]
[11 18 27]

>>> 2.*+([3 4 5], [6 7])
[12 15 16]

>>> 2 * [3 4 5] + [6 7]
[12 15 16]

>>> [3 4 5].*+([6 7], 8)
[26 36 38]

>>> [3 4 5] * [6 7] + 8
[26 36 38]
```

At `Ugen`:

~~~
sinOsc(440, 0).*+(
	0.1,
	0
)
~~~

* * *

See also: *, +, plus, times

Guides: Arithmetic Functions, Mathematical Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/MulAdd.html)
