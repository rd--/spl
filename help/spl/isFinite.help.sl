# isFinite -- arithmetic

- _isFinite(aNumber)

Answer true if _aNumber_ is not infinite.

	pi.isFinite = true
	inf.isFinite = false
	{ nil.isFinite }.ifError { :err | true }
