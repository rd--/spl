+ Void {

	uniqueId {
		| answer = system::nextUniqueId; |
		system::nextUniqueId := answer + 1;
		answer
	}

}
