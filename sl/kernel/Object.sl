Object {

	typeOf { :self | <primitive: return sl.typeOf(_self)> }
	species { :self | self.class }
	printString { :self | self.typeOf }
	asString { :self | self.printString }

	== { :self :anObject | <primitive: return _self === _anObject;> }
	~~ { :self :anObject | <primitive: return _self !== _anObject;> }

	~= { :self :anObject | not(self = anObject) }

	throw { :self | <primitive: throw _self;> }
	return { :self | <primitive: throw _self;> }

	identity { :self | self }
	value { :self | self }

}

+ Procedure {

	new { :self | self() }
	new { :self :aNumber | self(aNumber) }
	newFrom { :self :anObject | self(anObject) }

}
