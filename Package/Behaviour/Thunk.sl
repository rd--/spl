Thunk : [Object] { | block:<Block> result |

	[blockValue, value] { :self |
		self.result.ifNil {
			let answer = self.result := self.block.blockValue;
			self.block := nil;
			answer
		}
	}

	isEvaluated { :self |
		self.result.isNotNil
	}

}

+Block {

	thunk { :self |
		newThunk().initializeSlots(self, nil)
	}

}
