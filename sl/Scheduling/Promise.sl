Promise! : [Object] {

	catch { :self :aBlock |
		<primitive: return _self.catch(_aBlock);>
	}

	finally { :self :aBlock |
		<primitive: return _self.finally(_aBlock);>
	}

	resolvedPromise { :self |
		<primitive: return Promise.resolve(_self);>
	}

	then { :self :aBlock |
		<primitive: return _self.then(_aBlock);>
	}

	thenElse { :self :onResolve :onReject |
		<primitive: return _self.then(_onResolve, _onReject);>
	}

}

+Block {

	Promise { :self:/2 |
		<primitive: return new Promise(_self_2);>
	}

}

+Array {

	allResolved { :self |
		<primitive: return Promise.all(_self);>
	}

	allSettled { :self |
		<primitive: return Promise.allSettled(_self);>
	}

	anyResolved { :self |
		<primitive: return Promise.any(_self);>
	}

	anySettled { :self |
		<primitive: return Promise.race(_self);>
	}

	Promise { :self |
		self.allResolved
	}

}

+Error {

	Promise { :self |
		<primitive: return Promise.reject(_self);>
	}

}

+@Object {

	resolvedPromise { :self |
		<primitive: return Promise.resolve(_self);>
	}

}
