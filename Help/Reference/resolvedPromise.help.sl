# resolvedPromise

- _resolvedPromise(x)_

Answers either a new `Promise` resolved with the object _x_,
or _x_ itself if it is a `Promise`.

```
>>> let promise = 'answer'.resolvedPromise;
>>> promise.isPromise
true
```

* * *

See also: Promise, rejectedPromise

Guides: Asynchronous Functions

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise.resolve)
