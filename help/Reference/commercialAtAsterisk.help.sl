# @*

- aBlock:/1 @* aBlock:/1
- aCollection @* aCollection

At `Block` the operator (infix) form of _compose_:

```
>>> (squared:/1 @* sqrt:/1) . (23)
23
```

At `Collection` the operator (infix) form of _atAll_.

```
>>> let c = [1 .. 9];
>>> c @* [3 5 7]
[3 5 7]
```

The name of this operator is `commercialAtAsterisk`.

* * *

See also: @, @>, atAll, compose

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Composition.html)

Categories: Accessing
