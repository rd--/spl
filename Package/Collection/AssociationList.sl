/* Requires: List */

+List {

	assertIsAssociationList { :self |
		self.isAssociationList.if {
			self
		} {
			self.error('not AssociationList')
		}
	}

	associations { :self |
		self.assertIsAssociationList
	}

	associationsDo { :self :aFunction/1 |
		self.assertIsAssociationList.do(aFunction/1)
	}

	includesKey { :self :key |
		self.assertIsAssociationList.keys.includes(key)
	}

	isAssociationList { :self |
		self.allSatisfy(isAssociation/1)
	}

	keySelect { :self :aFunction/1 |
		self.assertIsAssociationList.select { :each |
			aFunction(each.key)
		}
	}

	keyType { :self |
		self.keys.elementType
	}

	keys { :self |
		self
		.assertIsAssociationList
		.collect(key/1)
	}

	keysAndValues { :self |
		self
		.assertIsAssociationList
		.collect(keyAndValue/1)
	}

	keysAndValuesDo { :self :aFunction/2 |
		self
		.assertIsAssociationList
		.do { :each |
			aFunction(each.key, each.value)
		}
	}

	keysDo { :self :aFunction/1 |
		self.keys.do(aFunction/1)
	}

	valueType { :self |
		self.values.elementType
	}

	values { :self |
		self.assertIsAssociationList.collect(value/1)
	}

	valuesDo { :self :aFunction/1 |
		self.values.do(aFunction/1)
	}

}
