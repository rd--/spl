(* Requires: PriorityQueue *)

Clock : [Object] { | priorityQueue nextEntryTime existingDelay |

	initialize { :self |
		self.initializeSlots(PriorityQueue(), nil, nil)
	}

	recurseEvery { :self :aBlock:/2 :anObject :delay |
		self.scheduleInjecting(0, anObject) { :currentTime :inputValue |
			| nextDelay = delay.value; |
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
			| nextDelay = delay.value; |
			nextDelay.ifNotNil {
				aBlock(currentTime, nextDelay);
				nextDelay
			}
		}
	}

	schedule { :self :deltaTime :aBlock:/1 |
		|(
			currentTime = system.systemTimeInSeconds,
			scheduledTime = currentTime + deltaTime,
			wakeupTime = self.nextEntryTime
		)|
		self.priorityQueue.push(aBlock:/1, scheduledTime);
		(wakeupTime = nil | {
			scheduledTime < wakeupTime
		}).ifTrue {
			self.nextEntryTime := scheduledTime;
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(scheduledTime)
			}.valueAfterMilliseconds(deltaTime * 1000)
		}
	}

	scheduleInjecting { :self :deltaTime :anObject :aBlock:/2 |
		self.schedule(deltaTime) { :currentTime |
			| reply = aBlock(currentTime, anObject); |
			reply.ifNotNil {
				self.scheduleInjecting(reply[1], reply[2], aBlock:/2)
			};
			nil
		}
	}

	wakeup { :self :scheduledTime |
		|(
			currentTime = system.systemTimeInSeconds,
			queue = self.priorityQueue,
			frontOfQueueTime = self.nextEntryTime
		)|
		{
			frontOfQueueTime ~= nil & {
				frontOfQueueTime <= currentTime
			}
		}.whileTrue {
			|(
				activityBlock:/1 = queue.pop,
				rescheduleAfter = activityBlock(scheduledTime)
			)|
			rescheduleAfter.ifNotNil {
				self.priorityQueue.push(activityBlock:/1, scheduledTime + rescheduleAfter)
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
			}.valueAfterMilliseconds(frontOfQueueTime - currentTime * 1000)
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
