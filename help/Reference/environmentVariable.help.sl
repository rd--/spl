# environmentVariable

- _environmentVariable(aSystem, aKey)_
- _environmentVariable(aSystem, aKey, aValue)_

With two arguments read the named environment variable,
with three arguments set it to the indicated value,
which must be a `String`.

Set _EDITOR_ to _emacs_:

```
>>> system.environmentVariable('EDITOR', 'emacs')
nil
```

Read _EDITOR_:

```
>>> system.environmentVariable('EDITOR')
'emacs'
```

* * *

Categories: System
