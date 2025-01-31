# Box

- _Box(anObject)_

A `Type` that holds an object, also called a reference type.

`Box` an integer:

```
>>> let b = Box(23);
>>> (b.isBox, b.contents)
(true, 23)
```

`Box` a `List`,
read the `contents`,
and then place a string in the box:

```
>>> let b = Box([3.141 23]);
>>> let l = b.contents;
>>> b.contents := 'x';
>>> (l, b)
([3.141, 23], Box('x'))
```

* * *

See also: contents

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/lt),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Ref.html)
