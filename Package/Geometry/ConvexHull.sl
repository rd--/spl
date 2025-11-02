+List {

	grahamScan { :self |
		let h = [];
		let p0 = self.minBy(precedes:/2);
		let p = self.withIndexCollect { :each :i |
			let [d, a] = (p0 - each).toPolarCoordinates;
			(a < 0).ifTrue {
				a := a + 2.pi
			};
			[each, a, d, i]
		}.sortBy { :u :v |
			(u[2] = v[2]).if {
				u[3] < v[3]
			} {
				u[2] < v[2]
			}
		};
		p.removeAtAll(
			2.to(p.size - 1).select { :i |
				p[i][2] = p[i + 1][2]
			}
		);
		1.toDo(p.size) { :i |
			let x = p[i];
			(h.size < 3).if {
				h.addLast(x)
			} {
				{
					(h.size > 1) & {
						[
							h[h.size - 1][1],
							h[h.size][1],
							x[1]
						].shoelaceFormula < 0
					}
				}.whileTrue {
					h.removeLast
				};
				h.addLast(x)
			}
		};
		h.collect(fourth:/1)
	}

}
