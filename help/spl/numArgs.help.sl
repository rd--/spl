# numArgs -- accessing

- _numArgs(aProcedure)_

Answer the number of arguments that must be used to evaluate this procedure.

	{ }.numArgs = 0
	{ :x | x }.numArgs = 1
	collect:/2.numArgs = 2

_numArgs_ is used to implement _cull_.

* * *

See also: _cull_
