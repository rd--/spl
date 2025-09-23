# diceSorensenCoefficient

- _diceSorensenCoefficient(m₁, m₂)_

Answer the Dice-Sørensen coefficient for the two multisets _m₁_ and _m₂_.

One half:

```
>>> let x = [1 3];
>>> let y = [1 2];
>>> x.diceSorensenCoefficient(y)
(2 * 1) / (2 + 2)
```

Four sevenths:

```
>>> let x = [1 3 4];
>>> let y = [1 2 4 5];
>>> x.diceSorensenCoefficient(y)
(2 * 2) / (3 + 4)
```

Two thirds:

```
>>> let x = [1 1 2 3 3 3];
>>> let y = [1 2 3];
>>> x.diceSorensenCoefficient(y)
(2 * 3) / (6 + 3)

>>> let x = [1 2 2 3 3 3];
>>> let y = [1 1 2 2 2 3];
>>> x.diceSorensenCoefficient(y)
(2 * 4) / (6 + 6)
```

Six elevenths:

```
>>> let x = [1 1 2 3 3 3];
>>> let y = [1 2 2 2 3];
>>> x.diceSorensenCoefficient(y)
(2 * 3) / (6 + 5)
```

Five sixths:

```
>>> let x = [1 2 2 3 3 3];
>>> let y = [1 1 2 2 3 3];
>>> x.diceSorensenCoefficient(y)
(2 * 5) / (6 + 6)
```

* * *

See also: Multiset

Guides: List Functions, Set Functions, Similarity Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Dice-S%C3%B8rensen_coefficient)
