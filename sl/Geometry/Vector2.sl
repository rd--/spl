Vector2 : [Object, Indexable, Number, Point] { | x y |

	= { :self :anObject |
		anObject.isPoint.if {
			(self.x = anObject.x) & {
				self.y = anObject.y
			}
		} {
			false
		}
	}

	+ { :self :anObject |
		anObject.isPoint.if {
			Point(self.x + anObject.x, self.y + anObject.y)
		} {
			anObject.adaptToPointAndApply(self, plus:/2)
		}
	}

	- { :self :anObject |
		anObject.isPoint.if {
			Point(self.x - anObject.x, self.y - anObject.y)
		} {
			anObject.adaptToPointAndApply(self, minus:/2)
		}
	}

	* { :self :anObject |
		anObject.isPoint.if {
			Point(self.x * anObject.x, self.y * anObject.y)
		} {
			anObject.adaptToPointAndApply(self, times:/2)
		}
	}

	/ { :self :anObject |
		anObject.isPoint.if {
			Point(self.x / anObject.x, self.y / anObject.y)
		} {
			anObject.adaptToPointAndApply(self, dividedBy:/2)
		}
	}

	// { :self :anObject |
		anObject.isPoint.if {
			Point(self.x // anObject.x, self.y // anObject.y)
		} {
			anObject.adaptToPointAndApply(self, dividedByDividedBy:/2)
		}
	}

	% { :self :anObject |
		anObject.isPoint.if {
			Point(self.x % anObject.x, self.y % anObject.y)
		} {
			anObject.adaptToPointAndApply(self, modulo:/2)
		}
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aBlock(aNumber @ aNumber, self)
	}

	asArray { :self |
		[self.x, self.y]
	}

	asPoint { :self |
		self
	}

	collect { :self :aBlock:/1 |
		Point(self.x.aBlock, self.y.aBlock)
	}

	first { :self |
		self.x
	}

	negate { :self |
		self.collect(negate:/1)
	}

	printString { :self |
		[self.x, '@', self.y].join
	}

	r { :self |
		(* r = radius = rho *)
		(self.x.squared + self.y.squared).sqrt
	}

	second { :self |
		self.y
	}

	storeString { :self |
		[
			'Point(',
			self.x.storeString,
			', ',
			self.y.storeString,
			')'
		].join
	}

	swapInPlace { :self |
		| x = self.x, y = self.y; |
		self.x := y;
		self.y := x
	}

	swapped { :self |
		Vector2(self.y, self.x)
	}

	t { :self |
		(* t = theta *)
		atan2(self.y, self.x)
	}

}

+Array {

	asVector2 { :self |
		(self.size ~= 2).if {
			self.error('Vector2: not 2-element array')
		} {
			| [x, y] = self; |
			Vector2(x, y)
		}
	}

}

+@Number {

	@ { :self :y |
		Vector2(self, y)
	}

	adaptToPointAndApply { :self :aPoint :aBlock:/2 |
		aBlock(aPoint, self.asPoint)
	}

	asPoint { :self |
		Point(self, self)
	}

	Point { :x :y |
		Vector2(x, y)
	}

	Vector2 { :x :y |
		newVector2().initializeSlots(x, y)
	}

}
