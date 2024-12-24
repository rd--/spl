ListElement : [Object] { | value next |

	isShorterThan { :self :other |
		let x = self;
		let y = other;
		valueWithReturn { :return:/1 |
			{
				y.isNil
			}.whileFalse {
				x.isNil.ifTrue {
					true.return
				};
				x := x.next;
				y := y.next
			};
			false
		}
	}

	length { :self |
		self.next.isNil.if {
			1
		} {
			1 + self.next.length
		}
	}

	talkWith { :self :y :z |
		y.isShorterThan(self).if {
			talkWith(
				talkWith(self.next, y, z),
				talkWith(y.next, z, self),
				talkWith(z.next, self, y)
			)
		} {
			z
		}
	}

}

+SmallFloat {

	ListElement { :self |
		newListElement().initializeSlots(self, nil)
	}

	makeList { :self |
		(self = 0).if {
			nil
		} {
			let e = ListElement(self);
			e.next := makeList(self - 1);
			e
		}
	}

}

+Void {

	listBenchmark {
		talkWith(
			makeList(15),
			makeList(10),
			makeList(6)
		)
	}

}
