# description

- _description(anError)_

Answer a textual description of the exception.
Describes in a human readable form an occurrence of an exception.
If an explicit message text was provided by the signaler of the exception, that text should be incorporated into the description.

```
>>> Error('message text').description
'Error: message text'
```

* * *

See also: error, Error, messageText

References:
_Smalltalk_
5.5.1.2

Categories: Errors
