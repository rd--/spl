TypedDictionary : [Object, Store, Equal, Iterable, Indexable, Collection, Extensible, Dictionary] { | contents keyType |

	[at, @] { :self :key |
		self.contents.at(self.typeCheckKey(key))
	}

	comparator { :self |
		self.contents.comparator
	}

	do { :self :aBlock/1 |
		self.contents.do(aBlock/1)
	}

	indices { :self |
		self.contents.indices
	}

	keys { :self |
		self.contents.keys
	}

	keysAndValuesDo { :self :aBlock/2 |
		self.contents.keysAndValuesDo(aBlock/2);
		self
	}

	put! { :self :key :value |
		self.contents.put!(self.typeCheckKey(key), value)
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

	typeCheckKey { :self :key |
		(key.typeOf = self.keyType).if {
			key
		} {
			self.error('invalid key', key)
		}
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
		answer.addAll!(self);
		answer
	}

	asTypedDictionary { :self |
		self.asTypedDictionary(self.keyType)
	}

}
