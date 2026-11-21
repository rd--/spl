@EventTarget {

	addEventListener { :self :aString :aFunction/1 |
		<primitive:
		return _self.addEventListener(_aString, _aFunction_1);
		>
	}

	addEventListener { :self :aString :aFunction/1 :options |
		<primitive:
		return _self.addEventListener(_aString, _aFunction_1, _options);
		>
	}

	dispatchEvent { :self :event |
		<primitive:
		return _self.dispatchEvent(_event);
		>
	}

	removeEventListener { :self :aString :aFunction/1 |
		<primitive:
		return _self.removeEventListener(_aString, _aFunction_1);
		>
	}

}
