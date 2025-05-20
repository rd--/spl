+List {

	grahamScan { :self |
		let h = [];
		let p0 = self.minBy(precedes:/2);
		let p = self.collect { :each |
			let [d, a] = (p0 - each).toPolarCoordinates;
			(a < 0).ifTrue {
				a := a + 2.pi
			};
			[each, a, d]
		}.sortBy { :u :v |
			(u[2] = v[2]).if {
				u[3] < v[3]
			} {
				u[2] < v[2]
			}
		};
		p.removeAtAll(
			(2 .. p.size - 1).select { :i |
				p[i][2] = p[i + 1][2]
			}
		);
		p := p.collect(first:/1);
		1.toDo(p.size) { :i |
			let x = p[i];
			(h.size < 3).if {
				h.addLast(x)
			} {
				{
					(h.size > 1) & {
						[h[h.size - 1], h[h.size], x].shoelaceFormula < 0
					}
				}.whileTrue {
					h.removeLast
				};
				h.addLast(x)
			}
		};
		h
	}

}
