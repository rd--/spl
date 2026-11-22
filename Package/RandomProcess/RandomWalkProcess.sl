RandomWalkProcess : [Object] {

	| p q | <Float>

	Stream { :self :r |
		let p = self.p;
		let q = self.q;
		let x = 0.0;
		FunctionStream {
			let u = r.nextRandomFloat;
			(u < p).if {
				x := x + 1.0
			} {
				(u < (p + q)).ifTrue {
					x := x - 1.0
				}
			};
			x
		} {
			x := 0.0
		}
	}

	randomFunction { :self :r :t :n |
		Stream(self, r).valueSeriesRandomFunction(t, n)
	}

}

+Float {

	RandomWalkProcess { :p :q Float |
		uncheckedRandomWalkProcess(p, q)
	}

}
