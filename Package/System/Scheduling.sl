+Block {

	valueAfterMilliseconds { :self:/0 :delayInMilliseconds |
		<primitive:
		if(sl.isSmallFloat(_delayInMilliseconds)) {
			return setTimeout(_self_0, _delayInMilliseconds);
		}
		>
		self.error('Block>>valueAfterMilliseconds: not a number')
	}

	valueAfterMillisecondsWith { :self:/1 :delayInMilliseconds :anObject |
		<primitive:
		if(sl.isSmallFloat(_delayInMilliseconds)) {
			return setTimeout(_self_1, _delayInMilliseconds, _anObject);
		}
		>
		self.error('Block>>valueAfterMillisecondsWith: not a number')
	}

	valueEveryMilliseconds { :self:/0 :delayInMilliseconds |
		<primitive:
		if(sl.isSmallFloat(_delayInMilliseconds)) {
			return setInterval(_self_0, _delayInMilliseconds);
		}
		>
		self.error('Block>>valueEveryMilliseconds: not a number')
	}

}

+SmallFloat {

	cancel { :self |
		<primitive: clearTimeout(_self);>
		nil
	}

}
