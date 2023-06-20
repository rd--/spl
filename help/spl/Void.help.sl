# Void -- uninhabited type

_Void_ is the name of the uninhabited type.
It identifies the place in the method table where procedures of no arguments are located.

No argument procedures are notated as methods of _Void_.

	system.typeMethods('Void').collect(name:/1).includes('Set') = true
	system.onlyZeroArityMethodList.includes('PriorityQueue') = true
