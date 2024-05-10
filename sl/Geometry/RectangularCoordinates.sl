RectangularCoordinates : [Object, Magnitude, Indexable] { | x y |

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
	}

	< { :self :anObject |
		self.compareBy(anObject, <)
	}

	<= { :self :anObject |
		self.compareBy(anObject, <=)
	}

	+ { :self :anObject |
		self.applyBinaryOperator(anObject, +)
	}

	- { :self :anObject |
		self.applyBinaryOperator(anObject, -)
	}

	* { :self :anObject |
		self.applyBinaryOperator(anObject, *)
	}

	/ { :self :anObject |
		self.applyBinaryOperator(anObject, /)
	}

	// { :self :anObject |
		self.applyBinaryOperator(anObject, //)
	}

	% { :self :anObject |
		self.applyBinaryOperator(anObject, %)
	}

	abs { :self |
		RectangularCoordinates(self.x.abs, self.y.abs)
	}

	abscissa { :self |
		self.x
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aBlock(RectangularCoordinates(aNumber, aNumber), self)
	}

	applyUnaryOperator { :self :aBlock:/1 |
		RectangularCoordinates(self.x.aBlock, self.y.aBlock)
	}

	applyBinaryOperator { :self :anObject :aBlock:/2 |
		anObject.isRectangularCoordinates.if {
			RectangularCoordinates(aBlock(self.x, anObject.x), aBlock(self.y, anObject.y))
		} {
			anObject.adaptToRectangularCoordinatesAndApply(self, aBlock:/2)
		}
	}

	asList { :self |
		[self.x, self.y]
	}

	asPolarCoordinates { :self |
		PolarCoordinates(self.r, self.theta)
	}

	asRecord { :self |
		(x: self.x, y: self.y)
	}

	asRectangularCoordinates { :self |
		self
	}

	asTuple { :self |
		(self.x, self.y)
	}

	at { :self :index |
		index.caseOfOtherwise([
			1 -> { self.x },
			2 -> { self.y }
		]) {
			self.error('RectangularCoordinate>>at: index out of range')
		}
	}

	atPut { :self :index :value |
		index.caseOfOtherwise([
			1 -> { self.x := value },
			2 -> { self.y := value }
		]) {
			self.error('RectangularCoordinate>>atPut: index out of range')
		}
	}

	closeTo { :self :anObject |
		self.compareBy(anObject, closeTo:/2)
	}

	compareBy { :self :anObject :aBlock:/2 |
		aBlock(self.x, anObject.x) & {
			aBlock(self.y, anObject.y)
		}
	}

	dimension { :self |
		0
	}

	distance { :self :anObject |
		let dx = anObject.x - self.x;
		let dy = anObject.y - self.y;
		((dx * dx) + (dy * dy)).sqrt
	}

	dotProduct { :self :anObject |
		(self.x * anObject.x) + (self.y * anObject.y)
	}

	embeddingDimension { :self |
		2
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isRectangularCoordinates & {
			aBlock(self.x, anObject.x) & {
				aBlock(self.y, anObject.y)
			}
		}
	}

	first { :self |
		self.x
	}

	inverse { :self :inversionCenter :inversionRadius |
		let x = self.x;
		let y = self.y;
		let x0 = inversionCenter.x;
		let y0 = inversionCenter.y;
		let k = inversionRadius;
		RectangularCoordinates(
			x0 + ((k.squared * (x - x0)) / ((x - x0).squared + (y - y0).squared)),
			y0 + ((k.squared * (y - y0)) / ((x - x0).squared + (y - y0).squared))
		)
	}

	isRectangularCoordinates { :self |
		true
	}

	isZero { :self |
		self.x.isZero & {
			self.y.isZero
		}
	}

	max { :self :anObject |
		self.applyBinaryOperator(anObject, max:/2)
	}

	min { :self :anObject |
		self.applyBinaryOperator(anObject, min:/2)
	}

	negate { :self |
		self.x := self.x.negated;
		self.y := self.x.negated
	}

	negated { :self |
		self.applyUnaryOperator(negated:/1)
	}

	norm { :self |
		(self.x.squared + self.y.squared).sqrt
	}

	normalized { :self |
		self / self.norm
	}

	ordinate { :self |
		self.y
	}

	phi { :self |
		atan2(self.y, self.x)
	}

	r { :self |
		(self.x.squared + self.y.squared).sqrt
	}

	radius { :self |
		self.r
	}

	rho { :self |
		self.r
	}

	second { :self |
		self.y
	}

	size { :self |
		2
	}

	storeString { :self |
		[
			'RectangularCoordinates(',
				self.x.storeString,
				', ',
				self.y.storeString,
			')'
		].join
	}

	swapInPlace { :self |
		let x = self.x;
		let y = self.y;
		self.x := y;
		self.y := x
	}

	swapped { :self |
		RectangularCoordinates(self.y, self.x)
	}

	theta { :self |
		atan2(self.y, self.x)
	}

	translateBy { :self :delta |
		self + delta
	}

}

+@Number {

	adaptToRectangularCoordinatesAndApply { :self :aRectangularCoordinates :aBlock:/2 |
		aBlock(aRectangularCoordinates, RectangularCoordinates(self, self))
	}

	RectangularCoordinates { :x :y |
		newRectangularCoordinates().initializeSlots(x, y)
	}

}

+[List, Tuple] {

	asRectangularCoordinates { :self |
		let [x, y] = self;
		RectangularCoordinates(x, y)
	}

}

+Record {

	asRectangularCoordinates { :self |
		RectangularCoordinates(self::x, self::y)
	}

}

+@Sequence {

	anglePath { :angles :distances :origin |
		let answer = [origin];
		let theta = 0;
		let p = origin;
		angles.withIndexDo { :each :index |
			let r = distances.atWrap(index);
			theta := (theta + each) % 2.pi;
			p := p + (theta.angleVector * r);
			answer.add(p)
		};
		answer
	}

	anglePath { :self |
		self.anglePath([1], [0 0])
	}

	lineEquation { :p1 :p2 |
		let [x1, y1] = p1;
		let [x2, y2] = p2;
		let a = y2 - y1;
		let b = x1 - x2;
		let c = (y1 * (x2 - x1)) - (x1 * (y2 - y1));
		[a, b, c]
	}

	lineLineIntersection { :l1 :l2 |
		let [p1, p2] = l1;
		let [p3, p4] = l2;
		let [x1, y1] = p1;
		let [x2, y2] = p2;
		let [x3, y3] = p3;
		let [x4, y4] = p4;
		let a1 = y2 - y1;
		let b1 = x1 - x2;
		let c1 = (a1 * x1) + (b1 * y1);
		let a2 = y4 - y3;
		let b2 = x3 - x4;
		let c2 = (a2 * x3) + (b2 * y3);
		let delta = (a1 * b2) - (a2 * b1);
		[
			((b2 * c1) - (b1 * c2)) / delta,
			((a1 * c2) - (a2 * c1)) / delta
		]
	}

	planarAngle { :self |
		let [q1, p, q2] = self;
		let [x1, y1] = q1;
		let [x0, y0] = p;
		let [x2, y2] = q2;
		let n = ((x1 - x0) * (x2 - x0)) + ((y1 - y0) * (y2 - y0));
		let d = ((x1 - x0).squared + (y1 - y0).squared).sqrt * ((x2 - x0).squared + (y2 - y0).squared).sqrt;
		(n / d).arcCos
	}

	pointLineDistance { :line :point |
		let [x1, x2] = line;
		let x0 = point;
		(x0 - x1).cross(x0 - x2).norm / (x2 - x1).norm
	}

}

+@Integer {

	circlePoints { :n :r :theta |
		let m = 2.pi / n;
		0.to(n - 1).collect { :i |
			[r, theta + (i * m)].fromPolarCoordinates
		}
	}

	circlePoints { :n :r |
		let theta = (pi / n) - (pi / 2);
		n.circlePoints(r, theta)
	}

}
