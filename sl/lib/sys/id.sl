+ IdentityDictionary {

	uniqueId { :self |
		| answer = self::nextUniqueId; |
		self::nextUniqueId := answer + 1;
		answer
	}

}
