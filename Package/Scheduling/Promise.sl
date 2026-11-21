Promise! : [Object] {

	finally { :self :aFunction/0 |
		<primitive: return _self.finally(_aFunction_0);>
	}

	onRejection { :self :aFunction/1 |
		<primitive: return _self.catch(_aFunction_1);>
	}

	then { :self :aFunction/1 |
		<primitive: return _self.then(_aFunction_1);>
	}

	thenElse { :self :onResolve/1 :onReject/1 |
		<primitive: return _self.then(_onResolve_1, _onReject_1);>
	}

}

+Function {

	Promise { :self/2 |
		<primitive: return new Promise(_self_2);>
	}

}

+List {

	allFulfilled { :self |
		<primitive: return Promise.all(_self);>
	}

	allSettled { :self |
		<primitive: return Promise.allSettled(_self);>
	}

	anyFulfilled { :self |
		<primitive: return Promise.any(_self);>
	}

	anySettled { :self |
		<primitive: return Promise.race(_self);>
	}

}

+Error {

	rejectedPromise { :self |
		<primitive: return Promise.reject(_self);>
	}

}

+@Object {

	resolvedPromise { :self |
		<primitive: return Promise.resolve(_self);>
	}

}

+Promise {

	drawing { :self |
		self.then { :result |
			result.drawing
		}
	}

	show { :self |
		self.thenElse { :result |
			result.show
		} { :err |
			self.error('show', [err])
		}
	}

	writePng { :self :fileName |
		self.thenElse { :result |
			result.writePng(fileName)
		} { :err |
			self.error('writePng', [err])
		}
	}

	writeSvg { :self :fileName |
		self.thenElse { :result |
			result.writeSvg(fileName)
		} { :err |
			self.error('writeSvg', [err])
		}
	}

}
