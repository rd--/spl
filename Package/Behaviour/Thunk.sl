Thunk : [Object] {

	| nullaryBlock result |

	[apply, nullaryApply] { :self |
		self.force
	}

	force { :self |
		self.result.ifNil {
			let answer = self.result := self.nullaryBlock.nullaryApply;
			self.nullaryBlock := nil;
			answer
		}
	}

	isEvaluated { :self |
		self.result.isNotNil
	}

}

+Block {

	thunk { :self/0 |
		(self/0.numArgs = 0).ifFalse {
			self/0.error('thunk')
		};
		uncheckedThunk(self/0)
	}

	uncheckedThunk { :self/0 |
		newThunk().initializeSlots(self/0, nil)
	}

}
