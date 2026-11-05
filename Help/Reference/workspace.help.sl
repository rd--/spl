# workspace

- _workspace.x := y_

`workspace` is a keyword that makes assignment to,
and referencing of,
values in the workspace variable dictionary more concise.

```
>>> let a = workspace.x := 'y';
>>> (a, workspace.x)
(nil, 'y')

>>> system
>>> .workspaceVariableDictionary
>>> .includesKey('x')
true

>>> system
>>> .workspaceVariableDictionary
>>> .at('x')
'y'
```


* * *

See also: Record, System, at, put, system

Guides: Workspace Variable Syntax
