Method : [Object] {

	arity { :self |
		<primitive: return _self.arity;>
	}

	definition { :self |
		'	' ++ self.name ++ ' ' ++ self.sourceCode
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

	qualifiedName { :self |
		self.name ++ ':/' ++ self.arity
	}

	signature { :self |
		self.origin.name ++ '>>' ++ self.qualifiedName
	}

	sourceCode { :self |
		<primitive: return _self.sourceCode;>
	}

}

+ String {

	parseQualifiedMethodName { :self |
		| parts = self.splitBy(':/'); |
		(parts.size = 2).if {
			[parts[1], parts[2].parseInteger(10)]
		} {
			('String>>parseQualifiedMethodName: ' ++ self).error
		}
	}

	parseMethodSignature { :self |
		| parts = self.splitRegExp(RegExp('>>|:/')); |
		(parts.size = 3).if {
			[parts[1], parts[2], parts[3].parseInteger(10)]
		} {
			('String>>parseMethodSignature: ' ++ self).error
		}
	}

}
