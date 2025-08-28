InfiniteLine : [Object] { | point vector |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	asGeneralisedCircle { :self |
		let [a, b, c] = self.lineEquation;
		GeneralisedCircle(0, Complex(a, -1 * b), 2 * c)
	}

	dimension { :self |
		1
	}

	embeddingDimension { :self |
		self.point.size
	}

	implicitEquation { :self |
		let [a, b, c] = self.lineEquation;
		{ :x :y |
			(a * x) + (b * y) + c
		}
	}

	lineEquation { :self |
		let [p, q] = self.vertexCoordinates;
		lineEquation(p, q)
	}

	polynomial { :self |
		let [x, y] = self.point;
		let [i, j] = self.vector;
		let m = j / i;
		let c = y - (m * x);
		UnivariatePolynomial([c, m])
	}

	slope { :self |
		let [x, y] = self.vector;
		y / x
	}

	slopeInterceptForm { :self |
		let [x, y] = self.point;
		let [i, j] = self.vector;
		let m = j / i;
		let c = y - (m * x);
		[m, c]
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	theta { :self |
		let [_, theta] = self.vector.toPolarCoordinates;
		theta
	}

	vertexCoordinates { :self |
		let p = self.point;
		let q = p + self.vector;
		[p, q]
	}

}

+List {

	InfiniteLine { :self |
		let [p1, p2] = self;
		InfiniteLine(p1, p2 - p1)
	}

	InfiniteLine { :aPoint :aVector |
		newInfiniteLine().initializeSlots(aPoint, aVector)
	}

}

+SmallFloat{

	InfiniteLine { :a :b :c |
		(a = 0).if {
			(b = 0).if {
				[a b c].error('a=b=0')
			} {
				let y = c.- / b;
				InfiniteLine([0 y; 1 y])
			}
		} {
			(b = 0).if {
				let x = c.- / a;
				InfiniteLine([x 0; x 1])
			} {
				let y1 = c.- / b;
				let y2 = (c.- - a) / b;
				InfiniteLine([0 y1; 1 y2])
			}
		}
	}

}
