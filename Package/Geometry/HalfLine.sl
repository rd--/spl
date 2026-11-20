HalfLine : [Object, Equal] {

	| point vector | <List>

	dimension { :self |
		1
	}

	embeddingDimension { :self |
		self.point.size
	}

}

+List {

	HalfLine { :aPoint :aVector |
		uncheckedHalfLine(aPoint, aVector)
	}

}
