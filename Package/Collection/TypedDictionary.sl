TypedDictionary : [Object, Store, Equal, Iterable, Indexable, Collection, Extensible, Dictionary] { | untypedDictionary keyType |

	[at, @] { :self :key |
		self.untypedDictionary.at(self.typeCheckKey(key))
	}

	comparator { :self |
		self.untypedDictionary.comparator
	}

	do { :self :aBlock/1 |
		self.untypedDictionary.do(aBlock/1)
	}

	indices { :self |
		self.untypedDictionary.indices
	}

	keys { :self |
		self.untypedDictionary.keys
	}

	keysAndValuesDo { :self :aBlock/2 |
		self.untypedDictionary.keysAndValuesDo(aBlock/2);
		self
	}

	put! { :self :key :value |
		self.untypedDictionary.put!(self.typeCheckKey(key), value)
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
		(key.typeOf = self.keyType).if {
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

	TypedDictionary { :self |
		let dictionary = [
			{ self = 'String' } -> { Record() },
			{ self.isImmediateType } -> { Map() },
			{ true } -> { Dictionary() }
		].which;
		newTypedDictionary().initializeSlots(dictionary, self)
	}

}

+List {

	TypedDictionary { :self :typeName |
		let answer = TypedDictionary(typeName);
		answer.addAll!(self);
		answer
	}

	TypedDictionary { :self |
		TypedDictionary(self, self.keyType)
	}

}
