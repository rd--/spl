/* Requires: List, Object */

Association : [Object, Store, Copy, Equal, Compare] {

	| key value |

	compare { :self :anAssociation |
		self.key.compare(anAssociation.key)
	}

	depth { :self |
		1 + self.value.depth
	}

	equalBy { :self :anObject :aBlock/2 |
		anObject.isAssociation & {
			self.key = anObject.key & {
				aBlock(self.value, anObject.value)
			}
		}
	}

	keyAndValue { :self |
		[self.key, self.value]
	}

	printString { :self |
		'% -> %'.format(
			[
				self.key.printString,
				self.value.printString
			]
		)
	}

}

+@Object {

	[Association, ->] { :self :anObject |
		uncheckedAssociation(self, anObject)
	}

	[reverseAssociation, <-] { :self :anObject |
		Association(anObject, self)
	}

	uncheckedAssociation { :self :anObject |
		newAssociation().initializeSlots(self, anObject)
	}

}

+List {

	[Association, ->] { :self |
		self.atVectorOrElementwise { :x |
			(x.size = 2).if {
				Association(x.first, x.second)
			} {
				x.error('List>>Association: not two-element sequence')
			}
		}
	}

}

+@Collection {

	keyAndValue { :self |
		self.collect(keyAndValue/1)
	}

}
