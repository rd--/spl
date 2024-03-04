# ifError

- _ifError(aBlock:/0, errorHandlerBlock)_

Evaluate _aBlock_ and if there is no error then that is the answer.
If an error occurs evaluate _errorHandlerBlock_ and that is the answer.
_errorHandlerBlock_ must accept zero or one parameter (the Error).

```
>>> { 1.anUnknownMessage }.ifError { :err | err }.isError
true

>>> { 1.anUnknownMessage }.ifError { true }
true
```

* * *

See also: Error

References:
_Smalltalk_
5.4.3.2

Categories: Evaluating
