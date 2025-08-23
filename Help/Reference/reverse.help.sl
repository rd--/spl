# reverse

- _reverse([x₁ x₂ …])_

Reverse the sequence _x_ in place,
answering _x_.

At `List`:

```
>>> let x = [1 3 5 7];
>>> (x.reverse == x, x)
(true, [7 5 3 1])
```

At `Range`:

```
>>> let x = Range(9, 1, -2);
>>> (x.reverse == x, x)
(true, Range(9, 1, 2))
```

* * *

See also: reversed, reverseDo, reverseWithDo

Categories: Rearranging
