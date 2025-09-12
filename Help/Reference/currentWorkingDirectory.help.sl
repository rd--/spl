# currentWorkingDirectory

- _currentWorkingDirectory(system, p)_

The unary form answer a `String` giving the current working directory of the process.
The answer is a `String`:

```
>>> system
>>> .currentWorkingDirectory
>>> .isString
true
```

The binary form sets the current working directory,
or signals an error if _p_ does not specify a valid directory:

```
>>> system.currentWorkingDirectory(
>>> 	'/tmp'
>>> );
>>> system.currentWorkingDirectory
'/tmp'
```

* * *

See also: environmentVariable, systemCommand

Guides: File Functions, System Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SetDirectory.html)

Categories: System
