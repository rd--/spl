# ValueLink

- _ValueLink(x, l)_

`ValueLink` is a type representing a `Link` in a linked list.
The stored value is _x_,
the next link is _l_,
which may be `nil` to indicate there is no next link.

```
>>> let a = ValueLink(1, nil);
>>> (a.value, a.nextLink, a.size)
(1, nil, 1)
```

* * *

See also: Link, LinkedList

Guides: Collection Functions
