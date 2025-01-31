# MulAdd

- _MulAdd(input, mul=1, add=0)_

Multiply and add.
Equivalent to _input * mul + add_ but potentially more efficient.

At `SmallFloat`:

```
>>> MulAdd(3, 3, -2)
3 * 3 - 2
```

At `Ugen`:

~~~
MulAdd(
	SinOsc(440, 0),
	0.1,
	0
)
~~~

* * *

See also: +, *, Plus, Times

Categories: Ugen

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/MulAdd.html)
