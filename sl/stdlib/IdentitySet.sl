IdentitySet : [Collection] {

	add { :self :anObject |
		<primitive: _self.add(_anObject); return _anObject;>
	}

	asArray { :self |
		<primitive: return Array.from(_self);>
	}

	do { :self :aProcedure |
		<primitive: _self.forEach(_aProcedure); return null;>
	}

	includes { :self :anObject |
		<primitive: return _self.has(_anObject);>
	}

	isIdentitySet { :self |
		true
	}

	remove { :self :anObject |
		<primitive: _self.delete(_anObject); return _anObject;>
	}

	size { :self |
		<primitive: return _self.size;>
	}

}

+ Array {

	asIdentitySet { :self |
		<primitive: return new Set(_self);>
	}

}

+ Object {

	isIdentitySet { :self |
		false
	}

}

+Void {

	IdentitySet {
		<primitive: return new Set();>
	}

}
