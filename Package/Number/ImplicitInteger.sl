@ImplicitInteger {

	integerLength { :self :radix |
		integerLength(Integer(self), Integer(radix))
	}

	integerString { :self :radix |
		integerString(Integer(self), Integer(radix))
	}

}
