# rejectedPromise

- _rejectedPromise(anError)_

Answers a new `Promise` rejected with _anError_.

```
>>> Error('X')
>>> .rejectedPromise
>>> .thenElse { :unusedAnswer |
>>> 	'Y'.error
>>> } { :err |
>>> 	{ err.messageText = 'X' } .assert
>>> }.isPromise
true
```

* * *

See also: Promise, resolvedPromise

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise.reject)
