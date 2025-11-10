# matchingDissimilarity

- _matchingDissimilarity(u, v)_

Answer the matching dissimilarity between `Boolean` vectors _u_ and _v_.

Matching dissimilarity between two Boolean vectors:

```
>>> let u = [1 0 1 1 0];
>>> let v = [1 1 0 1 1];
>>> u.matchingDissimilarity(v)
3/5
```

The elements can also be `true` and `false`:

```
>>> let u = [true false true];
>>> let v = [true true false];
>>> u.matchingDissimilarity(v)
2/3
```

Compute dissimilarity between any 0, 1 vectors of equal length:

```
>>> let r = Sfc32(673124);
>>> let u = r.randomInteger([0 1], [100]);
>>> let v = r.randomInteger([0 1], [100]);
>>> u.matchingDissimilarity(v)
11/25
```

Compute dissimilarity between any `false`, `true` vectors of equal length:

```
>>> let r = Sfc32(673124);
>>> let u = r.randomBoolean(0.5, [1000]);
>>> let v = r.randomBoolean(0.5, [1000]);
>>> u.matchingDissimilarity(v)
121/250
```

Matching dissimilarity is bounded by 0 and 1:

```
>>> [1 1 1 1].matchingDissimilarity([1 1 1 1])
0

>>> [1 1 1 1].matchingDissimilarity([0 0 0 0])
1
```

* * *

See also: jaccardDissimilarity

Guides: Similarity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MatchingDissimilarity.html)
