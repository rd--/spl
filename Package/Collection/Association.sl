/* Requires: List, Object */

Association : [Object, Storeable, Equatable, Comparable] { | key value |

	asAssociation { :self |
		self
	}

	compare { :self :anAssociation |
		self.key.compare(anAssociation.key)
	}

	depth { :self |
		1 + self.value.depth
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

	keyValue { :self |
		[self.key, self.value]
	}

	keyValue { :self :key :value |
		self.key := key;
		self.value := value;
		self
	}

	printString { :self |
		'% -> %'.format([
			self.key.printString,
			self.value.printString
		])
	}

	second { :self |
		self.value
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
