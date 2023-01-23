@Binary {

	<< { :self :anObject |
		self.subclassResponsibility
	}

	>> { :self :anObject |
		self.subclassResponsibility
	}

	bitAnd { :self :anObject |
		self.subclassResponsibility
	}

	bitNot { :self |
		self.subclassResponsibility
	}

	bitOr { :self :anObject |
		self.subclassResponsibility
	}

	bitXor { :self :anObject |
		self.subclassResponsibility
	}

	bitShiftLeft { :self :anObject |
		self << anObject
	}

	bitShiftRight { :self :anObject |
		self >> anObject
	}

}
