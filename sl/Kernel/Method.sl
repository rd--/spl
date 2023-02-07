Method : [Object] {

	arity { :self |
		<primitive: return _self.arity;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	origin { :self |
		<primitive: return _self.origin;>
	}

	procedure { :self |
		<primitive: return _self.procedure;>
	}

	signature { :self |
		self.origin.prefixedName ++ '>>' ++ self.name ++ ':/' ++ self.arity
	}

	sourceCode { :self |
		<primitive: return _self.sourceCode;>
	}

}
