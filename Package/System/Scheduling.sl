+Block {

	valueAfter { :self/0 :delay |
		<primitive:
		if(sl.isSmallFloat(_delay)) {
			return setTimeout(_self_0, _delay * 1000);
		}
		>
		self/0.error('Block>>valueAfter: not a number')
	}

	valueAfterWith { :self/1 :delay :anObject |
		<primitive:
		if(sl.isSmallFloat(_delay)) {
			return setTimeout(_self_1, _delay * 1000, _anObject);
		}
		>
		self/1.error('Block>>valueAfterWith: not a number')
	}

	valueEvery { :self/0 :delay |
		<primitive:
		if(sl.isSmallFloat(_delay)) {
			return setInterval(_self_0, _delay * 1000);
		}
		>
		self/0.error('Block>>valueEvery: not a number')
	}

}

+SmallFloat {

	cancel { :self |
		<primitive: clearTimeout(_self);>
		nil
	}

}

Timeout! : [Object] {

	cancel { :self |
		<primitive: clearTimeout(_self);>
		nil
	}

}
