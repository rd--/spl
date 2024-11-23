# resolvedPromise

- _resolvedPromise(anObject)_

Answers either a new `Promise` resolved with _anObject_,
or _anObject_ itself if it is a `Promise`.

```
>>> let promise = 'answer'.resolvedPromise;
>>> promise.isPromise
true
```

* * *

See also: Promise, rejectedPromise

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise.resolve)
