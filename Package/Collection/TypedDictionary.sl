TypedDictionary : [Object, Store, Equal, Do, At, Indices, Put, Collection, Dictionary] {

	| keyType untypedDictionary |

	atIfAbsent { :self :key :aBlock/0 |
		self.untypedDictionary.atIfAbsent(
			self.typeCheckKey(key),
			aBlock/0
		)
	}

	collect { :self :aBlock/1 |
		self.untypedDictionary.collect(aBlock/1)
	}

	comparator { :self |
		self.untypedDictionary.comparator
	}

	do { :self :aBlock/1 |
		self.untypedDictionary.do(aBlock/1)
	}

	[indices, keys] { :self |
		self.untypedDictionary.indices
	}

	keysAndValuesDo { :self :aBlock/2 |
		self.untypedDictionary.keysAndValuesDo(aBlock/2)
	}

	put! { :self :key :value |
		self.untypedDictionary.put!(
			self.typeCheckKey(key),
			value
		)
	}

	size { :self |
		self.untypedDictionary.size
	}

	storeString { :self |
		'TypedDictionary(%, %)'.format(
			[
				self.untypedDictionary.associations,
				self.keyType.storeString
			]
		)
	}

	typeCheckKey { :self :key |
		(key.typeName = self.keyType).if {
			key
		} {
			self.error('invalid key', key)
		}
	}

	values { :self |
		self.untypedDictionary.values
	}

}

+String {

	uncheckedTypedDictionary { :self :aDictionary |
		newTypedDictionary().initializeSlots(self, aDictionary)
	}

}

+List {

	TypedDictionary { :self :typeName |
		let dictionary = [
			{ typeName = 'String' } -> { Record() },
			{ typeName.isImmediateTypeName } -> { Map() },
			{ true } -> { Dictionary() }
		].which;
		let answer = uncheckedTypedDictionary(typeName, dictionary);
		answer.addAll!(self);
		answer
	}

	TypedDictionary { :self |
		TypedDictionary(self, self.keyType)
	}

}
