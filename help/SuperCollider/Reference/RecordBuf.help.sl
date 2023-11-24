# RecordBuf -- recording

Records input into a Buffer.

If recLevel is 1 and preLevel is 0 then the new input overwrites the old data.
If they are both 1 then the new data is added to the existing data.
(Any other settings are also valid.)

Note:
The number of channels is fixed,
it cannot vary depending on which buffer you use.

_RecordBuf(bufnum=0, offset=0, recLevel=1, preLevel=0, run=1, loop=1, trigger=1, doneAction=0, inputArray)_

- inputArray: An Array of input channels.
- bufnum: The index of the buffer to use.
- offset: An offset into the buffer in samples.
- recLevel: Value to multiply by input before mixing with existing data.
- preLevel: Value to multiply to existing data in buffer before mixing with input.
- run: If zero, then recording stops, otherwise recording proceeds.
- loop: If 1 then loop, otherwise do not. This is modulatable.
- trigger: a trigger causes a jump to the start of the Buffer. A trigger occurs when a signal changes from negative value to positive value.
- doneAction: an integer representing an action to be executed when the buffer is finished recording.
