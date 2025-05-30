+SmallFloat {

	duffingEquation { :gamma :delta :omega |
		{ :t :v |
			let [x, y] = v;
			[
				y,
				x - (x ^ 3) - (delta * y) + (gamma * cos(omega * t))
			]
		}
	}

	lorenzEquation { :rho :sigma :beta |
		{ :t :v |
			let [x, y, z] = v;
			[
				sigma * (y - x),
				x * (rho - z) - y,
				(x * y) - (beta * z)
			]
		}
	}

	rosslerEquation { :a :b :c |
		{ :t :v |
			let [x, y, z] = v;
			[
				0 - y - z,
				x + (a * y),
				b + (z * (x - c))
			]
		}
	}

	vanDerPolEquation { :mu |
		{ :t :v |
			let [x, y] = v;
			[
				y,
				(mu * (1 - (x ^ 2)) * y) - x
			]
		}
	}

}

+Block {

	eulerMethod { :self:/2 :y0 :x0 :x1 :h |
		let x = x0;
		let y = y0;
		let vx = [x0];
		let vy = [y0];
		{
			x < x1
		}.whileTrue {
			x := x + h;
			y := y + (h * self(x, y));
			vx.add(x);
			vy.add(y)
		};
		[vx, vy]
	}

	rungeKuttaMethod { :self:/2 :y0 :x0 :x1 :h |
		let f:/2 = self:/2;
		let x = x0;
		let y = y0;
		let vx = [x0];
		let vy = [y0];
		{
			x < x1
		}.whileTrue {
			let k1 = h * f(x, y);
			let k2 = h * f(x + (0.5 * h), y + (0.5 * k1));
			let k3 = h * f(x + (0.5 * h), y + (0.5 * k2));
			let k4 = h * f(x + h, y + k3);
			x := x + h;
			y := y + ((k1 + k2 + k2 + k3 + k3 + k4) / 6);
			vx.add(x);
			vy.add(y)
		};
		[vx, vy]
	}

}
