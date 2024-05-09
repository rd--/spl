CartesianCoordinate : [Object, Magnitude, Indexable] { | x y z |

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
	}

	asCartesianCoordinate { :self |
		self
	}

	at { :self :index |
		index.caseOfOtherwise([
			1 -> { self.x },
			2 -> { self.y },
			3 -> { self.z }
		]) {
			self.error('CartesianCoordinate>>at: index out of range')
		}
	}

	atPut { :self :index :value |
		index.caseOfOtherwise([
			1 -> { self.x := value },
			2 -> { self.y := value },
			3 -> { self.z := value }
		]) {
			self.error('CartesianCoordinate>>atPut: index out of range')
		}
	}

	asList { :self |
		[self.x, self.y, self.z]
	}

	asRecord { :self |
		(x: self.x, y: self.y, z: self.z)
	}

	asTuple { :self |
		(self.x, self.y, self.z)
	}

	compareBy { :self :anObject :aBlock:/2 |
		aBlock(self.x, anObject.x) & {
			aBlock(self.y, anObject.y) & {
				aBlock(self.z, anObject.z)
			}
		}
	}

	cross { :u :v |
		CartesianCoordinate(
			(u.y * v.z) - (u.z * v.y),
			(u.z * v.x) - (u.x * v.z),
			(u.x * v.y) - (u.y * v.x)
		)
	}

	distance { :self :other |
		(
			(other.x - self.x).squared +
			(other.y - self.y).squared +
			(other.z - self.z).squared
		).sqrt
	}

	dotProduct { :self :anObject |
		(self.x * anObject.x) + (self.y * anObject.y) + (self.z * anObject.z)
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isCartesianCoordinate & {
			aBlock(self.x, anObject.x) & {
				aBlock(self.y, anObject.y) & {
					aBlock(self.z, anObject.z)
				}
			}
		}
	}

	first { :self |
		self.x
	}

	isCartesianCoordinate { :self |
		true
	}

	isZero { :self |
		self.x.isZero & {
			self.y.isZero & {
				self.z.isZero
			}
		}
	}

	second { :self |
		self.y
	}

	size { :self |
		3
	}

	storeString { :self |
		[
			'CartesianCoordinate(',
				self.x.storeString,
				', ',
				self.y.storeString,
				', ',
				self.z.storeString,
			')'
		].join
	}

	third { :self |
		self.z
	}

	xy { :self |
		RectangularCoordinate(self.x, self.y)
	}

	xz { :self |
		RectangularCoordinate(self.x, self.z)
	}

	yz { :self |
		RectangularCoordinate(self.y, self.z)
	}

}

+@Number {

	CartesianCoordinate { :x :y :z |
		newCartesianCoordinate().initializeSlots(x, y, z)
	}

}

+@Sequence {

	asCartesianCoordinate { :self |
		let [x, y, z] = self;
		CartesianCoordinate(x, y, z)
	}

	hessianNormalForm { :plane |
		let [a, b, c, d] = plane;
		let z = ((a * a) + (b * b) + (c * c)).sqrt;
		let n = [a b c] / z;
		let p = d / z;
		[n, p]
	}

	pointLineDistance { :line :point |
		let [x1, x2] = line;
		let x0 = point;
		(x0 - x1).cross(x0 - x2).norm / (x2 - x1).norm
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

+Record {

	asCartesianCoordinate { :self |
		CartesianCoordinate(self::x, self::y, self::z)
	}

}
