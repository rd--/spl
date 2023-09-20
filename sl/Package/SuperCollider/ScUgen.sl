ScUgen! : [Object] {

	id { :self | <primitive: return _self.id> }
	inputArray { :self | <primitive: return _self.inputArray> }
	localControl { :self | <primitive: return _self.localControl> }
	mrg { :self | <primitive: return _self.mrg> }
	name { :self | <primitive: return _self.name> }
	numChan { :self | <primitive: return _self.numChan> }
	rate { :self | <primitive: return _self.rate> }
	specialIndex { :self | <primitive: return _self.specialIndex> }

	printString { :self |
		[
			self.name,
			'(',
			self.inputArray.collect(printString:/1).joinSeparatedBy(', ')
			,')'
		].join
	}

	pseudoSlotNameArray { :self |
		['name', 'numChan', 'rate', 'specialIndex', 'id', 'inputArray', 'mrg', 'localControl']
	}

}
