# error

- _error(x, s)_

Generate an `Error` value and then `signal` it.

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

Guides: Control Functions

References:
_Smalltalk_
5.3.1.8

Categories: Error, Exception
