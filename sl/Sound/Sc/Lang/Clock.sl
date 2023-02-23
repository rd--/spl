Clock : [Object] { | priorityQueue nextEntryTime existingDelay |

	clear { :self |
		self.priorityQueue.clearAndShrink;
		self.existingDelay.ifNotNil {
			self.existingDelay.cancel
		};
		self.nextEntryTime := nil;
		self.existingDelay := nil
	}

	collectTexture { :self :aCollection :aProcedure:/1 :delay |
		| end = aCollection.size; |
		self.recurseEvery({ :currentTime :index |
			{
				aProcedure(aCollection[index])
			}.play;
			(index = end).if {
				nil
			} {
				index + 1
			}
		}, 1, delay.value)
	}

	initialize { :self |
		self.initializeSlots(PriorityQueue(), nil, nil)
	}

	playEvery { :self :aProcedure:/1 :delay |
		self.repeatEvery({ :currentTime :nextDelay |
			{
				aProcedure(nextDelay)
			}.play
		}, delay)
	}

	recurseEvery { :self :aProcedure:/2 :anObject :delay |
		self.scheduleInjecting(0, anObject) { :currentTime :inputValue |
			| nextDelay = delay.value; |
			(inputValue.notNil & {
				nextDelay.notNil
			}).ifTrue {
				[nextDelay, aProcedure(currentTime, inputValue)]
			}
		}
	}

	repeatEvery { :self :aProcedure:/2 :delay |
		self.schedule(0) { :currentTime |
			| nextDelay = delay.value; |
			nextDelay.notNil.if {
				aProcedure(currentTime, nextDelay);
				nextDelay
			} {
				nil
			}
		}
	}

	schedule { :self :deltaTime :aProcedure:/1 |
		|
			currentTime = system.systemTimeInMilliseconds,
			scheduledTime = deltaTime * 1000 + currentTime,
			wakeupTime = self.nextEntryTime;
		|
		self.priorityQueue.push(aProcedure:/1, scheduledTime);
		(wakeupTime = nil | {
			scheduledTime < wakeupTime
		}).ifTrue {
			self.nextEntryTime := scheduledTime;
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(scheduledTime)
			}.evaluateAfterMilliseconds(deltaTime * 1000)
		}
	}

	scheduleInjecting { :self :deltaTime :anObject :aProcedure:/2 |
		self.schedule(deltaTime) { :currentTime |
			| reply = aProcedure(currentTime, anObject); |
			reply.ifNotNil {
				self.scheduleInjecting(reply[1], reply[2], aProcedure:/2)
			};
			nil
		}
	}

	wakeup { :self :scheduledTime |
		|
			currentTime = system.systemTimeInMilliseconds,
			queue = self.priorityQueue,
			front = self.nextEntryTime;
		|
		{
			front ~= nil & {
				front <= currentTime
			}
		}.whileTrue {
			|
				activityProcedure:/1 = queue.pop,
				rescheduleAfter = activityProcedure(scheduledTime);
			|
			rescheduleAfter.isNumber.ifTrue {
				self.priorityQueue.push(activityProcedure:/1, rescheduleAfter * 1000 + scheduledTime)
			};
			front := queue.peekPriority
		};
		self.nextEntryTime := front;
		front.ifNotNil {
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(front)
			}.evaluateAfterMilliseconds(front - currentTime)
		}
	}

}

+ Number {

	schedule { :self :aProcedure:/2 |
		workspace::clock.schedule(self, aProcedure:/2)
	}

	scheduleInjecting { :self :anObject :aProcedure:/2 |
		workspace::clock.scheduleInjecting(self, anObject, aProcedure:/2)
	}

}

+ Procedure {

	schedule { :self:/1 |
		workspace::clock.schedule(0, self:/1)
	}

	scheduleInjecting { :self:/2 :anObject |
		workspace::clock.scheduleInjecting(0, anObject, self:/2)
	}

}

+ Void {

	Clock {
		newClock().initialize
	}

}
