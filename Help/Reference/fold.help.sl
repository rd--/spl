# fold

- _fold(x, ⌊=-1, ⌈=1)_

Fold _x_ to lie between ⌊ and ⌈.

Threads over lists,
equivalent to `identity` at and between the boundaries:

```
>>> [-1 0 1].fold(-1, 1)
[-1 0 1]
```

Fold an integer between two indices:

```
>>> 1:9.fold(3, 7)
[5 4 3 4 5 6 7 6 5]
```

Fold a floating point number between two values:

```
>>> let x = (0.2, 0.3 .. 0.8);
>>> let y = x.fold(0.3, 0.7);
>>> (y * 10).round
[4 3 4 5 6 7 6]
```

Fold a signal outside given thresholds.

```
let o = SinOsc(440, 0) * 0.2;
o.fold(-0.1, 0.1)
```

Modulate both fold points, at different ratios:

```
let x = MouseX(0.1, 0.2, 0, 0.2);
let o = SinOsc(440, 0) * 0.2;
o.fold(x.- / 2, x)
```

Modulate one fold point:

```
let x = MouseX(0.1, 0.2, 0, 0.2);
let o = SinOsc(440, 0) * 0.2;
o.fold(-0.2, x)
```

Plot a triangle wave formed by folding a line:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	(x * 4).fold(-1, 1)
}
~~~

![](Help/Image/fold-A.svg)

_Note_:
In SuperCollider,
the unary `Fold` defaults to _0,1_.

* * *

See also: atFold, atWrap, foldIndex, wrapExclusive

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_common_fold/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Fold.html)
