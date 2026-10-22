# Ordered

`Ordered` is a trait for collections that are ordered according to the manner elements are added and removed.

Methods are:

- `addBefore`
- `addAfter`
- `addAfterIndex`
- `addFirst`
- `addAllFirst`
- `addLast`
- `addAllLast`
- `removeAt`
- `removeFirst`
- `removeLast`

`Ordered` is a `Trait`:

```
>>> system
>>> .traitDictionary['@Ordered']
>>> .isTrait
true
```

Types implementing `Ordered`:

```
>>> system
>>> .traitTypes('@Ordered')
>>> .sort!
[
	'List'
]
```

* * *

See also: Collection, List

Guides: List Functions

References:
_Smalltalk_
5.7.1.6
5.7.18

Categories: Collection, Trait
