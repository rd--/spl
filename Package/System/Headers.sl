Headers! : [Object] {

	at { :self :name |
		<primitive: return _self.get(_name);>
	}

	atIfAbsent { :self :name :aBlock/0 |
		self.includesKey(name).if {
			self[name]
		} {
			aBlock()
		}
	}

	contentType { :self |
		self.atIfAbsent('Content-Type') {
			''
		}
	}

	includesKey { :self :name |
		<primitive: return _self.has(_name);>
	}

	put! { :self :name :value |
		<primitive: return _self.set(_name, _value);>
	}

	Record { :self |
		<primitive:
		const answer = {};
		_self.forEach(function(value, key) {
			answer[key] = value;
		});
		return answer;
		>
	}

	removeKey! { :self :name |
		<primitive: return _self.delete(_name);>
	}

}

+Record {

	Headers { :self |
		<primitive: return new Headers(_self);>
	}

}
