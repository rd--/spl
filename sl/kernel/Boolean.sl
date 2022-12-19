Boolean {

	= { :self :anObject | <primitive: return _self === _anObject;> }
	& { :self :anObject | <primitive: return _self && _value_1(_anObject);> }
	| { :self :anObject | <primitive: return _self || _value_1(_anObject);> }
	if { :self :whenTrue :whenFalse | <primitive: return _self ? _value_1(_whenTrue) : _value_1(_whenFalse);> }
	not { :self | <primitive: return _self ? false : true;> }

	asBit { :self | if(self) { 1 } { 0 } }
	asInteger { :self | if(self) { 1 } { 0 } }
	asFloat { :self | if(self) { 1 } { 0 } }
	printString { :self | if(self) { 'true' } { 'false' } }
	ifFalse { :self :whenFalse | if(self, { nil }, whenFalse) }
	ifTrue { :self :whenTrue | if(self, whenTrue, { nil }) }

}

+ Void {
	Boolean { 'Boolean(): there are no more booleans'.error }
}
