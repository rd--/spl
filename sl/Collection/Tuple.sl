@Tuple {

	isTuple { :self |
		true
	}

}

+@Object {

	isTuple { :self |
		false
	}

}

TwoTuple : [Object, Tuple] { | first second |

	= { :self :anObject |
		anObject.isTwoTuple & {
			self.first = anObject.first & {
				self.second = anObject.second
			}
		}
	}

	size { :self |
		2
	}

}

ThreeTuple : [Object, Tuple] { | first second third |

	= { :self :anObject |
		anObject.isThreeTuple & {
			self.first = anObject.first & {
				self.second = anObject.second & {
					self.third = anObject.third
				}
			}
		}
	}

	size { :self |
		3
	}

}

FourTuple : [Object, Tuple] { | first second third fourth |

	= { :self :anObject |
		anObject.isFourTuple & {
			self.first = anObject.first & {
				self.second = anObject.second & {
					self.third = anObject.third & {
						self.fourth = anObject.fourth
					}
				}
			}
		}
	}

	size { :self |
		4
	}

}

+@Object {

	Tuple { :first :second |
		newTwoTuple().initializeSlots(first, second)
	}


	Tuple { :first :second :third |
		newThreeTuple().initializeSlots(first, second, third)
	}


	Tuple { :first :second :third :fourth |
		newFourTuple().initializeSlots(first, second, third, fourth)
	}

}

+@Sequenceable {

	asTuple { :self |
		self.size.caseOfOtherwise([
			{ 2 } -> { (self[1], self[2]) },
			{ 3 } -> { (self[1], self[2], self[3]) },
			{ 4 } -> { (self[1], self[2], self[3], self[4]) }
		]) {
			'@Sequenceable>>asTuple'.error
		}
	}

}
