Vector3 : [Object, Indexable] { | x y z |

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isVector3 & {
			aBlock(self.x, anObject.x)
		} & {
			aBlock(self.y, anObject.y)
		} & {
			aBlock(self.z, anObject.z)
		}
	}

	= { :self :anObject |
		self.equalBy(anObject, equals:/2)
	}

	~ { :self :anObject |
		self.equalBy(anObject, tilde:/2)
	}

	asArray { :self |
		[self.x, self.y, self.z]
	}

	at { :self :index |
		index.caseOfOtherwise([
			1 -> { self.x },
			2 -> { self.y },
			3 -> { self.z }
		]) {
			self.error('at: index out of range')
		}
	}

	atPut { :self :index :value |
		index.caseOfOtherwise([
			1 -> { self.x := value },
			2 -> { self.y := value },
			3 -> { self.z := value }
		]) {
			self.error('atPut: index out of range')
		}
	}

	distance { :self :aVector |
		(
			(aVector.x - self.x).squared +
			(aVector.y - self.y).squared +
			(aVector.z - self.z).squared
		).sqrt
	}

	first { :self |
		self.x
	}

	isZero { :self |
		self.x.isZero & {
			self.y.isZero
		} & {
			self.z.isZero
		}
	}

	second { :self |
		self.y
	}

	size { :self |
		3
	}

	third { :self |
		self.z
	}

	xy { :self |
		Vector2(self.x, self.y)
	}

	xz { :self |
		Vector2(self.x, self.z)
	}

	yz { :self |
		Vector2(self.y, self.z)
	}

}

+@Number {

	Vector3 { :self :y :z |
		newVector3().initializeSlots(self, y, z)
	}

}

+Array {

	Vector3 { :self |
		(self.size ~= 3).if {
			self.error('Vector3: not 3-element array')
		} {
			| [x, y, z] = self; |
			Vector3(x, y, z)
		}
	}

}
