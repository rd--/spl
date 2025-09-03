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

	associationsDo { :self :aBlock:/1 |
		self.assertIsAssociationList.do(aBlock:/1)
	}

	isAssociationList { :self |
		self.allSatisfy(isAssociation:/1)
	}

	keySelect { :self :aBlock:/1 |
		self.assertIsAssociationList.select { :each |
			aBlock(each.key)
		}
	}

	keyType { :self |
		self.keys.elementType
	}

	keys { :self |
		self.assertIsAssociationList.collect(key:/1)
	}

	keysAndValuesDo { :self :aBlock:/2 |
		self.assertIsAssociationList.do { :each |
			aBlock(each.key, each.value)
		}
	}

	keysDo { :self :aBlock:/1 |
		self.keys.do(aBlock:/1)
	}

	values { :self |
		self.assertIsAssociationList.collect(value:/1)
	}

	valuesDo { :self :aBlock:/1 |
		self.values.do(aBlock:/1)
	}

	valueType { :self |
		self.values.elementType
	}

}
