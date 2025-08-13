/* Requires: RandomNumberGenerator */

+@RandomNumberGenerator{

	diamondSquareAlgorithm { :self :k :h :c |
		let n = (2 ^ k) + 1;
		let ds = 2 ^ (0 - h);
		let average = { :d :i :j :v :offsets |
			let n = d.shape[1];
			let res = 0;
			let k = 0;
			offsets.do { :each |
				let [p, q] = each;
				let pp = i + (p * v);
				let qq = j + (q * v);
				(pp.betweenAnd(0, n - 1) & { qq.betweenAnd(0, n - 1) }).ifTrue {
					res := res + d[pp + 1][qq + 1];
					k := k + 1
				}
			};
			res / k
		};
		let step = { :d :w :s |
			let n = d.shape[1];
			let v = w // 2;
			let diamond = [-1 -1; -1 1; 1 1; 1 -1];
			let square = [-1 0; 0 -1; 1 0; 0 1];
			Range([v, n - 1, w]).do { :i |
				Range([v, n - 1, w]).do { :j |
					d[i + 1][j + 1] := average(d, i, j, v, diamond) + self.nextRandomFloat(0 - s, s)
				}
			};
			Range([v, n - 1, w]).do { :i |
				Range([0, n - 1, w]).do { :j |
					d[i + 1][j + 1] := average(d, i, j, v, square) + self.nextRandomFloat(0 - s, s)
				}
			};
			Range([0, n - 1, w]).do { :i |
				Range([v, n - 1, w]).do { :j |
					d[i + 1][j + 1] := average(d, i, j, v, square) + self.nextRandomFloat(0 - s, s)
				}
			}
		};
		let d = [n n].zeroMatrix;
		let w = n - 1;
		let s = 1;
		d[n][1] := c[1];
		d[n][n] := c[2];
		d[1][n] := c[3];
		d[1][1] := c[4];
		{ w > 1 }.whileTrue {
			step(d, w, s);
			w := w // 2;
			s := s * ds
		};
		d
	}

	diamondSquareAlgorithm { :self :k :h |
		self.diamondSquareAlgorithm(k, h, [0 0 0 0])
	}

}
