# atAllPutAll

- _atAllPutAll([x₁ x₂ …], [i₁ i₂ …], [y₁ y₂ …])_

Store the elements of the list _y_ into the slots of the sequence _x_ selected by the indices _i_.
Answer _y_.

```
>>> let a = 9.iota;
>>> let b = [3 .. 7];
>>> let c = [7, 6 .. 3];
>>> let d = a.atAllPutAll(b, c);
>>> (a, d)
([1 2 7 6 5 4 3 8 9], c)
```

Using `Range` as indices and values:

```
>>> let l = 9.iota;
>>> l.atAllPutAll(3:7, 7:-1:3);
>>> l
[1 2 7 6 5 4 3 8 9]
```

* * *

See also: atAllPut

Guides: List Functions

Categories: Accessing
