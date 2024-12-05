AssociationList : [Object, Iterable, Indexable, Collection, Extensible, Removable, Dictionary] { | contents |

	asList { :self |
		self.contents
	}

	associations { :self |
		self.contents
	}

	atIfPresentIfAbsent { :self :key :ifPresent:/1 :ifAbsent:/0 |
		self.contents.detectIndex { :each |
			each.key = key
		}.ifNil {
			ifAbsent()
		} { :index |
			ifPresent(self.contents[index].value)
		}
	}

	at { :self :key |
		self.contents.detectIfFoundIfNone { :each |
			each.key = key
		} { :each |
			each.value
		} {
			self.error('AssociationList>>at: unknown key: ' ++ key)
		}
	}

	atPut { :self :key :value |
		self.contents.detectIfFoundIfNone { :each |
			each.key = key
		} { :each |
			each.value := value
		} {
			self.contents.add(key -> value)
		}
	}

	includesKey { :self :key |
		self.contents.detectIndex { :each |
			each.key = key
		} ~= nil
	}

	indices { :self |
		self.keys
	}

	keys { :self |
		self.contents.collect(key:/1)
	}

	removeKeyIfAbsent { :self :key :aBlock:/0 |
		self.contents.detectIndex { :each |
			each.key = key
		}.ifNil {
			aBlock()
		} { :index |
			self.contents.removeAt(index)
		}
	}

	size { :self |
		self.contents.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	values { :self |
		self.contents.collect(value:/1)
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
