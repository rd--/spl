Missing : [Object, Store, Equal] {

	| reasonMissing value |

}

+String {

	Missing { :aString :anObject |
		newMissing().initializeSlots(aString, anObject)
	}

	Missing { :self |
		Missing(self, nil)
	}

}

+@FiniteCollection {

	deepDeleteMissing { :self |
		self.deleteMissing(Infinity)
	}

	deleteMissing { :self :n |
		(n = 1).if {
			self.reject(isMissing/1)
		} {
			self.collect { :each |
				each.isCollection.if {
					each.deleteMissing(n - 1)
				} {
					each
				}
			}.reject(isMissing/1)
		}
	}

	deleteMissing { :self |
		self.deleteMissing(1)
	}

}

+Nil {

	isMissing { :unused |
		true
	}

	reasonMissing { :unused |
		'Unknown'
	}

}

+SmallFloat {

	isMissing { :self |
		self.isNaN
	}

	reasonMissing { :unused |
		'NaN'
	}

}
