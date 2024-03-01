@UrlSearchParams {

	asUrlSearchParams { :self |
		self.typeReponsibility('asUrlSearchParams')
	}

}

URLSearchParams! : [Object, Iterable, UrlSearchParams] {

	= { :self :anObject |
		anObject.isUrlSearchParams & {
			self.asString = anObject.asString
		}
	}

	add { :self :anAssociation |
		self.basicAppend(anAssociation.key, anAssociation.value)
	}

	associations { :self |
		let answer = [];
		self.keysAndValuesDo { :key :value |
			answer.add(key -> value)
		};
		answer
	}

	asString { :self |
		<primitive: return _self.toString();>
	}

	asUrlSearchParams { :self |
		self
	}

	at { :self :name |
		<primitive: return _self.get(_name);>
	}

	atAllEntries { :self :name |
		<primitive: return _self.getAll(_name);>
	}

	atPut { :self :name :value |
		<primitive: return _self.set(_name, _value);>
	}

	basicAppend { :self :name :value |
		<primitive: return _self.append(_name, _value);>
	}

	do { :self :aBlock:/1 |
		self.keysAndValuesDo { :unusedKey :value |
			aBlock(value)
		}
	}

	includes { :self :name |
		<primitive: return _self.has(_name);>
	}

	isUrlSearchParams { :self |
		true
	}

	keys { :self |
		<primitive:
		const answer = [];
		for(const key of _self.keys()) {
			answer.push(key);
		}
		return answer;
		>
	}

	keysAndValuesDo { :self :aBlock:/2 |
		<primitive:
		_self.forEach(function(value, key, _myself) {
			_aBlock_2(key, value);
		});
		return _self;
		>
	}

	removeKey { :self :name |
		<primitive:
		_self.delete(_name);
		return null;
		>
	}

	size { :self :name |
		<primitive: return _self.size;>
	}

	sort { :self |
		<primitive:
		_self.sort();
		return _self;
		>
	}

	values { :self |
		<primitive:
		const answer = [];
		for(const value of _self.values()) {
			answer.push(value);
		}
		return answer;
		>
	}

}

+@Object {

	isUrlSearchParams { :self |
		false
	}

}

+String {

	asUrlSearchParams { :self |
		<primitive: return new URLSearchParams(_self);>
	}

}

+Record {

	asUrlSearchParams { :self |
		<primitive: return new URLSearchParams(_self);>
	}

}
