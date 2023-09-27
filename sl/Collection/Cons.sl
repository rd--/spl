Cons : [Object, Collection] { | car cdr |

	= { :self :anObject |
		anObject.isCons &
		{ self.car = anObject.car } &
		{ self.cdr = anObject.cdr }
	}

	collect { :self :aBlock:/1 |
		| answer |
		self.do { :each |
			answer := Cons(aBlock(each), answer)
		};
		answer.reversed
	}

	depth { :self |
		| answer = 1, next = self.car; |
		{ next.isCons }.whileTrue {
			answer +:= 1;
			next := next.car
		};
		answer
	}

	do { :self :aBlock:/1 |
		| next = self.cdr; |
		aBlock(self.car);
		{ next.isCons }.whileTrue {
			aBlock(next.car);
			next := next.cdr
		}
	}

	isList { :self |
		| next = self.cdr; |
		{ next.isCons }.whileTrue {
			next := next.cdr
		};
		next = nil
	}

	length { :self |
		| answer = 1, next = self.cdr; |
		{ next.isCons }.whileTrue {
			answer +:= 1;
			next := next.cdr
		};
		(next = nil).if {
			answer
		} {
			'Cons>>length: not proper list'.error
		}
	}

	reversed { :self |
		| answer = Cons(self.car, nil), next = self.cdr; |
		{ next.isCons }.whileTrue {
			answer := Cons(next.car, answer);
			next := next.cdr
		};
		(next = nil).if {
			answer
		} {
			'Cons>>reversed: not proper list'.error
		}
	}

}

+@Sequenceable {

	Cons { :self |
		| answer = nil; |
		self.do { :each |
			answer := Cons(
				each.isSequenceable.if { Cons(each) } { each },
				answer
			)
		};
		answer.reversed
	}

}

+@Object {

	Cons { :car :cdr |
		newCons().initializeSlots(car, cdr)
	}

}
