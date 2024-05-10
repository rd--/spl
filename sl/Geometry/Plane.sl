Plane : [Object] { | a b c d |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	distance { :self |
		self.hessianNormalForm.second
	}

	hessianNormalForm { :self |
		let [a, b, c, d] = self.terms;
		let z = ((a * a) + (b * b) + (c * c)).sqrt;
		let n = [a b c] / z;
		let p = d / z;
		[n, p]
	}

	includes { :self :aPoint |
		self.terms.pointPlaneDistance(aPoint).veryCloseTo(0)
	}

	intercepts { :self |
		let n = self.d.negated;
		[
			n / self.a,
			n / self.b,
			n / self.c
		]
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	terms { :self |
		[self.a, self.b, self.c, self.d]
	}

	unitNormalVector { :self |
		self.hessianNormalForm.first
	}

}

+@Number {

	Plane { :a :b :c :d |
		newPlane().initializeSlots(a, b, c, d)
	}

}

+@Sequence {

	asPlane { :self |
		(self.size = 4).if {
			let [a, b, c, d] = self;
			Plane(a, b, c, d)
		} {
			(self.size = 4).if {
				let [p1, p2, p3] = self;
				Plane(p1, p2, p2)
			} {
				self.error('@Sequence>>asPlane')
			}
		}
	}

	Plane { :p1 :p2 :p3 |
		let [x1, y1, z1] = p1;
		let [x2, y2, z2] = p2;
		let [x3, y3, z3] = p3;
		let a = (y1 * (z2 - z3)) + (y2 * (z3 - z1)) + (y3 * (z1 - z2));
		let b = (z1 * (x2 - x3)) + (z2 * (x3 - x1)) + (z3 * (x1 - x2));
		let c = (x1 * (y2 - y3)) + (x2 * (y3 - y1)) + (x3 * (y1 - y2));
		let d = ([a b c] * p1).sum.negated;
		[a b c].allSatisfy(isInteger:/1).ifTrue {
			let z = [a b c].gcd;
			[a, b, c, d] := [a b c d] / z
		};
		[a b c].allSatisfy(isNonPositive:/1).ifTrue {
			[a, b, c, d] := [a b c d].negated
		};
		Plane(a, b, c, d)
	}

	pointPlaneDistance { :plane :point |
		plane.signedPointPlaneDistance(point).abs
	}

	signedPointPlaneDistance { :plane :point |
		let [a, b, c, d] = plane;
		let [x, y, z] = point;
		((a * x) + (b * y) + (c * z) + d) / ((a * a) + (b * b) + (c * c)).sqrt
	}

}
