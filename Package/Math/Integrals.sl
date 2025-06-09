+Block{

	adaptiveSimpsonsMethod { :f:/1 :i :epsilon |
		let mem = { :a :fa :b :fb |
			let m = (a + b) / 2;
			let fm = f(m);
			let s = (b - a).abs / 6 * (fa + (4 * fm) + fb);
			[m fm s]
		};
		let rec = { :a :fa :b :fb :epsilon :whole :m :fm |
			let [lm, flm, left] = mem(a, fa, m, fm);
			let [rm, frm, right] = mem(m, fm, b, fb);
			let delta = left + right - whole;
			(delta.abs <= (epsilon * 15)).if {
				left + right + (delta / 15)
			} {
				rec(a, fa, m, fm, epsilon / 2, left, lm, flm)
				+
				rec(m, fm, b, fb, epsilon / 2, right, rm, frm)
			}
		};
		let a = i[1];
		let b = i[2];
		let fa = f(a);
		let fb = f(b);
		let [m, fm, whole] = mem(a, fa, b, fb);
		rec(a, fa, b, fb, epsilon, whole, m, fm)
	}

	adaptiveSimpsonsMethod { :f:/1 :i |
		adaptiveSimpsonsMethod(f:/1, i, 1E-9)
	}

	trapezoidalRule { :f:/1 :interval :n |
		let [a, b] = interval.minMax;
		let stepSize = (b - a) / n;
		let integral = (f(a) + f(b)) / 2;
		let x = a + stepSize;
		{ x < b }.whileTrue {
			integral := integral + f(x);
			x := x + stepSize
		};
		integral * stepSize
	}

}
