# ifError

- _ifError(aBlock:/0, errorHandlerBlock:/1)_

Evaluate _aBlock_ and if there is no error then that is the answer.
If an error occurs evaluate _errorHandlerBlock_ and that is the answer.

_errorHandlerBlock_ must accept zero or one parameter,
it is evaluated using `cull`,
which will be the `Error` signalled.

With one argument block:

```
>>> {
>>> 	1.anUnknownMessage
>>> }.ifError { :err |
>>> 	err
>>> }.isError
true
```

With no argument block:

```
>>> {
>>> 	1.anUnknownMessage
>>> }.ifError {
>>> 	true
>>> }
true
```

* * *

See also: cull, Error, isError

Guides: Control Functions

References:
_Smalltalk_
5.4.3.2

Categories: Evaluating
