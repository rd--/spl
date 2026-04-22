# Error

- _Error(s, c)_

`Error` is the `Type` of an error.
Answer an `Error` value with message text _s_ and cause _c_.
The cause can be any object, including another error.

Without cause:

```
>>> Error('Invalid key').name
'Error'

>>> Error('Invalid key').messageText
'Invalid key'

>>> Error('Invalid key').description
'Error: Invalid key'

>>> Error('Invalid key').printString
'*ERROR* Error: Invalid key'

>> Error('Invalid key').storeString
Error('Invalid key')
```

With cause:

```
>>> Error('Invalid key', -1).name
'Error'

>>> Error('Invalid key', -1).messageText
'Invalid key'

>>> Error('Invalid key', -1).description
'Error: Invalid key: -1'

>>> Error('Invalid key', -1).printString
'*ERROR* Error: Invalid key: -1'

>> Error('Invalid key', -1).storeString
Error('Invalid key', -1)
```

* * *

See also: cause, causeText, description, error, ifError, messageText, name, signal

Guides: Control Functions, Error Functions

Categories: Exception, Type
