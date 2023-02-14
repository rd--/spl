# cull -- evaluating

- _cull(aProcedure, firstArg)_
- _cull(aProcedure, firstArg, secondArg)_

Activate the receiver, with two or one or zero arguments.

_cull_ calls _numArgs_ to ask how many arguments are required, and passes only the required number of arguments.

```
{ :x | 0 - x }.cull(3, 4) = -3
```

* * *

See also: _numArgs_
