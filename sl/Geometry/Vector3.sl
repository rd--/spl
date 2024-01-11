{- Requires: Vector2 -}

Vector3 : [Object, Indexable, CartesianCoordinate] { | x y z |

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

	Vector3 { :x :y :z |
		newVector3().initializeSlots(x, y, z)
	}

}

+Array {

	asVector3 { :self |
		(self.size ~= 3).if {
			self.error('asVector3: not 3-element array')
		} {
			let [x, y, z] = self;
			Vector3(x, y, z)
		}
	}

}

+Record {

	asVector3 { :self |
		Vector3(self::x, self::y, self::z)
	}

}
