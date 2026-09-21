# over

- _over(f/2, f/1)_
- _over(c₁, c₂)_

Answer a `Block` that applies the unary block _f_ to pre-processes the arguments of the binary block _g_.

The pointwise maxima of the negation of two lists:

```
>>> max/2.over(negate/1) . (
>>> 	[3 1 2], [4 6 5]
>>> )
[-3 -1 -2]

>>> max/2.over(negate/1).value([3 1 2], [4 6 5])
[-3 -1 -2]

>>> [3 1 2].-.max([4 6 5].-)
[-3 -1 -2]
```

Add the `max` of two lists:

```
>>> +.over(max/1) . ([3 1 2], [4 6 5])
9

>>> [3 1 2] +.over(max/1) [4 6 5]
9

>>> [3 1 2].max + [4 6 5].max
9
```

At `Colour` place one colour over another:

```
>>> let red = RgbColour([1 0 0], 0.5);
>>> let green = RgbColour([0 1 0], 0.5);
>>> red.over(green)
RgbColour([1/3 2/3 0], 3/4)
```

* * *

See also: atop

References:
_Apl_
[1](https://aplwiki.com/wiki/Over)

Further Reading: Porter 1984

Categories: Adverbs
