Missing : [Object] { | reason value |

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

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

}

+[Missing, Nil] {

	isMissingOrNil { :unused |
		true
	}

}

+@Object {

	isMissingOrNil { :unused |
		false
	}

}
