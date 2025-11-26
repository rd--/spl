# rejectedPromise

- _rejectedPromise(e)_

Answers a new `Promise` rejected with the error _e_.

```
>>> Error('X')
>>> .rejectedPromise
>>> .onRejection { :e |
>>> 	{ e.messageText = 'X' }.assert
>>> }.isPromise
true
```

* * *

See also: Promise, resolvedPromise

Guides: Asynchronous Functions

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise.reject)
