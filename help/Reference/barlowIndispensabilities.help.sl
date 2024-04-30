# barlowIndispensabilities

- _barlowIndispensabilities(p)_

Answer the sequence of all indispensability values,
as given by `barlowIndispensability`,
for the sequence of prime numbers _p_ at indices _(1, p.product)_.

For metres 3/4 and 6/8:

```
>>> [3 2].barlowIndispensabilities
[5 0 3 1 4 2]

>>> [2 3].barlowIndispensabilities
[5 0 2 4 1 3]
```

For 12/6 and 15/8:

```
>>> [2 2 3].barlowIndispensabilities
[11 0 4 8 2 6 10 1 5 9 3 7]

>>> [3 5].barlowIndispensabilities
[14 0 9 3 6 12 1 10 4 7 13 2 11 5 8]
```

* * *

See also: barlowBasicIndispensability, barlowIndigestibility, barlowIndispensability

Further Reading: Barlow 1987
