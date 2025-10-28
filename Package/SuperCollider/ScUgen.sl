ScUgen! : [Object] {

	displayName { :self |
		<primitive: return _self.displayName();>
	}

	id { :self |
		<primitive: return _self.id>
	}

	inputList { :self |
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

	numberOfChannels { :self |
		<primitive: return _self.numChannels>
	}

	printString { :self |
		'%(%)'.format(
			[
				self.name,
				self.inputList.collect(printString:/1).commaSeparated
			]
		)
	}

	pseudoSlotNameList { :self |
		['name', 'numberOfChannels', 'rate', 'specialIndex', 'id', 'inputList', 'multipleRootGraph', 'localControl']
	}

	rate { :self |
		<primitive: return _self.rate>
	}

	specialIndex { :self |
		<primitive: return _self.specialIndex>
	}

}
