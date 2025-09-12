+Block {

	gradientDescentMethod { :f:/1 :x :alpha :tolerance |
		let gradientOf = { :p |
			let [x, y] = p;
			let a = 2 * (x - 1) * (-1 * y * y).exp;
			let b = 4 * x * (-2 * x * x).exp * y * (y + 2);
			let c = -2 * (x - 1) * (x - 1) * y * (-1 * y * y).exp;
			let d = (-2 * x * x).exp * (y + 2);
			let e = (-2 * x * x).exp * y;
			[a - b, c + d + e]
		};
		let n = x.size;
		let g0 = f(x);
		let fi = gradientOf(x);
		let delG = 0;
		let b = nil;
		1.toDo(n) { :i |
			delG := delG + (fi[i] * fi[i])
		};
		delG := delG.sqrt;
		b := alpha / delG;
		{ delG > tolerance }.whileTrue {
			let g1 = nil;
			1.toDo(n) { :i |
				x[i] := x[i] - (b * fi[i])
			};
			fi := gradientOf(x);
			delG := 0;
			1.toDo(n) { :i |
				delG := delG + (fi[i] * fi[i])
			};
			delG := delG.sqrt;
			b := alpha / delG;
			g1 := f(x);
			(g1 > g0).if {
				alpha := alpha / 2
			} {
				g0 := g1
			}
		};
		x
	}

}
