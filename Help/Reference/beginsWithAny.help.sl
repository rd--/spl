# beginsWithAny

- _beginsWithAny([x₁ x₂ …], [y₁ y₂ …])_

Answer if the sequence _x_ begins with any element of the collection _y_.

```
>>> [1 .. 5].beginsWithAny(
>>> 	[4 5; 3 4; 2 3]
>>> )
false

>>> [1 .. 5].beginsWithAny(
>>> 	[0 1; 1 2; 2 3]
>>> )
true
```

* * *

See also: beginsWith, endsWithAnyOf

Guides: List Functions

Categories: Testing
