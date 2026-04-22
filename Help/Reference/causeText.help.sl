# causeText

- _causeText(e)_

Answer a `String` describing the cause of the error _e_.

```
>>> Error('B', Error('A')).causeText
'Error: A'

>>> Error('B', Error('A')).messageText
'B'

>>> Error('B', Error('A')).description
'Error: B: Error: A'
```

The `cause` need not be another `Error`:

```
>>> Error('Not an integer', 3.141)
>>> .description
'Error: Not an integer: 3.141'
```

* * *

See also: cause, description, Error, messageText

Guides: Error Functions
