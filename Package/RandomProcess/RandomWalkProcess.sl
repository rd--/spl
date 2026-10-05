RandomWalkProcess : [Object] {

	| p q |

	randomFunction { :self :r :t :n |
		self.Stream(r).valueSeriesRandomFunction(t, n)
	}

	Stream { :self :r |
		let p = self.p;
		let q = self.q;
		let x = 0;
		BlockStream {
			let u = r.nextRandomFloat;
			(u < p).if {
				x := x + 1
			} {
				(u < (p + q)).ifTrue {
					x := x - 1
				}
			};
			x
		} {
			x := 0
		}
	}

}

+SmallFloat {

	RandomWalkProcess { :p :q |
		newRandomWalkProcess().initializeSlots(p, q)
	}

}
