BrownianBridgeProcess : [Object] { | sigma start end |

	randomFunction { :self :r :t :n |
		let sigma = self.sigma;
		let [t1, x1] = self.start;
		let [t2, x2] = self.end;
		let a = { :y :t | (x2 - y) / (t2 - t) };
		let b = { :y :t | sigma };
		let [tMin, tMax, dt] = t;
		(t1 != tMin | { t2 != tMax }).if {
			self.error('randomFunction: invalid t')
		} {
			TemporalData(
				{
					let [p, q] = r.eulerMaruyamaMethod(a:/2, b:/2, t, x1);
					let k = q.size;
					q[k] := x2;
					[p, q].transpose
				} ! n
			)
		}
	}

}

+SmallFloat {

	BrownianBridgeProcess { :sigma :start :end |
		newBrownianBridgeProcess().initializeSlots(sigma, start, end)
	}

}
