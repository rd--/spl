Thunk : [Object] {

	| nullaryFunction result |

	[apply, nullaryApply] { :self |
		self.force
	}

	force { :self |
		self.result.ifNil {
			let answer = self.result := self.nullaryFunction.nullaryApply;
			self.nullaryFunction := nil;
			answer
		}
	}

	isEvaluated { :self |
		self.result.isNotNil
	}

}

+Function {

	thunk { :self/0 |
		(self/0.argumentCount = 0).ifFalse {
			self/0.error('thunk')
		};
		uncheckedThunk(self/0)
	}

	uncheckedThunk { :self/0 |
		newThunk().initializeSlots(self/0, nil)
	}

}
