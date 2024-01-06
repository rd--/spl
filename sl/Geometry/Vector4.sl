(* Requires: Vector2 Vector3 *)

Vector4 : [Object, Indexable] { | w x y z |

	= { :self :anObject |
		anObject.isVector4.if {
			self.asArray = anObject.asArray
		} {
			false
		}
	}

	asArray { :self |
		[self.w, self.x, self.y, self.z]
	}

	asRecord { :self |
		(w: self.w, x: self.x, y: self.y, z: self.z)
	}

	isZero { :self |
		self.w = 0 & {
			self.x = 0 & {
				self.y = 0 & {
					self.z = 0
				}
			}
		}
	}

	size { :self |
		4
	}

	xy { :self |
		Vector2(self.x, self.y)
	}

	xyz { :self |
		Vector3(self.x, self.y, self.z)
	}

}

+@Number {

	Vector4 { :self :x :y :z |
		newVector4().initializeSlots(self, x, y, z)
	}

}

+Array {

	asVector4 { :self |
		(self.size ~= 4).if {
			self.error('asVector4: not 4-element array')
		} {
			let [w, x, y, z] = self;
			Vector4(w, x, y, z)
		}
	}

}


+Record {

	asVector4 { :self |
		Vector4(self::w, self::x, self::y, self::z)
	}

}
