MethodInformation! : [Object, Equatable] {

	arity { :self |
		<primitive: return _self.arity;>
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

	parameterNames { :self |
		<primitive: return _self.parameterNames;>
	}

	pseudoSlotNameList { :self |
		['name', 'packageName', 'parameterNames', 'sourceCode', 'origin']
	}

	sourceCode { :self |
		<primitive: return _self.sourceCode;>
	}

}

Method! : [Object] {

	[equal, =] { :self :anObject |
		identical(self, anObject)
	}

	arity { :self |
		self.information.arity
	}

	definition { :self |
		'	' ++ self.name ++ ' ' ++ self.sourceCode
	}

	definition { :self :aString |
		system.evaluate(
			[
				'+',
				self.origin.qualifiedName,
				'{ ',
				aString,
				' }'
			].stringCatenate
		)
	}

	information { :self |
		<primitive: return _self.information;>
	}

	name { :self |
		self.information.name
	}

	operatorTokenOrQualifiedName { :self |
		(self.arity = 2).if {
			self.name.splOperatorNameToken ? { self.qualifiedName }
		} {
			self.qualifiedName
		}
	}

	origin { :self |
		self.information.origin
	}

	packageName { :self |
		self.information.packageName
	}

	block { :self |
		<primitive: return _self.block;>
	}

	provenance { :self |
		'%:%'.format([
			self.packageName,
			self.origin.name
		])
	}

	pseudoSlotNameList { :self |
		['block', 'information']
	}

	qualifiedName { :self |
		self.name ++ ':/' ++ self.arity
	}

	signature { :self |
		self.origin.qualifiedName ++ '>>' ++ self.qualifiedName
	}

	sourceCode { :self |
		self.information.sourceCode
	}

}

+String {

	asMethodName { :self |
		self.isSplOperatorToken.if {
			self.splOperatorTokenName
		} {
			self
		}
	}

	parseQualifiedMethodName { :self |
		let parts = self.splitBy(':/');
		(parts.size = 2).if {
			[parts[1], parts[2].parseSmallInteger(10)]
		} {
			self.error('parseQualifiedMethodName')
		}
	}

	parseMethodSignature { :self |
		let parts = self.splitBy('>>');
		(parts.size = 2).if {
			parts
		} {
			self.error('parseMethodSignature')
		}
	}

}
