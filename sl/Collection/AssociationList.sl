AssociationList : [Object, Iterable, Collection, Extensible, Removable, Indexable, Dictionary] { | associationList |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	asList { :self |
		self.associationList
	}

	associations { :self |
		self.associationList
	}

	atIfPresentIfAbsent { :self :key :ifPresent:/1 :ifAbsent:/0 |
		self.associationList.detectIndex { :each |
			each.key = key
		}.ifNil {
			ifAbsent()
		} { :index |
			ifPresent(self.associationList[index].value)
		}
	}

	at { :self :key |
		self.associationList.detectIfFoundIfNone { :each |
			each.key = key
		} { :each |
			each.value
		} {
			self.error('AssociationList>>at: unknown key: ' ++ key)
		}
	}

	atPut { :self :key :value |
		self.associationList.detectIfFoundIfNone { :each |
			each.key = key
		} { :each |
			each.value := value
		} {
			self.associationList.add(key -> value)
		}
	}

	includesIndex { :self :key |
		self.associationList.detectIndex { :each |
			each.key = key
		} ~= nil
	}

	indices { :self |
		self.associationList.collect(key:/1)
	}

	removeKeyIfAbsent { :self :key :aBlock:/0 |
		self.associationList.detectIndex { :each |
			each.key = key
		}.ifNil {
			aBlock()
		} { :index |
			self.associationList.removeAt(index)
		}
	}

	size { :self |
		self.associationList.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	values { :self |
		self.associationList.collect(value:/1)
	}

}

+Void {

	AssociationList {
		newAssociationList().initializeSlots(List())
	}

}

+List {

	asAssociationList { :self |
		self.allSatisfy(isAssociation:/1).if {
			newAssociationList().initializeSlots(self)
		} {
			self.error('List>>asAssociationList: not list of associations')
		}
	}

}
