# collectInto

- _collectInto(c₁, f/1, c₂)_

Evaluate the block _f_ with each elements of the collection _c₁_ as the argument.
Collect the resulting values into another collection _c₂_.
Answer _c₂_.

```
>>> let a = List(4, nil);
>>> let b = [1 3 5 7];
>>> b.collectInto(
>>> 	{ :each | each * each},
>>> 	a
>>> );
>>> a
[1 9 25 49]
```

* * *

See also: collect

Guides: Enumeration Functions

Categories: Enumerating
