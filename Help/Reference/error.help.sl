# error

Error handling.

- _error(aString)_
- _error(anObject, aString)_

Generate an `Error` value and then run `signal`.

```
>>> {
>>> 	'An error'.error
>>> }.ifError { :err |
>>> 	err.messageText
>>> }
'An error'
```

* * *

See also: Error, signal

References:
_Smalltalk_
5.3.1.8

Categories: Error, Exception
