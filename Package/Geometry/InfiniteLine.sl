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

	InfiniteLine { :self |
		let [p1, p2] = self;
		InfiniteLine(p1, (p2 - p1).normalize)
	}

	InfiniteLine { :aPoint :aVector |
		newInfiniteLine().initializeSlots(aPoint, aVector)
	}

}
