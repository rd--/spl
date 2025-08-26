# reverseInPlace

- _reverseInPlace([x₁ x₂ …])_

Reverse the sequence _x_ in place,
answering _x_.

At `List`:

```
>>> let x = [1 3 5 7];
>>> (x.reverseInPlace == x, x)
(true, [7 5 3 1])
```

At `Range`:

```
>>> let x = Range(9, 1, -2);
>>> (x.reverseInPlace == x, x)
(true, Range(1, 9, 2))
```

* * *

See also: reverse, reverseDo, reverseWithDo

Categories: Rearranging
