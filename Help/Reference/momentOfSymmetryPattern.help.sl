# momentOfSymmetryPattern

- _momentOfSymmetryPattern(generator, period, long='L', short='s')_

Answer a `String` that indicates the pattern of long and short intervals of the moment of symmetry specified by _generator_ and _period_,
which should be co-prime integers.

The pattern of the _7/12_ moment of symmetry:

```
>>> 7.momentOfSymmetryPattern(12)
'LLLsLLs'
```

This pattern occurs as the final scale of `momentOfSymmetry` of _5/12_,
where _L_ is two and _s_ is one:

```
>>> 7.momentOfSymmetry(12).last
[2 2 2 1 2 2 1]
```

It also occurs,
in a rotated form,
as the fourth scale of _10/17_,
where _L_ is three and _s_ is one:

```
>>> 10.momentOfSymmetry(17).fourth
[3 3 3 1 3 3 1]
```

Also as the fourth scale of _11/19_,
where _L_ is three and _s_ is two:

```
>>> 11.momentOfSymmetry(19).fourth
[3 3 3 2 3 3 2]
```

Also as the fourth scale of _13/22_,
where _L_ is four and _s_ is one:

```
>>> 13.momentOfSymmetry(22).fourth
[4 4 4 1 4 4 1]
```

And so on indefinitely.

* * *

See also: isMomentOfSymmetry, momentOfSymmetry, Scale

Guides: Xenharmonic Functions

References:
_Anaphoria_
[1](https://www.anaphoria.com/wilsonintroMOS.html),
_Xenharmonic_
[1](https://en.xen.wiki/w/Recursive_structure_of_MOS_scales)
