# doesNotInclude

- _doesNotInclude(c, x)_

Answer whether the collection _c_ does not contain the object _x_ as a member.

At `List`:

```
>>> [1 .. 7].doesNotInclude(9)
true
```

At `Range`:

```
>>> [1, 3 .. 21].doesNotInclude(6)
true
```

Where supported `doesNotInclude` is displayed as ∌.

* * *

See also: includes, noneSatisfy

Guides: Collection Functions, Dictionary Functions, List Functions

Unicode: U+220C ∌ Does not contain as member

Categories: Testing
