/* Requires: PriorityQueue */

Clock : [Object] { | priorityQueue nextEntryTime existingDelay |

	initialize { :self |
		self.initializeSlots(PriorityQueue(), nil, nil)
	}

	recurseEvery { :self :aBlock:/2 :anObject :delay |
		self.scheduleInjecting(0, anObject) { :currentTime :inputValue |
			let nextDelay = delay.value;
			(inputValue.notNil & {
				nextDelay.notNil
			}).ifTrue {
				[nextDelay, aBlock(currentTime, inputValue)]
			}
		}
	}

	removeAll { :self |
		self.priorityQueue.removeAllAndShrink;
		self.existingDelay.ifNotNil {
			self.existingDelay.cancel
		};
		self.nextEntryTime := nil;
		self.existingDelay := nil
	}

	repeatEvery { :self :aBlock:/2 :delay |
		self.schedule(0) { :currentTime |
			let nextDelay = delay.value;
			nextDelay.ifNotNil {
				aBlock(currentTime, nextDelay);
				nextDelay
			}
		}
	}

	schedule { :self :deltaTime :aBlock:/1 |
		let currentTime = system.sessionTime;
		let scheduledTime = currentTime + deltaTime;
		let wakeupTime = self.nextEntryTime;
		self.priorityQueue.pushWithPriority(aBlock:/1, scheduledTime);
		(wakeupTime = nil | {
			scheduledTime < wakeupTime
		}).ifTrue {
			self.nextEntryTime := scheduledTime;
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(scheduledTime)
			}.valueAfter(deltaTime)
		}
	}

	scheduleInjecting { :self :deltaTime :anObject :aBlock:/2 |
		self.schedule(deltaTime) { :currentTime |
			let reply = aBlock(currentTime, anObject);
			reply.ifNotNil {
				self.scheduleInjecting(reply[1], reply[2], aBlock:/2)
			};
			nil
		}
	}

	wakeup { :self :scheduledTime |
		let currentTime = system.sessionTime;
		let queue = self.priorityQueue;
		let frontOfQueueTime = self.nextEntryTime;
		{
			frontOfQueueTime != nil & {
				frontOfQueueTime <= currentTime
			}
		}.whileTrue {
			let activityBlock:/1 = queue.pop;
			let rescheduleAfter = activityBlock(scheduledTime);
			rescheduleAfter.ifNotNil {
				self.priorityQueue.pushWithPriority(
					activityBlock:/1,
					scheduledTime + rescheduleAfter
				)
			};
			frontOfQueueTime := queue.peekPriority
		};
		self.nextEntryTime := frontOfQueueTime;
		frontOfQueueTime.ifNotNil {
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(frontOfQueueTime)
			}.valueAfter(frontOfQueueTime - currentTime)
		}
	}

}

+Void {

	Clock {
		newClock().initialize
	}

}

+@Cache {

	clock { :self |
		self.cached('clock') {
			Clock()
		}
	}

}

+SmallFloat {

	schedule { :self :aBlock:/2 |
		system.clock.schedule(self, aBlock:/2)
	}

	scheduleInjecting { :self :anObject :aBlock:/2 |
		system.clock.scheduleInjecting(self, anObject, aBlock:/2)
	}

}

+Block {

	schedule { :self:/1 |
		system.clock.schedule(0, self:/1)
	}

	scheduleInjecting { :self:/2 :anObject |
		system.clock.scheduleInjecting(0, anObject, self:/2)
	}

}
