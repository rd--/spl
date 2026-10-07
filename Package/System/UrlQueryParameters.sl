@UrlQueryParameters {

	UrlQueryParameters { :self |
		self.typeResponsibility('UrlQueryParameters')
	}

}

URLSearchParams! : [Object, Iterable, UrlQueryParameters] {

	[equal, =] { :self :anObject |
		anObject.isUrlQueryParameters & {
			equal(self.queryString, anObject.queryString)
		}
	}

	add! { :self :anAssociation |
		self.uncheckedAppend(
			anAssociation.key,
			anAssociation.value
		)
	}

	associations { :self |
		let answer = [];
		self.keysAndValuesDo { :key :value |
			answer.add!(key -> value)
		};
		answer
	}

	at { :self :name |
		<primitive: return _self.get(_name);>
	}

	atAllEntries { :self :name |
		<primitive: return _self.getAll(_name);>
	}

	do { :self :aBlock/1 |
		self.keysAndValuesDo { :unusedKey :value |
			aBlock(value)
		}
	}

	includes { :self :name |
		<primitive: return _self.has(_name);>
	}

	isUrlQueryParameters { :self |
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

	keysAndValuesDo { :self :aBlock/2 |
		<primitive:
		_self.forEach(function(value, key, _myself) {
			_aBlock_2(key, value);
		});
		>
		self
	}

	put! { :self :name :value |
		<primitive: return _self.set(_name, _value);>
	}

	queryString { :self |
		<primitive: return _self.toString();>
	}

	removeKey! { :self :name |
		<primitive: _self.delete(_name);>
		nil
	}

	size { :self :name |
		<primitive: return _self.size;>
	}

	sort! { :self |
		<primitive:
		_self.sort();
		return null;
		>
	}

	uncheckedAppend { :self :name :value |
		<primitive: return _self.append(_name, _value);>
	}

	UrlQueryParameters { :self |
		self
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

	isUrlQueryParameters { :self |
		false
	}

}

+String {

	UrlQueryParameters { :self |
		<primitive: return new URLSearchParams(_self);>
	}

}

+Record {

	UrlQueryParameters { :self |
		<primitive: return new URLSearchParams(_self);>
	}

}
