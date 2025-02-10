# over

- _over(aBlock:/2, anotherBlock:/1)_
- _over(aColour, anotherColour)_

Answer a Block that applies _anotherBlock_ to pre-processes the arguments of _aBlock_.

The pointwise maxima of the negation of two lists:

```
>>> max:/2.over(negated:/1) . (
>>> 	[3 1 2], [4 6 5]
>>> )
[-3 -1 -2]

>>> [3 1 2] max.over(negated:/1) [4 6 5]
[-3 -1 -2]

>>> [3 1 2].-.max([4 6 5].-)
[-3 -1 -2]
```

Add the `max` of two lists:

```
>>> +.over(max:/1) . ([3 1 2], [4 6 5])
9

>>> [3 1 2] +.over(max:/1) [4 6 5]
9

>>> [3 1 2].max + [4 6 5].max
9
```

At `Colour` place one colour over another:

```
>>> let red = RgbColour([1, 0, 0], 0.5);
>>> let green = RgbColour([0, 1, 0], 0.5);
>>> red.over(green)
RgbColour([1 / 3, 2 / 3, 0], 3 / 4)
```

* * *

See also: atop

References:
_Apl_
[1](https://aplwiki.com/wiki/Over)

Further Reading: Porter 1984

Categories: Adverbs
