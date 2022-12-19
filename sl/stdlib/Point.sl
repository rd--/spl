Point { | x y |

	printString { :self | 'Point(' ++ self.x.printString ++ ', ' ++ self.y.printString ++ ')' }

	= {	:self :anObject |
		if(anObject.isPoint) { (self.x = anObject.x) & { self.y = anObject.y } } { false }
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

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		apply(aProcedure, [aNumber.asPoint, self])
	}

	negate { :self |
		Point(self.x.negate, self.y.negate)
	}

	asPoint { :self |
		self
	}

	length { :self |
		(self.x.squared + self.y.squared).sqrt
	}

}

+ Number {

	asPoint { :self |
		Point(self, self)
	}

	adaptToPointAndApply {
		:self :aPoint :aProcedure |
		apply(aProcedure, [aPoint, self.asPoint])
	}

}

+ @Numeric {

	at { :self :aNumber |
		Point(self, aNumber)
	}

}
