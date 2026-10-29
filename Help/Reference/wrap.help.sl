# wrap

- _wrap(x, ⌊=-1, ⌈=1)_

Wrap _x_ so that it lies, inclusively, between ⌊ and ⌈.

```
>>> 1.5.wrap(-1, 1)
-0.5

>>> -1.5.wrap
0.5
```

Threads elementwise over lists:

```
>>> [-2 -1 0 1 2].wrap(-1, 1)
[0 -1 0 1 0]

>>> [-1.5 .. 1.5; 0.5].wrap
[0.5 -1 -0.5 0 0.5 1 -0.5]
```

Within the boundaries equivalent to `identity`:

```
>>> [-1 0 1].wrap
[-1 0 1]
```

Wrap between two integer indices,
note that both boundaries are included in the answer:

```
>>> 1:9.wrap(3, 7)
[5 6 3 4 5 6 7 4 5]

>>> 0:12.wrap(0, 3)
[0 1 2 3 1 2 3 1 2 3 1 2 3]
```

Wrap a real number between two values:

```
>>> [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9]
>>> .wrap(0.3, 0.7)
[0.5 0.6 0.3 0.4 0.5 0.6 0.7 0.4 0.5]
```

Wrap a (-0.2, 0.2) sine tone to (-0.15, 0.15):

~~~spl syn=A
(sinOsc(440, 0) * 0.2)
.wrap(-0.15, 0.15)
~~~

Wrap frequency input:

~~~spl syn=B
let z = sinOsc(
	1 / 11,
	0
).linLin(-1, 1, 100, 200);
sinOsc(
	z.wrap(
		[110, 130],
		[190, 170]
	),
	0
) * 0.1
~~~

Plot a sawtooth wave formed by wrapping a line:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	(x * 4).wrap(-1, 1)
}
~~~

![](Help/Image/wrap-A.svg)

* * *

See also: atFold, atWrap, fold, foldIndex, wrapExclusive, wrapIndex

Guides: Indexing Functions

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_common_wrap/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Wrap.html)

Categories: Testing
