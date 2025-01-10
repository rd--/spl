InfiniteLine : [Object] { | point vector |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	dimension { :self |
		1
	}

	embeddingDimension { :self |
		self.point.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

	InfiniteLine { :aPoint :aVector |
		newInfiniteLine().initializeSlots(aPoint, aVector)
	}

}

