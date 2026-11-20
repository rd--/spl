# Workspace Variables

- _workspace['x'] := y_

Workspace variables provide a mechanim to communicate values between programs.
The variable `workspace` is system defined, like the `system` variable.

Workspace variable assignment.
Assigning a workspace variable answers the assigned value:

```
>>> let x = workspace['x'] := 3.141;
>>> x
3.141
```

Workspace variable reference:

```
>>> let x = workspace['x'];
>>> x
3.141
```

Check if the workspace has a particular variable:

```
>>> workspace.includesKey('x')
true
```

Reference workspace variable:

```
>>> let x = workspace['x'];
>>> x
3.141
```

It is an error to reference an undefined workspace variable:

```
>>> {
>>> 	workspace['undefinedVariable']
>>> }.hasError
true
```

Clear the workspace:

```
>>> workspace.removeAll!;
>>> workspace.size
0L
```

* * *

See also: Record, system, workspace

Guides: Assignment Syntax, At Syntax
