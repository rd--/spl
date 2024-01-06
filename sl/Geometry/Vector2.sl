Vector2 : [Object, Indexable, Number, Point] { | x y |

	= { :self :anObject |
		anObject.isPoint & {
			self.x = anObject.x & {
				self.y = anObject.y
			}
		}
	}

	+ { :self :anObject |
		anObject.isPoint.if {
			Vector2(self.x + anObject.x, self.y + anObject.y)
		} {
			anObject.adaptToPointAndApply(self, plus:/2)
		}
	}

	- { :self :anObject |
		anObject.isPoint.if {
			Vector2(self.x - anObject.x, self.y - anObject.y)
		} {
			anObject.adaptToPointAndApply(self, minus:/2)
		}
	}

	* { :self :anObject |
		anObject.isPoint.if {
			Vector2(self.x * anObject.x, self.y * anObject.y)
		} {
			anObject.adaptToPointAndApply(self, times:/2)
		}
	}

	/ { :self :anObject |
		anObject.isPoint.if {
			Vector2(self.x / anObject.x, self.y / anObject.y)
		} {
			anObject.adaptToPointAndApply(self, dividedBy:/2)
		}
	}

	// { :self :anObject |
		anObject.isPoint.if {
			Vector2(self.x // anObject.x, self.y // anObject.y)
		} {
			anObject.adaptToPointAndApply(self, dividedByDividedBy:/2)
		}
	}

	% { :self :anObject |
		anObject.isPoint.if {
			Vector2(self.x % anObject.x, self.y % anObject.y)
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

	asRecord { :self |
		(x: self.x, y: self.y)
	}

	collect { :self :aBlock:/1 |
		Vector2(self.x.aBlock, self.y.aBlock)
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
			'Vector2(',
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
			self.error('asVector2: not 2-element array')
		} {
			let [x, y] = self;
			Vector2(x, y)
		}
	}

}

+Record {

	asVector2 { :self |
		Vector2(self::x, self::y)
	}

}

+@Number {

	@ { :x :y |
		Vector2(x, y)
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
