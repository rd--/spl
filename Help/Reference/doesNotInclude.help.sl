# doesNotInclude

- _doesNotInclude(aCollection, anObject)_

Answer whether _aCollection_ does not contain _anObject_ as a member.

At `List`:

```
>>> [1 .. 7].doesNotInclude(9)
true
```

At `Range`:

```
>>> (1, 3 .. 21).doesNotInclude(6)
true
```

Where supported `doesNotInclude` is displayed as ∌.

* * *

See also: includes, noneSatisfy

Unicode: U+220C ∌ Does not contain as member

Categories: Testing
