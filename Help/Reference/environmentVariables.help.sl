# environmentVariables

- _environmentVariable(system)_

Answer a `Record` holding the set of environment variables.
The keys are the names of the environment variables,
and each is associated with its value.

```
>>> let e = system.environmentVariables;
>>> (
>>> 	e.includesKey('PATH'),
>>> 	e.at('HOME')
>>> )
(true, '/home/rohan')
```

* * *

See also: environmentVariable

Guides: System Functions

Categories: System
