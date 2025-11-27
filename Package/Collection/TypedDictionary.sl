TypedDictionary : [Object, Storeable, Equatable, Iterable, Indexable, Collection, Extensible, Removable, Dictionary] { | contents keyType |

	[at, @] { :self :key |
		self.contents.at(self.typeCheckKey(key))
	}

	atPut { :self :key :value |
		self.contents.atPut(self.typeCheckKey(key), value)
	}

	comparator { :self |
		self.contents.comparator
	}

	indices { :self |
		self.contents.indices
	}

	keys { :self |
		self.contents.keys
	}

	keysAndValuesDo { :self :aBlock:/2 |
		self.contents.keysAndValuesDo(aBlock:/2)
	}

	typeCheckKey { :self :key |
		(key.typeOf = self.keyType).if {
			key
		} {
			self.error('invalid key', key)
		}
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1)
	}

	size { :self |
		self.contents.size
	}

	storeString { :self |
		'%.asTypedDictionary(%)'.format(
			[
				self.contents.associations,
				self.keyType.storeString
			]
		)
	}

	values { :self |
		self.contents.values
	}

}

+String {

	TypedDictionary { :self |
		let contents = [
			{ self = 'String' } -> { Record() },
			{ self.isImmediateType } -> { Map() },
			{ true } -> { Dictionary() }
		].which;
		newTypedDictionary().initializeSlots(contents, self)
	}

}

+List {

	asTypedDictionary { :self :typeName |
		let answer = TypedDictionary(typeName);
		answer.addAll(self);
		answer
	}

	asTypedDictionary { :self |
		self.asTypedDictionary(self.keyType)
	}

}
