# environmentVariable

- _environmentVariable(system, k)_
- _environmentVariable(system, k, v)_

With two arguments read the environment variable with key _k_,
with three arguments set _k_ to the indicated value _v_,
which must be a `String`.

Set 'Editor' to 'emacs':

```
>>> system.environmentVariable(
>>> 	'Editor',
>>> 	'emacs'
>>> )
nil
```

Read 'Editor':

```
>>> system.environmentVariable(
>>> 	'Editor'
>>> )
'emacs'
```

If the requested variable is not set, answers `nil`:

```
>>> system.environmentVariable(
>>> 	'NoSuchVariable'
>>> )
nil
```

* * *

See also: environmentVariables

Guides: System Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Environment.html),
_Posix_
[1](https://pubs.opengroup.org/onlinepubs/9799919799/functions/getenv.html)
[2](https://pubs.opengroup.org/onlinepubs/9799919799/functions/setenv.html)

Categories: System
