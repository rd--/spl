Pair : [Object] { | first second |

	= { :self :anObject |
		anObject.isPair &
		{ self[1] = anObject[1] } &
		{ self[2] = anObject[2] }
	}

	at { :self :index |
		(index = 1).if {
			self.first
		} {
			(index = 2).if {
				self.second
			} {
				'Pair>>at: invalid index'.error
			}
		}
	}

	atPut { :self :index :value |
		(index = 1).if {
			self.first := value
		} {
			(index = 2).if {
				self.second := value
			} {
				'Pair>>atPut: invalid index'.error
			}
		}
	}

	size { :self |
		2
	}

	swapInPlace { :self |
		| temporaryValue = self.first; |
		self.first := self.second;
		self.second := temporaryValue
	}

	swapped { :self |
		Pair(self.second, self.first)
	}

}

+ @Object {

	Pair { :self :second |
		newPair().initializeSlots(self, second)
	}

}
