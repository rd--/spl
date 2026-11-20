# workspace

- _workspace['x'] := y_

`workspace` is a value of type `Record`.
Workspace variables are a simple mechanism for communicating values between distinct programs.

Write to the workspace variable _x_,
and assign the value to a local variable _x_:

```
>>> let x = workspace['x'] := 'y';
>>> x
'y'
```

Check if the workspace has a variable named _x_:

```
>>> workspace.includesKey('x')
true
```

Read from the workspace variable _x_:

```
>>> let x = workspace['x'];
>>> x
'y'
```

Clear the workspace:

```
>>> workspace.removeAll!;
>>> workspace.size
0L
```

* * *

See also: Record, System, at, put, system

Guides: Workspace Variables
