Headers! : [Object] {

	at { :self :name |
		<primitive: return _self.get(_name);>
	}

	atPut { :self :name :value |
		<primitive: return _self.set(_name, _value);>
	}

	atIfAbsent { :self :name :aBlock:/0 |
		self.includesKey(name).if {
			self[name]
		} {
			aBlock()
		}
	}

	asRecord { :self |
		<primitive:
		const answer = {};
		_self.forEach(function(value, key) {
			answer[key] = value;
		});
		return answer;
		>
	}

	contentType { :self |
		self.atIfAbsent('Content-Type') {
			''
		}
	}

	includesKey { :self :name |
		<primitive: return _self.has(_name);>
	}

	removeKey { :self :name |
		<primitive: return _self.delete(_name);>
	}

}

+Record {

	asHeaders { :self |
		<primitive: return new Headers(_self);>
	}

}
