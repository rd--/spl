Cons : [Object, Do, Collection] {

	| car cdr |

	collect { :self :aBlock/1 |
		let answer = nil;
		self.do { :each |
			answer := Cons(aBlock(each), answer)
		};
		answer.reverse
	}

	depth { :self |
		let answer = 1;
		let next = self.car;
		{
			next.isCons
		}.whileTrue {
			answer := answer + 1;
			next := next.car
		};
		answer
	}

	do { :self :aBlock/1 |
		let next = self.cdr;
		aBlock(self.car);
		{
			next.isCons
		}.whileTrue {
			aBlock(next.car);
			next := next.cdr
		}
	}

	[equal, =] { :self :anObject |
		anObject.isCons & {
			self.car = anObject.car & {
				self.cdr = anObject.cdr
			}
		}
	}

	isList { :self |
		let next = self.cdr;
		{
			next.isCons
		}.whileTrue {
			next := next.cdr
		};
		next = nil
	}

	reverse { :self |
		let answer = Cons(self.car, nil);
		let next = self.cdr;
		{
			next.isCons
		}.whileTrue {
			answer := Cons(next.car, answer);
			next := next.cdr
		};
		(next = nil).if {
			answer
		} {
			'Cons>>reverse: not proper list'.error
		}
	}

	size { :self |
		let answer = 1;
		let next = self.cdr;
		{
			next.isCons
		}.whileTrue {
			answer := answer + 1;
			next := next.cdr
		};
		(next = nil).if {
			answer
		} {
			'Cons>>size: not proper list'.error
		}
	}

}

+List {

	Cons { :self |
		let answer = nil;
		self.do { :each |
			answer := Cons(
				each.isSequence.if {
					Cons(each)
				} {
					each
				},
				answer
			)
		};
		answer.reverse
	}

}

+@Object {

	Cons { :car :cdr |
		newCons().initializeSlots(car, cdr)
	}

}
