HalfLine : [Object, Equatable] { | point vector |

	dimension { :self |
		1
	}

	embeddingDimension { :self |
		self.point.size
	}

}

+List {

	HalfLine { :aPoint :aVector |
		newHalfLine().initializeSlots(aPoint, aVector)
	}

}
