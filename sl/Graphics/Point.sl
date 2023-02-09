Point : [Object, CartesianPoint] { | x y |

	= { :self :anObject |
		if(anObject.isPoint) {
			(self.x = anObject.x) & { self.y = anObject.y }
		} {
			false
		}
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
		newPoint().initialize(self, aNumber)
	}

}
