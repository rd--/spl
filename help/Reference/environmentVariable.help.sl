# environmentVariable

- _environmentVariable(aSystem, aKey)
- _environmentVariable(aSystem, aKey, aValue)

With one argument read the named environment variable,
with two arguments set it to the indicated value (which must be a `String`).

```
>>> system.environmentVariable('EDITOR', 'emacs')
nil

>>> system.environmentVariable('EDITOR')
'emacs'
```

* * *

Categories: System
