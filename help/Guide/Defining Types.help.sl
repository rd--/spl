# Defining Types

_Types_ in Sᴘʟ are _records_ having a sequence of named _slots_ (also called _fields_).

Defining a type defines a number of associated methods.

A no argument _constructor_ is defined to make instances of the type, in which all fields are initialized to _nil_.
The constructor for type _T_ is named _newT:/0_.

An _initializeSlots:/k_ method is defined to set all fields of the type in the sequence they were defined.
_k_ (the arity of the initializer) is the number of fields that must be initialized plus one (the instance to be initialized).

A predicate methods is defined that answers if a value is of the type.
The predicate for type _T_ is named _isT:/1_.

_Reader_ and _writer_ methods are defined for the fields associated with the type.
These methods have the same names as the fields.
Reader methods have one argument, writer methods have two arguments.

The expression below adds a type for representing pitch as an _(octave, pitchClass)_ tuple, with a single method _asMidi_.
Note that methods are ordinary blocks and must declare their arguments.
In some contexts the convention of naming the receiver _self_ is followed.
Note also that slot access is mediated by the reader blocks, even for methods associated with the type.

```
OctPc : [Object] { | octave pitchClass |
	asMidi { :self |
		self.octave + 1 * 12 + self.pitchClass
	}
}

+@Number {
	OctPc { :oct :pc |
		newOctPc().initializeSlots(oct, pc)
	}
}
```

When this expression is evaluated the type and associated methods are added to the system.

The expression below constructs an _OctPc_ value and calls the _asMidi_ method.

```
SinOsc(OctPc(4, 9).asMidi.MidiCps, 0) * 0.1
```

_Rationale:_
The _constructor_ and _initializer_ are distinct because there is no rule for deciding what type or trait a combined block should be instantiated at.
In the model provided the _constructor_ is defined at _Void_ and the _initializer_ is defined at the new type.

* * *

Guides: Defining Methods, Syntax Guides
