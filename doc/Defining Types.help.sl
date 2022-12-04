# Defining Types

_Types_ in _Spl_ are _records_ having a sequence of named _slots_.

Defining a type defines a number of associated methods.

A _constructor_ is defined to make instances of the type.
The constructor has arguments for each of the slots, in the sequence the slots were defined.

A predicate methods is defined that answers if a value is of the type.
The predicate for type _T_ is named _isT_.

_Reader_ and _writer_ methods are defined to read and write the slots associated with the type.
These methods have the same names as the slots.
Reader methods have one argument, writer methods have two arguments.

The expression below adds a type for representing pitch as an _(octave, pitchClass)_ tuple, with a single method _asMidi_.
Note that methods are ordinary procedures and must declare their arguments.
Note also that slot access is mediated by the reader procedures, even for methods associated with the type.

```
OctPc { | octave pitchClass |
	asMidi { :self |
		self.octave + 1 * 12 + self.pitchClass
	}
}
```

When this expression is evaluated the type and associated methods are added to the system.

The expression below constructs an _OctPc_ value and calls the _asMidi_ method.

```
SinOsc(OctPc(4, 9).asMidi.MidiCps, 0) * 0.1
```
