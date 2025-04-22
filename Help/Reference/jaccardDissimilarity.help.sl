# jaccardDissimilarity

- _jaccardDissimilarity(u, v)_

Answer the Jaccard dissimilarity between Boolean vectors _u_ and _v_.

Jaccard dissimilarity between two boolean vectors:

```
>>> let u = [1 0 1 1 0];
>>> let v = [1 1 0 1 1];
>>> u.jaccardDissimilarity(v)
3/5
```

The elements can also be `true` and `false`:

```
>>> let u = [true false true];
>>> let v = [true true false];
>>> u.jaccardDissimilarity(v)
2/3
```

Compute dissimilarity between any 0, 1 vectors of equal length:

```
>>> let r = Sfc32(934712);
>>> let u = r.randomInteger([0 1], 1000);
>>> let v = r.randomInteger([0 1], 1000);
>>> u.jaccardDissimilarity(v)
281/418
```

Jaccard dissimilarity is bounded by 0 and 1:

```
>>> [1 1 1 1].jaccardDissimilarity([1 1 1 1])
0

>>> [0 0 0 0].jaccardDissimilarity([1 1 1 1])
1
```

* * *

See also: centralFeature, nearest

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/JaccardDissimilarity.html),
_W_
[1](https://en.wikipedia.org/wiki/Jaccard_index)
