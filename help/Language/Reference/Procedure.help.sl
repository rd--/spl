# Procedure -- behaviour type

The behaviour type, procedures have fixed arity and myst be applied to the correct number of arguments.

	{ true } . () = true
	{ { true } . (true) }.ifError { :err | true }
	{ :x | x * x } . (9) = 81
	{ { : x | x * x } . () }.ifError { :err | true }

* * *

See also: [Procedure Syntax], [Procedure Semantics]

Unicode: U+03BB λ Greek Small Letter Lamda
