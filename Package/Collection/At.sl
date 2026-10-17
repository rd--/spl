/* Require: Object */

@At {

	atIfAbsent { :self :index :ifAbsent/0 |
		self.typeResponsibility('atIfPresentIfAbsent')
	}

}

+@At {

	assertIsOfSize { :self :anInteger |
		self.assert('isOfSize') {
			self.size = anInteger
		}
	}

	assertIsValidIndex { :self :index |
		self.includesIndex(index).if {
			index
		} {
			self.errorInvalidIndex('assertIsValidIndex', index)
		}
	}

	at { :self :index |
		self.atIfAbsent(index) {
			self.errorInvalidIndex('at', index)
		}
	}

	atIfPresent { :self :index :ifPresent/1 |
		self.atIfPresentIfAbsent(
			index,
			ifPresent/1,
			{ nil }
		)
	}

	atIfPresentIfAbsent { :self :index :ifPresent/1 :ifAbsent/0 |
		let isPresent = true;
		let answer = self.atIfAbsent(index) {
			isPresent := false;
			ifAbsent()
		};
		isPresent.if {
			ifPresent(answer)
		} {
			answer
		}
	}

	atIncrementBy { :self :index :value |
		self[index] := self[index] + value
	}

	atLinear { :self :index |
		self.atPath(self.shape.cartesianIndex(index))
	}

	atOrMissing { :self :index |
		self.atIfAbsent(index) {
			Missing('NotAvailable', index)
		}
	}

	atOrNil { :self :index |
		self.atIfAbsent(index) {
			nil
		}
	}

	atPath { :self :path |
		let item = self;
		path.ifEmpty {
			self.errorInvalidIndex('atPath', path)
		} {
			path.do { :index |
				item := item[index]
			};
			item
		}
	}

}
