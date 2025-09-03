+List {

	assertIsAssociationList { :self |
		self.isAssociationList.if {
			self
		} {
			self.error('not AssociationList')
		}
	}

	isAssociationList { :self |
		self.allSatisfy(isAssociation:/1)
	}

	keyType { :self |
		self.keys.elementType
	}

	keys { :self |
		self.assertIsAssociationList.collect(key:/1)
	}

	values { :self |
		self.assertIsAssociationList.collect(value:/1)
	}

	valueType { :self |
		self.values.elementType
	}

}
