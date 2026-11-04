# Workspace Variable Syntax

- _workspace.x := y_

Workspace variable syntax provides a shorthand for referring to values stored in the `workspaceVariableDictionary` at `system`.

Workspace variable assignment:

```
>> 'workspace.x := y'.splSimplify
workspaceVariableAssignment!(system, 'x', y)
```

Workspace variable reference:

```
>> 'workspace.x'.splSimplify
workspaceVariableReference(system, 'x')
```

Assign workspace variable,
answers the assigned value:

```
>>> let x = workspace.x := 23;
>>> x
23

>>> system
>>> .workspaceVariableDictionary['x']
>>> := 23
23
```

Reference workspace variable:

```
>>> workspace.x
23

>>> system
>>> .workspaceVariableDictionary['x']
23
```

It is an error to reference an undefined workspace variable:

```
>>> {
>>> 	workspace.undefinedVariable
>>> }.hasError
true
```

* * *

Guides: Let Syntax, Syntax Guides
