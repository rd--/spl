# Slot Access Syntax -- syntax

The _:@_ syntax directly reads the value of a slot at a type.

	('x' -> 1).slotNameArray = ['key', 'value']
	('x' -> 1):@key = 'x'

There is a mutation form of this syntax that allows writing a value into the slot.

	| a = ('x' -> 1); | a:@key = 'y'; a = ('y' -> 1)
