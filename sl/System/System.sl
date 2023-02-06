System : [Object] {

	methodTable { :self | <primitive: return _self.methodTable;> }
	nextUniqueId { :self :aNumber | <primitive: return _self.nextUniqueId = _aNumber;> }
	nextUniqueId { :self | <primitive: return _self.nextUniqueId;> }
	randomFloat { :self | <primitive: return Math.random();> }
	traitDictionary { :self | <primitive: return _self.traitDictionary;> }
	typeDictionary { :self | <primitive: return _self.typeDictionary;> }

}
