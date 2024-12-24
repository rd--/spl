@EventTarget {

	addEventListener { :self :aString :aBlock:/1 |
		<primitive: return _self.addEventListener(_aString, _aBlock_1);>
	}

	addEventListener { :self :aString :aBlock:/1 :options |
		<primitive: return _self.addEventListener(_aString, _aBlock_1, _options);>
	}

	dispatchEvent { :self :event |
		<primitive: return _self.dispatchEvent(_event);>
	}

	removeEventListener { :self :aString :aBlock:/1 |
		<primitive: return _self.removeEventListener(_aString, _aBlock_1);>
	}

}
