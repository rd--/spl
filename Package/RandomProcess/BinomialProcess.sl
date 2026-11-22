BinomialProcess : [Object] {

	| p | <Float>

	Stream { :self :r |
		let p = self.p;
		let x = 0;
		FunctionStream {
			x := x + (r.nextRandomFloat < p).boole
		} {
			x := 0
		}
	}

	randomFunction { :self :r :t :n |
		Stream(self, r).valueSeriesRandomFunction(t, n)
	}

}

+Float {

	BinomialProcess { :p |
		uncheckedBinomialProcess(p)
	}

}
