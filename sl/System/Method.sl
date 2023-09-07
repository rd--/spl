Method : [Object] {

	arity { :self |
		<primitive: return _self.arity;>
	}

	definition { :self |
		'	' ++ self.name ++ ' ' ++ self.sourceCode
	}

	definition { :self :aString |
		[
			'+',
			self.origin.qualifiedName,
			'{ ',
			aString,
			' }'
		].join.evaluate
	}

	name { :self |
		<primitive: return _self.name;>
	}

	origin { :self |
		<primitive: return _self.origin;>
	}

	packageName { :self |
		<primitive: return _self.packageName;>
	}

	procedure { :self |
		<primitive: return _self.procedure;>
	}

	provenance { :self |
		[self.packageName, '-', self.origin.name].join
	}

	pseudoSlotNameArray { :self |
		['name', 'packageName', 'procedure', 'arity', 'sourceCode', 'origin']
	}

	qualifiedName { :self |
		self.name ++ ':/' ++ self.arity
	}

	signature { :self |
		self.origin.qualifiedName ++ '>>' ++ self.qualifiedName
	}

	sourceCode { :self |
		<primitive: return _self.sourceCode;>
	}

}

+String {

	asMethodName { :self |
		self.isOperatorName.if {
			self.operatorMethodName
		} {
			self
		}
	}

	isOperatorName { :self |
		<primitive: return sl.isOperatorName(_self);>
	}

	operatorMethodName { :self |
		<primitive: return sl.operatorMethodName(_self);>
	}

	parseQualifiedMethodName { :self |
		| parts = self.splitBy(':/'); |
		(parts.size = 2).if {
			[parts[1], parts[2].parseInteger(10)]
		} {
			self.error('parseQualifiedMethodName')
		}
	}

	parseMethodSignature { :self |
		| parts = self.splitBy('>>'); |
		(parts.size = 2).if {
			parts
		} {
			self.error('parseMethodSignature')
		}
	}

}
