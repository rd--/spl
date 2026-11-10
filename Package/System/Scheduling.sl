+Block {

	scheduleAfter { :self/0 :delay |
		<primitive:
		const floatDelay = sl.toFloat(_delay);
		if(sl.isFloat(floatDelay)) {
			return setTimeout(_self_0, floatDelay * 1000);
		}
		>
		self/0.error('Block>>scheduleAfter: not a number')
	}

	scheduleAfterWith { :self/1 :delay :anObject |
		<primitive:
		if(sl.isFloat(_delay)) {
			return setTimeout(_self_1, _delay * 1000, _anObject);
		}
		>
		self/1.error('Block>>scheduleAfterWith: not a number')
	}

	scheduleAt { :self :time |
		let t0 = system.absoluteTime;
		self.scheduleAfter(time - t0)
	}

	scheduleAtWith { :self :time :anObject |
		let t0 = system.absoluteTime;
		self.scheduleAfterWith(time - t0, anObject)
	}

	scheduleEvery { :self/0 :delay |
		<primitive:
		if(sl.isFloat(_delay)) {
			return setInterval(_self_0, _delay * 1000);
		}
		>
		self/0.error('Block>>scheduleEvery: not a number')
	}

}

+Float {

	cancel { :self |
		<primitive:
		clearTimeout(_self);
		>
		nil
	}

}

Timeout! : [Object] {

	cancel { :self |
		<primitive:
		clearTimeout(_self);
		>
		nil
	}

}
