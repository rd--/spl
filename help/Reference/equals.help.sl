# equals -- comparing

- _anObject = anotherObject_

This is the _structural equality_ operator, it answers _true_ if _anObject_ is equal to _anotherObject_, else _false_.
The meaning of equality is determined by the type of _anObject_.

	3 = 1 = false
	2 = 2 = true
	[3 2 1] = [1 2 3] = false
	[4 5] = [4 5] = true
	[3 2 1] =.each [1 2 3] = [false true false]
	'321' =.each '123' = [false true false]
	[3j2 2j2 1j2] =.w [2j2] = [false true false]

The _=_ method is not implemented at _Object_.

The name of this operator is _equals_.

The _=_ symbol is also a part of [Initialised Temporaries Syntax] and [Variable Keyword Syntax].

* * *

See also: ~=, ==, equalSlots, equalsEquals

References:
_Apl_
[1](https://aplwiki.com/wiki/Equal_to)
