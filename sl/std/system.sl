+ Void {

	systemTimeInMilliseconds {
		<primitive: return performance.now();>
	}

	unixTimeInMilliseconds {
		<primitive: return Date.now();>
	}

	uniqueId {
		| answer = system::nextUniqueId; |
		system::nextUniqueId := answer + 1;
		answer
	}

}

+ Procedure {

	evaluateAfterMilliseconds { :self :delayMilliseconds |
		<primitive: return setTimeout(_self, _delayMilliseconds);>
	}

	evaluateAfterMillisecondsWith { :self :delayMilliseconds :anObject |
		<primitive: return setTimeout(_self, _delayMilliseconds, _anObject);>
	}

	evaluateEveryMilliseconds { :self :delayMilliseconds |
		<primitive: return setInterval(_self, _delayMilliseconds);>
	}

}

+ Number {

	cancel { :self |
		<primitive: clearTimeout(_self); return null;>
	}

}
