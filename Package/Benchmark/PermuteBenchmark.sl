PermuteBenchmark : [Object] { | count v |

	benchmark { :self |
		self.count := 0;
		self.v := [0, 0, 0, 0, 0, 0];
		self.permute(6);
		self.count
	}

	verifyResult { :self :result |
		result = 8660
	}

	permute { :self :n |
		self.count := self.count + 1;
		(n ~= 0).ifTrue {
			self.permute(n - 1);
			n.toByDo(1, -1) { :i |
				self.swapWith(n,i);
				self.permute(n - 1);
				self.swapWith(n,i)
			}
		}
	}

	swapWith { :self :i :j |
		let tmp = self.v[i];
		self.v[i] := self.v[j];
		self.v[j] := tmp
	}

}

+Void {

	PermuteBenchmark {
		newPermuteBenchmark().benchmark
	}

}
