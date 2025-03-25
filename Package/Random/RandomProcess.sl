+@Stream {

	randomFunction { :self :t :n |
		{ :timeList |
			let answer = self.next(timeList.size);
			self.reset;
			answer
		}.regularTemporalData(t ! n)
	}

}

+@RandomNumberGenerator {

	eulerMaruyamaMethod { :self :a:/2 :b:/2 :t :y0 |
		let [tMin, tMax, dt] = t;
		let ts = [tMin, tMin + dt .. tMax];
		let n = ts.size;
		let ys = List(n, 0);
		let dW = { :dt |
			self.normalDistribution(0, dt.sqrt)
		};
		ys[1] := y0;
		2.toDo(n) { :i |
			let t = ts[i - 1];
			let y = ys[i - 1];
			ys[i] := y + (a(y, t) * dt) + (b(y, t) * dW(dt))
		};
		[ts, ys]
	}

	milsteinMethod { :self :a:/1 :b:/1 :c:/1 :t :y0 |
		let [tMin, tMax, dt] = t;
		let ts = [tMin, tMin + dt .. tMax];
		let n = ts.size;
		let ys = List(n, 0);
		let dW = { :dt |
			self.normalDistribution(0, dt.sqrt)
		};
		ys[1] := y0;
		2.toDo(n) { :i |
			let y = ys[i - 1];
			let dw = dW(dt);
			ys[i] := y + (a(y) * dt) + (b(y) * dw) + (0.5 * c(y) * (dw.squared - dt))
		};
		[ts, ys]
	}

}
