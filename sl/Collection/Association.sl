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

	asAssociation { :self |
		self
	}

	asList { :self |
		[self.key, self.value]
	}

	asTuple { :self |
		(self.key, self.value)
	}

	keyValue { :self :key :value |
		self.key := key;
		self.value := value;
		self
	}

	printString { :self |
		[self.key, ' -> ', self.value].stringJoin
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
		].stringJoin
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

+@Sequence {

	asAssociation { :self |
		(self.size = 2).if {
			self.first -> self.second
		} {
			self.error('@Sequence>>asAssociation: not two-element sequence')
		}
	}

}
