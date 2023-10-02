ScUgen! : [Object] {

	id { :self |
		<primitive: return _self.id>
	}

	inputArray { :self |
		<primitive: return _self.inputArray>
	}

	localControl { :self |
		<primitive: return _self.localControl>
	}

	multipleRootGraph { :self |
		<primitive: return _self.multipleRootGraph>
	}

	name { :self |
		<primitive: return _self.name>
	}

	numChannels { :self |
		<primitive: return _self.numChannels>
	}

	printString { :self |
		[
			self.name,
			'(',
			self.inputArray.collect(printString:/1).joinSeparatedBy(', ')
			,')'
		].join
	}

	pseudoSlotNameArray { :self |
		['name', 'numChannels', 'rate', 'specialIndex', 'id', 'inputArray', 'multipleRootGraph', 'localControl']
	}

	rate { :self |
		<primitive: return _self.rate>
	}

	specialIndex { :self |
		<primitive: return _self.specialIndex>
	}

}
