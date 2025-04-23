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

	keys { :self |
		self.assertIsAssociationList;
		self.collect(key:/1)
	}

	values { :self |
		self.assertIsAssociationList;
		self.collect(value:/1)
	}

}
