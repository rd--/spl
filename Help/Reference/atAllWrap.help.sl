# atAllWrap

- _atAllWrap([x₁ x₂ …], [i₁ i₂ …])_

Answer the elements at each item of the index sequence _i_ in the sequence _x_.
If any index is out of bounds, let it wrap around from the end to the beginning until it is in bounds.

```
>>> 1:5.atAllWrap(-1:9)
[4 5 1 2 3 4 5 1 2 3 4]
```

* * *

See also: at, atAll, atFold, atPin, atPutWrap

Categories: Acccessing
