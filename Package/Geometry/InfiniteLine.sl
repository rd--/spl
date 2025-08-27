InfiniteLine : [Object] { | point vector |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	asGeneralisedCircle { :self |
		let a = self.point;
		let b = a + self.vector;
		let [z1, z2] = [a.asComplex, b.asComplex];
		let c = 0;
		let alpha = 0J1 * (z2 - z1);
		let d = -2 * (alpha * z1).real;
		GeneralisedCircle(c, alpha, d)
	}

	dimension { :self |
		1
	}

	embeddingDimension { :self |
		self.point.size
	}

	polynomial { :self |
		let [x, y] = self.point;
		let [i, j] = self.vector;
		let m = j / i;
		let c = y - (m * x);
		UnivariatePolynomial([c, m])
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
