@At {

	at { :self :index |
		self.atIfAbsent(index) {
			self.errorInvalidIndex('at', index)
		}
	}

	atIfAbsent { :self :index :ifAbsent/0 |
		self.typeResponsibility('atIfPresentIfAbsent')
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
		self.atPathUsing(path, at/2)
	}

	atPathUsing { :self :path :aBlock/2 |
		let item = self;
		path.ifEmpty {
			self.errorInvalidIndex('atPathUsing', path)
		} {
			path.do { :index |
				item := aBlock(item, index)
			};
			item
		}
	}

	atPathWrap { :self :path |
		self.atPathUsing(path, atWrap/2)
	}

}
