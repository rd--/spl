Pair { | first second |

	= { :self :anObject |
		anObject.isPair &
		{ self[1] = anObject[1] } &
		{ self[2] = anObject[2] }
	}

	at { :self :index |
		if(index = 1) {
			self.first
		} {
			if(index = 2) {
				self.second
			} {
				'Pair>>at: invalid index'.error
			}
		}
	}

	atPut { :self :index :value |
		if(index = 1) {
			self.first := value
		} {
			if(index = 2) {
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
