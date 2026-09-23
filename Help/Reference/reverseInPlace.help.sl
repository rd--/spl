# reverseInPlace

- _reverseInPlace([x₁ x₂ …])_

Reverse the sequence _x_ in place,
answering _x_.
Ordinarily written using `InPlace Syntax`.

At `List`:

```
>>> let x = [1 3 5 7];
>>> (x.reverse! == x, x)
(true, [7 5 3 1])
```

At `Range`:

```
>>> let x = Range(9, 1, -2);
>>> (x.reverse! == x, x)
(true, Range(1, 9, 2))
```

* * *

See also: reverse, reverseDo, reverseWithDo

Guides: InPlace Syntax, List Functions

Categories: Rearranging
