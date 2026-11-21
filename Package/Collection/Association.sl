/* Requires: List */

Association : [Object, Store, Copy, Equal, Compare] {

	| key value | <@Object>

	compare { :self :anAssociation |
		compareOn(self, anAssociation, key/1)
	}

	depth { :self |
		1 + self.value.depth
	}

	isEqualBy { :self :anObject :aFunction/2 |
		anObject.isAssociation & {
			self.key = anObject.key & {
				aFunction(self.value, anObject.value)
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

}

+List {

	[Association, ->] { :self |
		self.atVectorOrElementwise { :each |
			let [key, value] = each;
			Association(key, value)
		}
	}

}

+@Collection {

	keyAndValue { :self |
		self.collect(keyAndValue/1)
	}

}
