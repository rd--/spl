# error

Error handling.

- _error(aString)_
- _error(anObject, aString)_

Generate an _Error_ value and then run _log_ and _signal_ in sequence.

```
>>> { 'An error'.error }.ifError { :err | err.messageText }
'An error'
```

* * *

See also: Error, signal

References:
_Smalltalk_
5.3.1.8

Categories: Error
