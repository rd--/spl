# Slot Access Syntax -- syntax

The _:@_ syntax directly reads the value of a slot at a type.

	('x' -> 1).slotNameArray = ['key', 'value']
	('x' -> 1):@key = 'x'

There is a mutation form of this syntax that allows writing a value into the slot.

	| a = ('x' -> 1); | a:@key := 'y'; a = ('y' -> 1)

Where supported the syntax :@ is written ⋄.

_Rationale:_
Defining a type defines methods to read and write slots.
In general the Spl libraries write all slot accesses as _message sends_,
including _self_ slot access.
If one wishes to rewrite the default slot access methods,
perhaps to implement a verification stage,
it is neccessary to be able to write the slot directly.
The direct form will also be quicker where efficieny is a primary concern.
In the case of methods defined directly at types,
this syntax would allow compilation to a slot index.
(Since the type of _self_ is known, the sequence of slot names can be looked up.)

* * *

Unicode: ⋄ U+22C4 Diamond Operator
