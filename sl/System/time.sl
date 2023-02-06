+ System {

	systemTimeInMilliseconds { :self |
		<primitive: return performance.now();>
	}

	unixTimeInMilliseconds { :self |
		<primitive: return Date.now();>
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
