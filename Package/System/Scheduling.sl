+Block {

	scheduleAfter { :self/0 :delay |
		<primitive:
		const floatDelay = sl.toFloat(_delay);
		return setTimeout(_self_0, floatDelay * 1000);
		>
	}

	scheduleAfterWith { :self/1 :delay :anObject |
		<primitive:
		const floatDelay = sl.toFloat(_delay);
		return setTimeout(_self_1, floatDelay * 1000, _anObject);
		>
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
		const floatDelay = sl.toFloat(_delay);
		return setInterval(_self_0, floatDelay * 1000);
		>
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
