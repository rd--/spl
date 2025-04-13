# uncheckedAtPut

- _uncheckedAtPut(aCollection, anIndex, aValue)_

Unchecked mutation, answers _aValue_.

```
>>> let l = ['a' 'b' 'c' 'd' 'e' 'f'];
>>> let x = l.uncheckedAtPut(3, 'x');
>>> (x, l.size, l.at(3))
('x', 6, 'x')
```

At `List` extends list for out of range indices,
however the behaviour is undefined.

```
>>> let l = [];
>>> let x = l.uncheckedAtPut(3, 'x');
>>> (x, l.size, l.at(3))
('x', 3, 'x')
```

* * *

See also: atPut, uncheckedAt

Guides: Slot Access Syntax

Categories: Accessing
