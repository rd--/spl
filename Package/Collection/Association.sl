Association : [Object] { | key value |

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
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

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isAssociation & {
			self.key = anObject.key & {
				aBlock(self.value, anObject.value)
			}
		}
	}

	first { :self |
		self.key
	}

	asAssociation { :self |
		self
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
		[
			self.key.printString,
			self.value.printString
		].join(' -> ')
	}

	second { :self |
		self.value
	}

	storeString { :self |
		'(% -> %)'.format(
			[
				self.key.storeString,
				self.value.storeString
			]
		)
	}

}

+@Object {

	-> { :self :anObject |
		Association(self, anObject)
	}

	<- { :self :anObject |
		Association(anObject, self)
	}

	Association { :self :anObject |
		newAssociation().initializeSlots(self, anObject)
	}

}

+List {

	asAssociation { :self |
		(self.size = 2).if {
			self.first -> self.second
		} {
			self.error('List>>asAssociation: not two-element sequence')
		}
	}

}
