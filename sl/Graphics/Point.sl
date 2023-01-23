Point : [Object] { | x y |

	= {	:self :anObject |
		if(anObject.isPoint) {
			(self.x = anObject.x) & { self.y = anObject.y }
		} {
			false
		}
	}

	< { :self :aPoint |
		self.x < aPoint.x & { self.y < aPoint.y }
	}

	<= { :self :aPoint |
		self.x <= aPoint.x & { self.y <= aPoint.y }
	}

	+ { :self :anObject |
		if(anObject.isPoint) {
			Point(self.x + anObject.x, self.y + anObject.y)
		} {
			anObject.adaptToPointAndApply(self, plus:/2)
		}
	}

	- { :self :anObject |
		if(anObject.isPoint) {
			Point(self.x - anObject.x, self.y - anObject.y)
		} {
			anObject.adaptToPointAndApply(self, minus:/2)
		}
	}

	* { :self :anObject |
		if(anObject.isPoint) {
			Point(self.x * anObject.x, self.y * anObject.y)
		} {
			anObject.adaptToPointAndApply(self, times:/2)
		}
	}

	/ { :self :anObject |
		if(anObject.isPoint) {
			Point(self.x / anObject.x, self.y / anObject.y)
		} {
			anObject.adaptToPointAndApply(self, dividedBy:/2)
		}
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aProcedure(aNumber.asPoint, self)
	}

	asPoint { :self |
		self
	}

	length { :self |
		(self.x.squared + self.y.squared).sqrt
	}

	max { :self :aPoint |
		self.x.max(aPoint.x) @ self.y.max(aPoint.y)
	}

	min { :self :aPoint |
		self.x.min(aPoint.x) @ self.y.min(aPoint.y)
	}

	negate { :self |
		Point(self.x.negate, self.y.negate)
	}

	printString { :self |
		'Point(' ++ self.x.printString ++ ', ' ++ self.y.printString ++ ')'
	}

}

+ Number {

	adaptToPointAndApply { :self :aPoint :aProcedure:/2 |
		aProcedure(aPoint, self.asPoint)
	}

}

+ @Numeric {

	asPoint { :self |
		Point(self, self)
	}

	at { :self :aNumber |
		Point(self, aNumber)
	}

	Point { :self :aNumber |
		newPoint(self, aNumber)
	}

}
