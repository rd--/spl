+Record {

	atDelegateTo { :self :key :delegateKey |
		self.atDelegateToIfAbsent(key, delegateKey) {
			self.error('Record>>atDelegate: unknown key', [key])
		}
	}

	atDelegateToIfAbsent { :self :key :delegateKey :aFunction/0 |
		self.atIfAbsent(key) {
			self.includesIndex(delegateKey).if {
				self[delegateKey].atDelegateToIfAbsent(
					key,
					delegateKey,
					aFunction/0
				)
			} {
				aFunction()
			}
		}
	}

	messageSend { :self :selector :delegateKey :argumentsList |
		let answer = self.atDelegateTo(selector, delegateKey);
		answer.isFunction.if {
			answer.applyList([self] ++ argumentsList)
		} {
			answer
		}
	}

	putDelegateTo { :self :key :value :delegateKey |
		self.putDelegateToIfAbsent(key, value, delegateKey) {
			self.put!(key, value)
		}
	}

	putDelegateToIfAbsent { :self :key :value :delegateKey :aFunction/0 |
		self.includesIndex(key).if {
			self.put!(key, value)
		} {
			self.atIfAbsent(key) {
				self.includesIndex(delegateKey).if {
					self[delegateKey].putDelegateToIfAbsent(
						key,
						value,
						delegateKey,
						aFunction/0
					)
				} {
					aFunction()
				}
			}
		}
	}

}
