+Record {

	atDelegateToIfAbsent { :self :key :delegateKey :aBlock/0 |
		self.atIfAbsent(key) {
			self.includesIndex(delegateKey).if {
				self[delegateKey].atDelegateToIfAbsent(
					key,
					delegateKey,
					aBlock/0
				)
			} {
				aBlock()
			}
		}
	}

	atDelegateTo { :self :key :delegateKey |
		self.atDelegateToIfAbsent(key, delegateKey) {
			self.error('Record>>atDelegate: unknown key', [key])
		}
	}

	messageSend { :self :selector :delegateKey :argumentsList |
		let answer = self.atDelegateTo(selector, delegateKey);
		answer.isBlock.if {
			answer.apply([self] ++ argumentsList)
		} {
			answer
		}
	}

	putDelegateToIfAbsent { :self :key :value :delegateKey :aBlock/0 |
		self.includesIndex(key).if {
			self.put!(key, value)
		} {
			self.atIfAbsent(key) {
				self.includesIndex(delegateKey).if {
					self[delegateKey].putDelegateToIfAbsent(
						key,
						value,
						delegateKey,
						aBlock/0
					)
				} {
					aBlock()
				}
			}
		}
	}

	putDelegateTo { :self :key :value :delegateKey |
		self.putDelegateToIfAbsent(key, value, delegateKey) {
			self.put!(key, value)
		}
	}

}
