+List{

	recurrenceFilter { :c :x :y0 |
		let [a, b] = c;
		let [n, m] = [a.size, b.size];
		let y = List(x.size, 0);
		1.toDo(x.size) { :i |
			let p = (0 .. m - 1).collect { :j |
				b.at(j + 1) * x.atIfAbsent(i - j) { 0 }
			}.sum;
			let q = (0 .. n - 1).collect { :j |
				a.at(j + 1) * y.atIfAbsent(i - j) { y0.at(1 - (i - j)) }
			}.sum;
			y[i] := p - q
		};
		y
	}

	recurrenceFilter { :c :x |
		let k = c.at(1).size - 1;
		c.recurrenceFilter(x, 0 # k)
	}

}
