# @* (commercialAtAsterisk)

- _f/1 @* g/1_
- _c₁ @* c₂_

Sometimes define at `Block` as the operator (infix) form of `compose`:

```
>>> let @* = compose/2;
>>> (square/1 @* sqrt/1) . (23)
23
```

At a `Collection` sometimes defined as the operator form of `atAll`:

```
>>> let @* = atAll/2;
>>> let c = [1 .. 9];
>>> c @* [3 5 7]
[3 5 7]
```

The name of this operator is `commercialAtAsterisk`.

* * *

See also: @, @>

Guides: Binary Operators, Block Functions

Categories: Accessing
