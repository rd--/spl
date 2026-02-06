# recordValues

- _recordValues([x₁ x₂ …], f:/2)_

Answer the record values of the sequence _x_.
A value is a record if it is greater than and preceding value according to _f_,
ordinarily `<`.

Record maxima:

```
>>> [1 2 0 4 5 3 7 8 6 10 11 9 13 14 12 16]
>>> .recordValues
[1 2 4 5 7 8 10 11 13 14 16]
```

Record minima:

```
>>> [16 12 14 13 9 11 10 6 8 7 3 5 4 0 2 1]
>>> .recordValues(<)
[16 12 9 6 3 0]
```

* * *

See also: <, >, min, max

Guides: List Functions
