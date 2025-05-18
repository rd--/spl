# isPhiWeightedMediantNoble

- _isPhiWeightedMediantNoble(aFraction, anotherFraction)_

Answer `true` if the φ-weighted mediant of two fractions is a noble number.
A number is noble if its continued fraction becomes an infinite sequence of ones.

The φ-weighted mediant of _5/4_ and _9/7_ is noble:

```
>>> isPhiWeightedMediantNoble(5/4, 9/7)
true

>>> phiWeightedMediant(5/4, 9/7)
>>> .continuedFraction(9)
[1 3 1 1 1 1 1 1 1]
```

The φ-weighted mediant of _1/3_ and _1/2_ is noble:

```
>>> isPhiWeightedMediantNoble(1/3, 1/2)
true

>>> phiWeightedMediant(1/3, 1/2)
>>> .continuedFraction(9)
[0 2 2 1 1 1 1 1 1]
```

* * *

See also: convergents, mediant, phiWeightedMediant, weightedMediant

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Merciful_intonation)
