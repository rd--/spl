# Array Assignment Syntax -- syntax

There is array assignment syntax for both temporary variable initialisers:

	| [x, y, z] = [1 * 2, 3 * 4, 5 * 6]; | [z, y, x] = [30, 12, 2]

and for variable assignment:

	| x y z | [x, y, z] := [1 * 2, 3 * 4, 5 * 6]; [z, y, x] = [30, 12, 2]

Note that where in sequential assignment, evaluation and assignment are interleaved:

	| x = 1, y = 2; | x := y + 1; y := x * 2; [x, y] = [3, 6]

in array assignment the right hand side expression is evaluated before any assignments are made:

	| [x, y] = [1, 2]; | [x, y] := [y + 1, x * 2]; [x, y] = [3, 2]

This latter form can significantly reduce the need for declared temporaries in expressions that update a set of inter-related variables, c.f. the array case:

	| [x, y, z] = [1, 2, 3]; | [x, y, z] := [x * y + z, x + y * z, x + y + z]; [x, y, z] = [5, 9, 6]

and the equivalent interleaved case:

	| x = 1, y = 2, z = 3; | x := x * y + z; y := x + y * z; z := x + y + z; [x, y, z] = [5, 21, 29]
	| x = 1, y = 2, z = 3, x1 = nil, y1 = nil, z1 = nil; | x1 := x * y + z; y1 := x + y * z; z1 := x + y + z; x := x1; y := y1; z := z1; [x, y, z] = [5, 9, 6]

* * *

See also: [Dictionary Assignment Syntax]
