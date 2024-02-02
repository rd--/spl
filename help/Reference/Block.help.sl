# Block -- behaviour type

The behaviour type.
Blocks have fixed arity and must be applied to the correct number of arguments.

	{ true } . () = true
	{ { true } . (true) }.ifError { :err | true }
	{ :x | x * x } . (9) = 81
	{ { : x | x * x } . () }.ifError { :err | true }

* * *

See also: [Block Syntax], [Block Semantics]

Unicode: U+03BB λ Greek Small Letter Lamda
