Promise! : [Object] {

	catch { :self :aBlock:/1 |
		<primitive: return _self.catch(_aBlock_1);>
	}

	finally { :self :aBlock:/0 |
		<primitive: return _self.finally(_aBlock_0);>
	}

	then { :self :aBlock:/1 |
		<primitive: return _self.then(_aBlock_1);>
	}

	thenElse { :self :onResolve:/1 :onReject:/1 |
		<primitive: return _self.then(_onResolve_1, _onReject_1);>
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
