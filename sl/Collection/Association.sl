Association : [Object] { | key value |

	= { :self :anObject |
		anObject.isAssociation & {
			self.key = anObject.key & {
				self.value = anObject.value
			}
		}
	}

	< { :self :anAssociation |
		self.key < anAssociation.key
	}

	<= { :self :anAssociation |
		self.key <= anAssociation.key
	}

	> { :self :anAssociation |
		self.key > anAssociation.key
	}

	>= { :self :anAssociation |
		self.key >= anAssociation.key
	}

	first { :self |
		self.key
	}

	asList { :self |
		[self.key, self.value]
	}

	keyValue { :self :key :value |
		self.key := key;
		self.value := value;
		self
	}

	printString { :self |
		[self.key, ' -> ', self.value].join
	}

	second { :self |
		self.value
	}

	storeString { :self |
		[
			'Association(',
				self.key.storeString,
				', ',
				self.value.storeString,
			')'
		].join
	}

}

+@Object {

	-> { :self :anObject |
		Association(self, anObject)
	}

	Association { :self :anObject |
		newAssociation().initializeSlots(self, anObject)
	}

}
