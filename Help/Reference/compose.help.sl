# compose

- _compose(f/1, g/1)_

An alias for `composeLeft`.

```
>>> let f/1 = -.bind(3).compose(^.bind(7));
>>> f(5)
(3 - (7 ^ 5))
```

* * *

See also: bindLeft, bindRight, composeLeft, composeRight

Guides: Block Functions
