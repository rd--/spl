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
