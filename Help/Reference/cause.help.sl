# cause

- _cause(e)_

Answer the cause of the error _e_.

An error with no cause:

```
>>> Error('Invalid key').cause
nil
```

An error with a cause:

```
>>> Error('Invalid key', -1).cause
-1
```

* * *

See also: causeText, description, Error, messageText, name

Guides: Error Functions
