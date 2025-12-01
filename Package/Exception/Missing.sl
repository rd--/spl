Missing : [Object, Storeable, Equatable] { | reasonMissing value |

}

+String {

	Missing { :aString :anObject |
		newMissing().initializeSlots(aString, anObject)
	}

	Missing { :self |
		Missing(self, nil)
	}

}

+@Collection {

	deleteMissing { :self |
		self.reject(isMissing:/1)
	}

	deleteMissing { :self :n |
		(n = 1).if {
			self.deleteMissing
		} {
			self.collect { :each |
				each.deleteMissing(n - 1)
			}
		}
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
