# Smalltalk J20 Definitions

Relevant extracts from the J20 draft for the
[Ansi Smalltalk](https://wiki.squeak.org/squeak/172) Standard
([Pdf](https://wiki.squeak.org/squeak/uploads/172/standard_v1_9-indexed.pdf)).

The _Cf:_ entries point to _Spl_ help files, which in turn reference the section number.

# 5.3 Fundamental Protocols

This section includes protocols that are fundamental to the Smalltalk
language.

## 5.3.1

_Protocol_: ⧼Object⧽

_Description_: This protocol describe the behavior that is common to
all objects.

Cf: Object

### 5.3.1.1

_Message_: = comparand

_Synopsis_: Object equivalence test.

_Definition_: This message tests whether the receiver and the
comparand are equivalent objects at the time the message is
processed. Return true if the receiver is equivalent to
comparand. Otherwise return false. The meaning of "equivalent" cannot
be precisely defined but the intent is that two objects are considered
equivalent if they can be used interchangeably. Conforming protocols
may choose to more precisely define the meaning of "equivalent".  The
value of `receiver = comparand` is true if and only if the value of
`comparand = receiver` would also be true.  The equivalence of objects
need not be temporally invariant. Two independent invocations of `=`
with the same receiver and operand objects may not always yield the
same results.

_Return Value_: ⧼boolean⧽

_Rationale_: Note that object equality is not explicitly defined as
being the same as object identity. That is probably the only
reasonable implementation in Object but not specifying it allows this
protocol to be used without refinement by other classes with more
precise definitions of equivalence

Cf: =

### 5.3.1.2

_Message_: == comparand

_Synopsis_: Object identity test.

_Definition_: This message tests whether the receiver and the
comparand are the same object. Return true if the receiver is the same
object as comparand. Otherwise return false.  The value of `receiver
== comparand` is true if and only if the value of `comparand ==
receiver` would also be true.

_Return Value_: ⧼boolean⧽

Cf: ==

### 5.3.1.3

_Message_: ~= comparand

_Synopsis_: Object inequality test.

_Definition_: This message tests whether the receiver and the
comparand are not equivalent objects at the time the message is
processed. Return true if the receiver is not equivalent to
comparand. Otherwise return false.  The meaning of "equivalent" cannot
be precisely defined but the intent is that two objects are considered
equivalent if they can be used interchangeably. Conforming protocols
may choose to more precisely define the meaning of "equivalent".  The
result must be equivalent to the Boolean negation of the result of
sending the message `=` to the receiver with comparand as the
argument.  The value of `receiver ~= comparand` is true if and only if
the value of `comparand ~= receiver` would also be true.

_Return Value_: ⧼boolean⧽

_Rationale_: This definition does not require that the implementation
be `^(self = comparand) not` but it does require that within a class,
the same definition of equivalence is used in the implementation of
both `=` and `~=`.

Cf: ~=

### 5.3.1.4

_Message_: ~~ comparand

_Synopsis_: Negated object identity test.

_Definition_: This message tests whether the receiver and the
comparand are different objects. Return true if the receiver is not
the same object as comparand. Otherwise return false.  The result must
be equivalent to the Boolean negation of the result of sending the
message `==` to the receiver with comparand as the argument.  The
value of `receiver ~~ comparand` is true if and only if the value of
`comparand ~~ receiver` would also be true.

_Return Value_: ⧼boolean⧽

_Rationale_: This definition does not require that the implementation
be `^(self == comparand) not` but it does require that the same
definition of object identity is used in the implementation of both
`==` and `~~`.

Cf: ~~

### 5.3.1.6

_Message_: copy

_Synopsis_: Return a copy of the receiver.

_Definition_: Return a new object that must be as similar as possible
to the receiver in its initial state and behavior. Any operation that
changes the state of the new object should not as a side-effect change
the state or behavior of the receiver. Similarly, any change to the
receiver should not as a side-effect change the new object.  If the
receiver is an identity object, return the receiver.

_Rationale_: An argument can be made that the receiver and the result
should respond true to an `=` test. However, the traditional
definition of Object `=` in terms of `==` is incompatible with this
requirement.

Cf: copy

### 5.3.1.8

_Message_: error: signalerText

_Synopsis_: Announce an error

_Definition_: This message is used the announce the occurrence of some
type of error condition. The argument should describe the nature of
the error. The default behavior is to raise an Error exception as if
the message `signal:` had been sent to the global Error with
signalerText as the argument.  Conforming protocols may refine this
message to perform some action other than signaling the exception.

Cf: error

### 5.3.1.11

_Message_: isKindOf: candidateClass

_Synopsis_: Classify an object.

_Definition_: Return true if the receiver is an instance of
candidateClass or is an instance of a general subclass of
candidateClass. Otherwise return false.  The return value is
unspecified if the receiver is a class object or candidateClass is not
a class object.

_Return Value_: ⧼boolean⧽

### 5.3.1.12

_Message_: isMemberOf: candidateClass

_Synopsis_: Determine whether the receiver is an instance of the argument.

_Definition_: Return true if the receiver is an instance of
candidateClass. Otherwise return false.  The return value is
unspecified if the receiver is a class object or candidateClass is not
a class object.

_Return Value_: ⧼boolean⧽

### 5.3.1.13

_Message_: isNil

_Synopsis_: Determine if the receiver is the value of the reserved
identifier nil.

_Definition_: Determine if the receiver is the same object as the
value of the reserved identifier nil. Return true if it is, false if
it is not.  The messages `isNil` and `notNil` must be implemented to
produce consistent results. For a given receiver if the result of
`isNil` is true then the result of `notNil` must be false.

_Return Value_: ⧼boolean⧽

Cf: isNil

### 5.3.1.14

_Message_: notNil

_Synopsis_: Determine if the receiver is not the value of the reserved
identifier nil.

_Definition_: Determine if the receiver is the same object as the
value of the reserved identifier nil. Return false if it is, true if
it is not.  The messages `isNil` and `notNil` must be implemented to
produce consistent results. For a given receiver if the result of
`isNil` is true then the result of `notNil` must be false.

_Return Value_: ⧼boolean⧽

Cf: notNil

### 5.3.1.16

_Message_: perform: selector withArguments: arguments

_Synopsis_: Send a message using a computed message selector and a collection of arguments.

_Definition_: Send to the receiver a message whose selector is
selector and whose arguments are the elements of arguments. Return the
value of that message. The first element of arguments is the first
argument, the second element is the second argument, and so on.  If
the receiver does not have a method for the selector normal "message
not understood" processing is performed as if the computed message
hand been sent using a message send expression. If this occurs,
selector and arguments could be captured.

The perform messages and `respondsTo:` must be implemented to produce
consistent results. A message to perform a selector, selector, for a
given receiver will result in a "message not understood" condition if
and only if the value of `receiver respondsTo: selector` is false.
Behavior is undefined if the number of elements in arguments does not
match that implicitly required by the syntactic form of the selector.

Cf: apply

### 5.3.1.18

_Message_: printString

_Synopsis_: Return a string that describes the receiver.

_Definition_: A string consisting of a sequence of characters that
describe the receiver are returned as the result.  The exact sequence
of characters that describe an object are implementation defined.

_Return Value_:⧼string⧽

Cf: printString

### 5.3.1.19

_Message_: respondsTo: selector

_Synopsis_: Determine if the receiver can respond to a specific
message selector.

_Definition_: Return true if the receiver has a method in its behavior
that has the message selector selector.  Otherwise return false.

_Return Value_: ⧼boolean⧽

_Rationale_: Requiring this message should not significantly encumber
implementations because that data structures and algorithms necessary
to implement it at run time are essentially the same that are required
to implement normal message lookup processing.

Cf: respondsTo

### 5.3.1.20

_Message_: yourself

_Synopsis_: No operation. Return the receiver as the result.

_Definition_: Return the receiver of the message.

_Return Value_: ⧼receiver⧽

Cf: identity

## 5.3.2

_Protocol_: ⧼nil⧽

_Description_: This protocol describes the behavior that is unique to
the distinguished immutable, identity object that is the value of the
reserved identifier "nil".

Cf: Nil

## 5.3.3

_Protocol_: ⧼boolean⧽

_Description_: This protocol describes the behavior of the objects
that are the values of the reserved identifiers "true" and
"false". These objects are identity objects.  Several message specifications
include a truth table describing the result of the binary operation
implemented by that message. In each table, the value of the receiver is
used to locate a row and the value of the argument is used to locate a
column, the result being located at the intersection of the row and column.

Cf: Boolean

### 5.3.3.1

_Message_: & operand

_Synopsis_: Logical and — Boolean conjunction.

_Definition_: Return the Boolean conjunction of the receiver and
operand. The value returned is determined by the following truth
table:

	& true false
	true true false
	false false false

_Parameters_: operand ⧼boolean⧽

_Return Value_: ⧼boolean⧽

Cf: &&

### 5.3.3.2

_Message_: | operand

_Synopsis_: Logical or — Boolean disjunction.

_Definition_: Return the Boolean disjunction of the receiver and
operand. The value returned is determined by the following truth
table:

	| true false
	true true true
	false true false

_Parameters_: operand ⧼boolean⧽

_Return Value_: ⧼boolean⧽

Cf: ||

### 5.3.3.3

_Message_: and: operand

_Synopsis_: "Short circuit" logical and.

_Definition_: If the receiver is false, return false. Otherwise, return the ⧼boolean⧽
result of sending the message `value` to operand.  The result is undefined if
the result of sending `value` to operand is not a ⧼boolean⧽.

_Rationale_: Some existing implementations do not require that the
operand must evaluate to a ⧼boolean⧽. The message `ifTrue:` should
be used to conditionally evaluate a block that does not return a ⧼boolean⧽.

_Parameters_: operand ⧼boolean⧽

_Return Value_: ⧼boolean⧽

Cf: &

### 5.3.3.4

_Message_: eqv: operand

_Synopsis_: Boolean equivalence.

_Definition_: Return the Boolean disjunction of the receiver and
operand. The value returned is determined by the following truth
table:

	eqv: true false
	true true false
	false false true

_Parameters_: operand ⧼boolean⧽

_Return Value_: ⧼boolean⧽

Cf: =

### 5.3.3.5

_Message_: ifFalse: operand

_Synopsis_: Evaluate the argument if receiver is false.

_Definition_: If the receiver is false return the result of sending the message
`value` to operand.  The return value is unspecified if the receiver is true.

_Rationale_: Most existing implementations define the return value to be
nil if the receiver is true. This definition is less precise and
potentially allows for implementation specific optimization.

_Parameters_: operand ⧼niladic Block⧽

Cf: ifFalse

### 5.3.3.6

_Message_: ifFalse: falseOperand ifTrue: trueOperand

_Synopsis_: Selectively evaluate one of the arguments.

_Definition_: If the receiver is false return the result return the result as if the
message `value` was sent to falseOperand, otherwise return the result as if
the message `value` was sent to trueOperand.

_Parameters_: falseOperand ⧼niladic Block⧽
trueOperand ⧼niladic Block⧽

Cf: ifFalseIfTrue

### 5.3.3.7

_Message_: ifTrue: operand

_Synopsis_: Evaluate the argument if the receiver is true.

_Definition_: If the receiver is true, return the result of sending the
message `value` to operand.  The return value is unspecified if the
receiver is false.

_Rationale_: Most existing implementations define the return value to be
nil if the receiver is false. This definition is less precise and
potentially allows for implementation specific optimization.

_Parameters_: operand ⧼niladic Block⧽

Cf: ifTrue

### 5.3.3.8

_Message_: ifTrue: trueOperand ifFalse: falseOperand

_Synopsis_: Selectively evaluate one of the arguments.

_Definition_: If the receiver is true return the result of sending the message
`value` to trueOperand, otherwise return the result of sending `value` to
the falseOperand.

_Parameters_: trueOperand ⧼niladic Block⧽
falseOperand ⧼niladic Block⧽

Cf: if

### 5.3.3.9

_Message_: not

_Synopsis_: Logical not — Boolean negation.

_Definition_: Return the Boolean negation of the receiver.  If the
receiver is true the return value is false, if the receiver is false the return value is true.

_Return Value_: ⧼boolean⧽

Cf: not

### 5.3.3.10

_Message_: or: operand

_Synopsis_: "Short circuit" logical or.

_Definition_: If the receiver is true, return true. Otherwise, return the Boolean
result of sending the message `value` to operand.  The result is undefined if
the result of sending `value` to operand is not a ⧼boolean⧽.

_Rationale_: Some existing implementations do not require that the
operand must evaluate to a ⧼boolean⧽. The message `ifFalse:` should
be used to conditionally evaluate a block that does not return a Boolean.

_Parameters_: operand ⧼niladicValuable⧽

_Return Value_: ⧼boolean⧽

Cf: |

### 5.3.3.12

_Message_: xor: operand

_Synopsis_: Boolean exclusive or.

_Definition_: Return the Boolean exclusive or of the receiver and
operand. The value returned is determined by the following truth
table:

	xor: true false
	true false true
	false true false

_Parameters_: operand ⧼boolean⧽

_Return Value_: ⧼boolean⧽

Cf: xor

## 5.3.4

_Protocol_: ⧼character⧽

_Description_: This protocol describes the behavior that is common to
character objects. Character objects serve as the element value for
Smalltalk strings. The Smalltalk language provides a literal syntax
for character objects. Character objects represent individual elements
of an implementation defined execution character set whose individual
elements are identified by integer values. These integers are called
code points. Each character object has an associated code point.  It
is unspecified whether or not each code point is uniquely associated with a
unique character object.  The execution character set is the character set
used by an implementation during execution of a Smalltalk program. It
need not be the same as the character set used by that implementation to
encode the definition of Smalltalk programs.

Cf: Character

### 5.3.4.2

_Message_: asLowercase

_Synopsis_: Return a character which is equivalent to the lowercase
representation of the receiver.

_Definition_: If the receiver is equal to the value of a character
literal in the "receiver" row of the following table, the result
object must be equal to the value of the corresponding character
literal in the "result" row.

	receiver $A $B $C $D $E $F $G $H $I $J $K $L $M $N $O $P $Q $R $S $T $U $V $W $X $Y $Z
	result $a $b $c $d $e $f $g $h $i $j $k $l $m $n $o $p $q $r $s $t $u $v $w $x $y $z

An implemention may define other `asLowercase` mappings. If the
receiver does not correspond to a character in the "receiver" row of the
table and does not have an implementation defined mapping the receiver is
returned as the result.

_Return Value_: ⧼character⧽

Cf: asLowerCase

### 5.3.4.3

_Message_: asString

_Synopsis_: Return a new string whose sole element is equivalent to
the receiver.

_Definition_: Return a new string of size one (1) whose sole element
is equivalent to the receiver. The new string is created using the
same constraints as defined by the `new:` message defined in ⧼String
factory⧽.  It is unspecified whether the resulting string captures a
reference to the receiver.

_Return Value_: ⧼string⧽

Cf: asString

### 5.3.4.4

_Message_: asUppercase

_Synopsis_: Return a character equivalent to the uppercase
representation of the receiver.

_Definition_: If the receiver is equal to the value of a character
literal in the "receiver" row of the following table, the result
object must be equal to the value of the corresponding character
literal in the "result" row.

	receiver $a $b $c $d $e $f $g $h $i $j $k $l $m $n $o $p $q $r $s $t $u $v $w $x $y $z
	result $A $B $C $D $E $F $G $H $I $J $K $L $M $N $O $P $Q $R $S $T $U $V $W $X $Y $Z

An implemention may define other `asUppercase` mappings. If the
receiver does not correspond to a character in the "receiver" row of the
table and does not have an implementation defined mapping the receiver is
returned as the result.

_Return Value_: ⧼character⧽

Cf: asUpperCase

### 5.3.4.5

_Message_: codePoint

_Synopsis_: Return the encoding value of the receiver.

_Definition_: Return the encoding value of the receiver in the
implementation defined execution character set.  The following
invariant must hold:

	(charFactory codePoint: x) codePoint = x

where charFactory is an object that implements ⧼Character factory⧽ and
x is an ⧼integer⧽.

_Return Value_: ⧼integer⧽

Cf: codePoint

### 5.3.4.6

_Message_: isAlphaNumeric

_Synopsis_: Test whether the receiver is a letter or digit.

_Definition_: Return true if the receiver is either a letter or
digit. Otherwise return false. In other words `character isAlphaNumeric` is true
if and only if either `character isLetter` is true or `character isDigit` is
true.

_Return Value_: ⧼boolean⧽

Cf: isAlphaNumeric

### 5.3.4.7

_Message_: isDigit

_Synopsis_: Test whether the receiver is a digit.

_Definition_: Return true if the receiver represents a digit. Otherwise return
false. The receiver is a digit if it is equal to the value of one of the
following character literals: $0 $1 $2 $3 $4 $5 $6 $7 $8 $9

_Return Value_: ⧼boolean⧽

Cf: isDigit

### 5.3.4.8

_Message_: isLetter

_Synopsis_: Test whether the receiver is a letter.

_Definition_: Return true if the receiver corresponds to an alphabetic
character, ignoring case. Otherwise return false. The receiver is an alphabetic
character if it is equal to the value of one of the following
character literals:

	$A $B $C $D $E $F $G $H $I $J $K $L $M
	$N $O $P $Q $R $S $T $U $V $W $X $Y $Z
	$a $b $c $d $e $f $g $h $i $j $k $l $m
	$n $o $p $q $r $s $t $u $v $w $x $y $z

Implementations may define other characters to be alphabetic
characters. Any such characters will return true when set this message.

_Return Value_: ⧼boolean⧽

Cf: isLetter

### 5.3.4.9

_Message_: isLowercase

_Synopsis_: Test whether the receiver is a lowercase letter.

_Definition_: Return true if the receiver corresponds to a lowercase
letter. Otherwise return false. The receiver is an lowercase letter if it is
equal to the value of one of the following character literals:

	$a $b $c $d $e $f $g $h $i $j $k $l $m
	$n $o $p $q $r $s $t $u $v $w $x $y $z

Implementations may define other characters to be lowercase
characters. Any such characters will return true when set this message.

_Return Value_: ⧼boolean⧽

### 5.3.4.10

_Message_: isUppercase

_Synopsis_: Test whether the receiver is an uppercase letter.

_Definition_: Return true if the receiver corresponds to a uppercase
letter. Otherwise return false. The receiver is an uppercase letter if it is
equal to the value of one of the following character literals:

	$A $B $C $D $E $F $G $H $I $J $K $L $M
	$N $O $P $Q $R $S $T $U $V $W $X $Y $Z

Implementations may define other characters to be lowercase
characters. Any such characters will return true when set this message.

_Return Value_: ⧼boolean⧽

Cf: isUpperCase

## 5.3.5

_Protocol_: ⧼Character factory⧽

_Description_:
This protocol describes the behavior for accessing character objects.

### 5.3.5.1

_Message_: codePoint: integer

_Synopsis_: Return a character whose encoding value is integer.

_Definition_: Return a character whose encoding value in the
implementation defined execution character set is integer.  The result
is undefined if the encoding value is not a valid encoding value in the
implementation defined character set.

_Parameters_: integer ⧼integer⧽

_Return Value_: ⧼character⧽

Cf: asCharacter

## 5.3.6

_Protocol:_ ⧼failedMessage⧽

_Description_: This protocol describes the behavior of objects that
represent a message that was sent to an object, but was not understood
by that object.

### 5.3.6.1

_Message_: arguments

_Synopsis_: Answer the arguments of the message that could not be sent.

_Definition_: Return a collection containing the arguments of the
message that could not be sent. The elements of the collection are
ordered, from the first element to the last element, in the same order as
the arguments of the message, from left to right. If the message had
no arguments, the collection will be empty.

_Return Value_: ⧼sequence⧽

### 5.3.6.2

_Message_: selector

_Synopsis_: Answer the selector of the message that could not be sent.

_Definition_:
Answer the selector of the message that could not be sent.

_Return Value_: ⧼selector⧽

## 5.3.7

_Protocol:_ ⧼selector⧽

_Description_: Defines the protocol supported by literal message
selectors. No behavior is defined by this protocols but objects that
conform to is can be used to perform dynamically generated message
sends using ⧼Object⧽ `perform:` and related messages.

## 5.3.8

_Protocol_: ⧼classDescription⧽

_Description_: This protocol describes the behavior of class
objects. It provides messages for identifying and locating class objects
within the class hierarchy.

_Rationale_: There are a wide variety of messages that various
implementations provide for class objects. Most of them have been
excluded from this definition because they are primarily oriented
towards supporting a self-hosted development environment, and are not
generally useful in non-reflective applications.

### 5.3.8.1

_Message_: allSubclasses

_Synopsis_: Return all subclasses of a class.

_Definition_: If the receiver is a class object, return a collection
containing all of the class objects whose class definitions inherit
either directly or indirectly from the class definition of the
receiver.  If the receiver is not a class object, the result is
unspecified.  Each element of the result collection supports the
protocol ⧼classDescription⧽. The order of class objects within the
collection is unspecified.  ⧼collection⧽

### 5.3.8.2

_Message_: allSuperclasses

_Synopsis_: Return all superclasses of a class.

_Definition_: If the receiver is a class object, return a collection
containing all of the class objects defined by the class definitions
from which the class definition of the receiver inherits, either
directly or indirectly. If the class definition of the receiver has no
superclasses, return an empty collection.  If the receiver is not a class
object, the result is unspecified.  Each element of the result
collection supports the protocol ⧼classDescription⧽. The order of
class objects within the collection is unspecified.

_Return Value_:
⧼collection⧽

### 5.3.8.3

_Message_: name

_Synopsis_: Return the name of a class.

_Definition_: Return a string containing the global name of the
receiver. The global name of a class object is the global identifier
that is bound to the class object.

_Rationale_: Some existing implementations may return a symbol as the
result of this message. The specification of the return value should be
whatever protocol is general enough to be either a string or a symbol.

_Return Value_:⧼string⧽

### 5.3.8.4

_Message_: subclasses

_Synopsis_: Return direct subclasses of a class.

_Definition_: If the receiver is a class object, return a collection
containing all of the class objects whose class definitions inherit
directly from the class definition of the receiver. If there are no
class definitions that inherit from the class definition of the
receiver, return an empty collection.  If the receiver is not a class object,
the result is unspecified.  Each element of the result collection
supports the protocol ⧼classDescription⧽. The order of class objects
within the collection is unspecified.

_Return Value_:
⧼collection⧽

### 5.3.8.5

_Message_: superclass

_Synopsis_: Return the immediate superclass of a class.

_Definition_: If the receiver is a class object, return the class objects
defined by the class definitions from which the class definition of
the receiver directly inherits. If the class definition of the
receiver has no superclasses, return nil.  If the receiver is not a class
object, the result is unspecified.

_Return Value_: ⧼class description⧽

## 5.3.9

_Protocol_: ⧼instantiator⧽

_Description_: This protocol defines the behavior of objects that can
be used to create other objects without requiring any additional
information.

### 5.3.9.1

_Message_: new

_Synopsis_: Create a new object.

_Definition_: Return a newly created object initialized to a standard
initial state.

Cf: new

## 5.3.10

_Protocol:_ `ObjectClass`

_Conforms To_: ⧼classDescription⧽, ⧼instantiator⧽

_Description_: This protocol describes the behavior the class object
whose global identifier is 'Object', which is the traditional root of
the class hierarchy.  This class must be implemented in such a way
that it is not fragile. A class is said to be fragile if it is
implemented in such a way that subclasses of that class can change the
behavior of any standard-specified method without overriding the
implementation of those methods. This can happen when a method is
implemented to use an auxiliary method that is not specified in the
standard, which the subclass then (possibly unintentionally)
overrides. The inherited method will then invoke the subclass’
implementation of the auxiliary method rather than the expected
implementation in the superclass.  One way to ensure that the
implementation of a class is not fragile is to ensure that any message
sent to self is either part of the specified behavior for that class or
has a selector that begins with an underscore. Alternatively, an
implementation may use implementation-specific means to implement
these methods in a way that makes them non-fragile.

# 5.4 Valuable Protocols

This section includes protocols that describe objects that can be evaluated
using variants of the `value` message. The only concrete case of such
objects specified by the standard are blocks.  However, protocols that
specify valuable protocols as parameters are defined to accept any
class of object conforming to the specified protocol.

## 5.4.1

_Protocol_: ⧼valuable⧽

_Description_: This protocol describes the behavior for objects that
can be evaluated using variants of the `value` message.

### 5.4.1.1

_Message_: argumentCount

_Synopsis_: Answers the number of arguments needed to evaluate the
receiver.

_Definition_:
The number of arguments needed to evaluate the receiver is returned.

_Return Value_: ⧼integer⧽

Cf: numArgs

### 5.4.1.2

_Message_: valueWithArguments: argumentArray

_Synopsis_: Answers the value of the receiver when applied to the
arguments in argumentArray.

_Definition_: The receiver is evaluated as defined by the receiver.
Note that in the case that the receiver is a block, that the
evaluation is defined by the language with the elements of
argumentArray bound in sequence to the receiver’s arguments.  The
result is as defined by the receiver.  The results are undefined if
the size of argumentArray does not equal the receiver’s argument
count.

_Parameters_: argumentArray ⧼sequencedReadableCollection⧽

## 5.4.2

_Protocol_: ⧼niladicValuable⧽

_Conforms To_: ⧼valuable⧽

_Description_: This protocol describes the behavior for objects
supporting the `value` selector.

### 5.4.2.2

_Message_: value

_Synopsis_: Answers the value of the receiver.

_Definition_:
The receiver is evaluated as defined by the receiver.
The result is as defined by the receiver.

Cf: value

### 5.4.2.3

_Message_: whileFalse

_Synopsis_: Evaluates the receiver until it evaluates to true.

_Definition_: The receiver is evaluated as defined by the receiver.
Note that in the case that the receiver is a block, the evaluation is
defined by the language.  If this evaluation results in false the process
repeats.  If and when the evaluation of the receiver results in true, the
method terminates.  The results are undefined if the receiver is not a block
which evaluates to a Boolean value.

Cf: whileFalse

### 5.4.2.4

_Message_: whileFalse: iterationBlock

_Synopsis_: Evaluates iterationBlock zero or more times until the
receiver evaluates to true.

_Definition_: The receiver is evaluated as defined by the receiver.
Note that in the case that the receiver is a block, that the
evaluation is defined by the language.  If this evaluation results in
false, the argument is evaluated and the process repeats.  If and when the
evaluation of the receiver results in true, the method terminates.  The
results are undefined if the receiver is not a block which evaluates to a
Boolean value.

_Parameters_: iterationBlock ⧼niladicValuable⧽

Cf: whileFalse

### 5.4.2.5

_Message_: whileTrue

_Synopsis_: Evaluates the receiver until it evaluates to false.

_Definition_: The receiver is evaluated as defined by the receiver.
Note that in the case that the receiver is a block, that the
evaluation is defined by the language.  If this evaluation results in
true the process repeats.  If and when the evaluation of the receiver
results in false, the method terminates.  The results are undefined if the
receiver is not a block which evaluates to a Boolean value.

Cf: whileTrue

### 5.4.2.6

_Message_: whileTrue: iterationBlock

_Synopsis_: Evaluates iterationBlock zero or more times until the
receiver evaluates to false.

_Definition_: The receiver is evaluated as defined by the receiver.
Note that in the case that the receiver is a block, that the
evaluation is defined by the language.  If this evaluation results in
true, the argument is evaluated and the process repeats.  If and when the
evaluation of the receiver results in false, the method terminates.  The
results are undefined if the receiver is not a block which evaluates to a
Boolean value.

_Parameters_: iterationBlock ⧼niladicValuable⧽

Cf: whileTrue

## 5.4.3

_Protocol_: ⧼niladic Block⧽

_Conforms To_: ⧼niladicValuable⧽

_Description_: This protocol describes the behavior for blocks with no
arguments.  Objects conforming to this protocol can be created only by
the block constructor construct of the Smalltalk language.

Cf: Block

### 5.4.3.1

_Message_: ensure: terminationBlock

_Synopsis_: Evaluate a termination block after evaluating the receiver.

_Definition_: Evaluate the receiver and return its result. Immediately after
successful evaluation of the receiver but before returning its result,
evaluate terminationBlock. If abnormal termination of the receiver
occurs, terminationBlock is evaluated. In either case, the value
returned from the evaluation of terminationBlock is discarded.
Activation of an exception handler from within the receiver is not in and
of itself an abnormal termination. However, if the exception handler
for an exception that is not resumable results in termination of the
receiver or if its handler block contains a return statement that results in
abnormal termination of the receiver, then terminationBlock will be
evaluated after evaluation of the exception handler.  If an abnormal
termination results in the termination of multiple blocks which were
evaluated using either `ensure:` or `ifCurtailed:` the respective
terminationBlocks will be executed in the reverse of the order in
which the corresponding receiver blocks were evaluated.

_Parameters_: terminationBlock ⧼niladic Block⧽

Cf: ensure

### 5.4.3.2

_Message_: ifCurtailed: terminationBlock

_Synopsis_: Evaluating the receiver with an abnormal termination action.

_Definition_: Evaluate the receiver and return its result. If abnormal
termination of the receiver occurs, terminationBlock is evaluated. The
value returned from the evaluation of terminationBlock is discarded.
Activation of an exception handler from within the receiver is not in and
of itself an abnormal termination. However, if the exception handler
for an exception that is not resumable results in termination of the
receiver or if its handler block contains a return statement that results in
abnormal termination of the receiver, then terminationBlock will be
evaluated after evaluation of the exception handler.  If an abnormal
termination result in the termination of multiple blocks which were
evaluated using either `ensure:` or `ifCurtailed:` the respective
terminationBlocks will be executed in the reverse of the order in
which the corresponding receiver blocks were evaluated.

_Parameters_: terminationBlock ⧼niladic Block⧽

Cf: ifError

### 5.4.3.3

_Message_: on: selector do: action

_Synopsis_: Evaluate the receiver in the scope of an exception handler.

_Definition_: The receiver is evaluated such that if during its
evaluation an exception corresponding to selector is signaled then
action will be evaluated. The result of evaluating the receiver is
returned.

Before evaluating the receiver the current state of the exception
environment is captured as the handler environment. Then a new
exception handler is created with selector as its exception selector and
action as its handler block. The new handler is pushed onto the
exception environment.  If evaluation of the receiver terminates
normally then the exception environment is reset to the handler
environment before returning to the sender of the `on:do:` message.
If signaling of an exception results in evaluation of action the
evaluation will occur in the context of the handler environment. The
argument to the action will be an object that conforms to the protocol
⧼signaledException⧽.

_Parameters_: selector ⧼exceptionSelector⧽
action ⧼monadicBlock⧽

# 5.4.4

_Protocol_: ⧼monadicValuable⧽

_Conforms To_: ⧼valuable⧽

_Description_: This protocol describes the behavior for objects
supporting the value: selector.

### 5.4.4.2

_Message_: value: argument

_Synopsis_: Answers the value of the receiver when applied to the
argument.

_Definition_: The receiver is evaluated as defined by the receiver.
Note that in the case that the receiver is a block, that the
evaluation is defined by the language with argument bound to the
block’s only argument.  The result is as defined by the receiver.

Cf: value

# 5.4.5

_Protocol_: ⧼monadicBlock⧽

_Conforms To_: ⧼monadicValuable⧽

_Description_: This protocol describes the behavior for blocks with
one argument.  Objects conforming to this protocol can be created only
by the block constructor construct of the Smalltalk language.

Cf: Block

# 5.4.6

_Protocol:_ ⧼dyadicValuable⧽

_Conforms To_: ⧼valuable⧽

_Description_: This protocol describes the behavior for objects
supporting the `value:value:` selector.

### 5.4.6.2

_Message_: value: argument1 value: argument2

_Synopsis_: Answers the value of the receiver when applied to the
arguments.

_Definition_: The receiver is evaluated as defined by the receiver.
Note that in the case that the receiver is a block, that the
evaluation is defined by the language with argument1 bound to the
block’s first argument, and argument2 bound to the block’s second argument.  The
result is as defined by the receiver.

Cf: value

# 5.5 Exception Protocols

This section includes the protocols that define the behavior of the exception
handling system.

## 5.5.1

_Protocol:_ ⧼exceptionDescription⧽

_Description_: This protocol describe the messages that may be used to
obtain information about an occurrence of an exception.

### 5.5.1.1

_Message_: defaultAction

_Synopsis_: The default action taken if the exception is signaled.

_Definition_: If the exception described by the receiver is signaled and
the current exception environment does not contain a handler for the
exception this method will be executed.  The exact behavior and result
of this method is implementation defined.

### 5.5.1.2

_Message_: description

_Synopsis_: Return a textual description of the exception.

_Definition_: Return text that describes in a human readable form an
occurrence of an exception. If an explicit message text was provided
by the signaler of the exception, that text should be incorporated
into the description.

Cf: description

### 5.5.1.4

_Message_: messageText

_Synopsis_: Return an exception’s message text.

_Definition_: Return the signaler message text of the receiver. If the
signaler has not provided any message text, return nil.

_Return Value_:⧼string⧽

Cf: messageText

### 5.5.1.5

_Message_: tag

_Synopsis_: Return an exception’s tag value.

_Definition_: Return the tag value provided by the signaler of the
receiver. If the signaler has not provided a tag value, return the same value
was would be returned as if `messageText` was sent to the receiver of
this message. If the signaler has provided neither a tag value nor a
message text, return nil.  Exception tags are intended for use in
situations where a particular occurrence of an exception needs to be
identified and a textual description is not appropriate. For example, the
message text might vary according to the locale and thus could not be used
to identify the exception.

Cf: name

# 5.5.2

_Protocol:_ ⧼exceptionSignaler⧽

_Description_: This protocol describes the behavior of signaling an
exceptional condition, locating an exception handler, and executing an
exception action.

### 5.5.2.1

_Message_: signal

_Synopsis_: Signal the occurrence of an exceptional condition.

_Definition_: Associated with the receiver is an
⧼exceptionDescription⧽ called the signaled exception. The current
exception environment is searched for an exception handler whose
exception selector matches the signaled exception. The search proceeds
from the most recently created exception handler to the oldest
exception handler.  A matching handler is defined to be one which
would return true if the message `handles:` was sent to its exception selector
with the signaled exception as the argument.  If a matching handler is
found, the exception action of the handler is evaluated in the
exception environment that was current when the handler was created and
the state of the current exception environment is preserved as the
signaling environment.  The exception action is evaluated as if the
message `value:` were sent to it with a ⧼signaledException⧽ passed
as its argument. The ⧼signaledException⧽ is derived from the
signaled exception in an implementation dependent manner.  If the
evaluation of the exception action returns normally (as if it had
returned from the `value:` message), the handler environment is
restored and the value returned from the exception action is returned as
the value of the `on:do:` message that created the handler. Before
returning, any active `ensure:` or `ifCurtailed:` termination blocks
created during evaluation of the receiver of the `on:do:` message are
evaluated.  If a matching handler is not found when the exception
environment is searched, the default action for the signaled exception
is performed. This is accomplished as if the message `defaultAction`
were sent to the ⧼signaledException⧽ object derived from the
signaled exception. The `defaultAction` method is executed in the
context of the signaling environment. If the signaled exception is
resumable the value returned from the `defaultAction` method is
returned as the value of the `signal` message. If the signaled
exception is not resumable the action taken upon completion of the
`defaultAction` method is implementation defined.

Cf: signal

### 5.5.2.2

_Message_: signal: signalerText

_Synopsis_: Signal the occurrence of an exceptional condition with a
specified textual description.

_Definition_: Associated with the receiver is an
⧼exceptionDescription⧽ called the signaled exception. The message
text of the signaled exception is set to the value of signalerText, and
then the exception is signaled in the same manner as if the message
`signal` had been sent to the receiver.  Note that this message does not
return in some circumstances. The situations in which it does return and the
returned value, if any, are the same as specified for the `signal`
message.

_Parameters_: signalerText ⧼string⧽

## 5.5.3

_Protocol_: ⧼exceptionBuilder⧽

_Conforms To_: ⧼exceptionDescription⧽, ⧼exceptionSignaler⧽

_Description_: This protocol describes the messages that may be used
to set the information about an occurrence of an exception. This
information may be retrieved using ⧼exceptionDescription⧽
protocol. If an object conforming to this protocol is signaled as an
exception, any information set in that object using this protocol’s
messages will also be available for retrival from the signaled
exception that is passed to a handler block.

Cf: Error

### 5.5.3.1

_Message_: messageText: signalerText

_Synopsis_: Set an exception’s message text.

_Definition_: Set the signaler message text of the
receiver. Subsequent sends of the message #messgeText to the receiver
will return this value. Subseqent sends of of the message #messgeText to a
signaled exception generated by sending the message #signal to the
receiver of this message will also return this value.  Return the receiver
as the result of the message.

_Parameters_: signalerText ⧼string⧽

_Return Value_:
⧼receiver⧽

## 5.5.13

_Protocol_: ⧼Error class⧽

_Description_: This protocol describe the behavior of the global
Error. The value of the standard global Error is a class object that
conforms to this protocol. The class Error is explicitly specified to
be subclassable in a standard conforming program. Conforming
implementations must implement its behaviors in a non-fragile manner.

The signaled exceptions generated by this type of object conform to
the protocol ⧼Error⧽.

## 5.5.14

_Protocol_: ⧼Error⧽

_Conforms To_: ⧼Exception⧽

_Description_: This protocol describes the behavior of instances of
class Error. These are used to represent error conditions that prevent
the normal continuation of processing. Actual error exceptions used by
an application may be subclasses of this class.  As Error is
explicitly specified to be subclassable, conforming implementations
must implement its behavior in a non-fragile manner.

Cf: Error

# 5.6 Numeric Protocols

This section includes protocols that define the behavior of the standard numeric classes.

## 5.6.1

_Protocol_: ⧼magnitude⧽

_Description_:
Provides protocol for comparing objects which are linearly ordered with respect to some
comparison operation.

Cf: Magnitude

### 5.6.1.1

_Message_: < operand

_Synopsis_: Answer true if the receiver is less than operand. Answer false
otherwise.

_Definition_: Answer true if the receiver is less than operand with
respect to the ordering defined for them.  Answer false otherwise.  It is
erroneous if the receiver and operand are not comparable.  The semantics
of the natural ordering must be defined by refinement, which may also
restrict the type of operand.

_Parameters_: operand ⧼magnitude⧽

_Return Value_: ⧼boolean⧽

_Errors_: Receiver and operand are not comparable

Cf: <

### 5.6.1.2

_Message_: <= operand

_Synopsis_: Answer true if the receiver is less than or equal to
operand. Answer false otherwise.

_Definition_: Answer true if the receiver would answer true to either the #<
or #= message with operand as the parameter. Answer false otherwise.  It is
erroneous if the receiver and operand are not comparable.

_Parameters_: operand ⧼magnitude⧽

_Return Value_: ⧼boolean⧽

_Errors_: Receiver and operand are not comparable

Cf: <=

### 5.6.1.3

_Message_: > operand

_Synopsis_: Answer true if the receiver is greater than operand. Answer false
otherwise.

_Definition_: Answer true if the receiver is greater than operand with
respect to the natural ordering. Answer false otherwise.  It is erroneous if the
receiver and operand are not comparable.  The semantics of the natural ordering
must be defined by refinement, which may also restrict the type of
operand.

_Parameters_: operand ⧼magnitude⧽

_Return Value_: ⧼boolean⧽

_Errors_: Receiver and operand are not comparable

Cf: >

### 5.6.1.4

_Message_: >= operand

_Synopsis_: Answer true if the receiver is greater than or equal to
operand. Answer false otherwise.

_Definition_: Answer true if the receiver answers true to either the #⧽ or #=
message with operand as the parameter. Answer false otherwise.  It is
erroneous if the receiver and operand are not comparable.

_Parameters_: operand ⧼magnitude⧽

_Return Value_: ⧼boolean⧽

_Errors_: Receiver and operand are not comparable

Cf: >=

### 5.6.1.5

_Message_: between: min and: max

_Synopsis_: Answer true if the receiver is less than or equal to max, and
greater than or equal to min. Answer false otherwise.

_Definition_: Answer true if the receiver answers true to the ⧼=` message
with max as the parameter, and also answers true to the `>=` message with min
as the parameter. Answer false otherwise.  It is erroneous if the receiver
and min or max are not comparable.

_Parameters_: min ⧼magnitude⧽ max ⧼magnitude⧽

_Return Value_: ⧼boolean⧽

_Errors_: Receiver and operands are not comparable.

Cf: betweenAnd

### 5.6.1.6

_Message_: max: operand

_Synopsis_: Answer the receiver if it is greater than operand. Answer
operand otherwise.

_Definition_: Answer the receiver if the receiver answers true to the `⧽
message with operand as the parameter.  Answer operand otherwise.  It
is erroneous if the receiver and operand are not comparable.

_Parameters_: operand ⧼magnitude⧽

_Return Value_: ⧼magnitude⧽

_Errors_: Receiver and operand are not comparable

Cf: max

### 5.6.1.7

_Message_: min: operand

_Synopsis_: Answer the receiver if it is less than operand. Answer
operand otherwise.

_Definition_: Answer the receiver if the receiver answers true to the #<
message with operand as the parameter.  Answer operand otherwise.  It
is erroneous if the receiver and operand are not comparable.

_Parameters_: operand ⧼magnitude⧽

_Return Value_: ⧼magnitude⧽

_Errors_: Receiver and operand are not comparable

Cf: min

## 5.6.2

_Protocol_: ⧼number⧽

_Conforms To_: ⧼magnitude⧽

_Description_: Provides protocol for objects that represent numeric
quantities and support operations performing arithmetic, arithmetic
progressions, and conversion on numerical quantities.  The descriptions
of messages in this protocol reference specific arithmetic and numerical
operations in the ISO/IEC 10967 standard, providing
definition-by-reference for these operations.  Smalltalk provides for
mixed-mode arithmetic with the receiver and argument having different
numeric representations. Unless otherwise specified by an individual
operation the receiver and argument are first converted to the same numeric
representation.

_General Rule_: To perform math operations both the receiver and operand
must be objects with identical numeric representations. If they have
different representations a conversion to their common numeric
representation is performed, as specified by the Default Conversion
Table, before applying the operation. If the common representation is
⧼integer⧽, then the result value is defined by the ISO/IEC 10967
integer operation. If the common representation is ⧼Float⧽, then the
result value is defined by the ISO/IEC 10967 float
operation. Otherwise, the result is consistent with the mathematical
definition of the ISO/IEC 10967 operation.  The protocol and
representation of the return value is defined to be the Default Result
Type.  If the result value is outside of the range of the common
numeric representation, the effect of underflow or overflow is
implementation defined.

Cf: Number

### 5.6.2.1

_Message_: * operand

_Synopsis_: Answer the result of multiplying the receiver by operand.

_Definition_: Answer a number whose value is the result of multiplying
the receiver and operand, as specified by the ISO/IEC 10967
multiplication operation _mul_.

_Parameters_: operand ⧼number⧽

Cf: *

### 5.6.2.2

_Message_: + operand

_Synopsis_: Answer the result of adding operand to the receiver.

_Definition_: Answer a number whose value is the result of adding the
receiver and operand, as specified by the ISO/IEC 10967 addition
operation _add_.

_Parameters_: operand ⧼number⧽

Cf: +

### 5.6.2.3

_Message_: - operand

_Synopsis_: Answer the result of subtracting operand from the receiver.

_Definition_: Answer a number whose value is the result of subtracting
the receiver and operand, as specified by the ISO/IEC 10967 subtraction
operation _sub_.

_Parameters_: operand ⧼number⧽

Cf: -

### 5.6.2.4

_Message_: / operand

_Synopsis_: Answer the result of dividing the receiver by operand.

_Definition_:
Answer a number whose value is the result of dividing the receiver by operand, as specified by
the ISO/IEC 10967 flooring division operation _div_.

_Parameters_: operand ⧼number⧽

_Return Value_: If the operands conform to integer then ⧼rational⧽

_Errors_: operand = 0 unless receiver or operand are of type ⧼Float⧽

Cf: /

### 5.6.2.5

_Message_: // operand

_Synopsis_: Answer the truncated quotient resulting from dividing the receiver by operand. The truncation is
towards negative infinity.

_Definition_: Answer an integer whose value is the truncated result of
dividing the receiver by operand, as specified by the ISO/IEC 10967
flooring division operation _divf_. Truncation is towards negative
infinity. The sign of the result is positive if the receiver and operand
have the same sign, and negative if the signs are different.  If the
operand has a value of zero the ZeroDivide exception is signaled.

_Parameters_: operand ⧼number⧽

_Return Value_: ⧼integer⧽

_Errors_: operand = 0 unless receiver or operand are of type ⧼Float⧽

Cf: //

### 5.6.2.9

_Message_: \\\\ operand

_Synopsis_: Answer the remainder after integer division of the receiver by the operand.

_Definition_: Answer the remainder of truncating integer division as
specified by the ISO/IEC 10967 remainder operation _remf_. The remainder
has the same sign as operand.  Within the limits of representation,
the following invariant should hold:

	(receiver // operand) * operand + (receiver \\ operand) = receiver

_Parameters_: operand ⧼number⧽

_Errors_: operand = 0 unless receiver or operand are of type ⧼Float⧽

Cf: \\\\

### 5.6.2.10

_Message_: abs

_Synopsis_: Answer the absolute value of the receiver.

_Definition_: Return the absolute value of the receiver, as specified
by the ISO/IEC 10967 operation _abs_. If the receiver is greater than or
equal to zero, answer an object equal to the receiver. Otherwise
answer an object which is equal to the negation of the receiver.

_Return Value_: ⧼receiver⧽

Cf: abs

### 5.6.2.11

_Message_: asFloat

_Synopsis_: Answer a floating-point number approximating the receiver.

_Definition_: Return the nearest floating-point number to the
receiver, as specified by the ISO/IEC 10967 _cvt_ operation.

_Return Value_: ⧼Float⧽

Cf: asFloat

### 5.6.2.15

_Message_: asFraction

_Synopsis_: Answer a fraction approximating the receiver.

_Definition_: Answer a fraction that reasonably approximates the
receiver. If the receiver is an integral value the result may be
⧼integer⧽.

_Return Value_: ⧼rational⧽

Cf: asFraction

### 5.6.2.16

_Message_: asInteger

_Synopsis_: Answer an integer approximating the receiver.

_Definition_: Answer the result of sending #rounded to the receiver.

_Return Value_: ⧼integer⧽

Cf: asInteger

### 5.6.2.18

_Message_: ceiling

_Synopsis_: Answer the smallest integer greater than or equal to the receiver.

_Definition_: Answer the smallest integer greater than or equal to the
receiver.

_Return Value_: ⧼integer⧽

Cf: ceiling

### 5.6.2.19

_Message_: floor

_Synopsis_: Answer the largest integer less than or equal to the receiver.

_Definition_: Answer the largest integer less than or equal to the
receiver.

_Return Value_: ⧼integer⧽

Cf: floor

### 5.6.2.20

_Message_: fractionPart

_Synopsis_: Answer the fractional part of the receiver.

_Definition_: Return an object conforming to the protocol of the
receiver that is equal to the fractional part of the receiver. Within
the limits of representation, the following invariants should hold:

	receiver integerPart + receiver fractionPart = receiver
	receiver \\ 1 = receiver fractionPart

_Return Value_: ⧼receiver⧽

Cf: fractionPart

### 5.6.2.21

_Message_: integerPart

_Synopsis_: Answer the integer part of the receiver.

_Definition_: Return an object that is equal to the integer part of
the receiver. If the receiver is type ⧼Fraction⧽ return an object
conforming to ⧼integer⧽. Otherwise return an object conforming to the
protocol of the receiver.

_Rationale_: The return value is not restricted to ⧼integer⧽ to avoid
unnecessary mixed mode arithmetic.

Cf: integerPart

### 5.6.2.22

_Message_: negated

_Synopsis_: Answer the negation of the receiver.

_Definition_: Answer an object conforming to the receiver’s protocol
that is equal to the negation of the receiver (equal in magnitude to
the receiver but opposite in sign), as specified by the ISO/IEC 10967
_neg_ operation.

_Return Value_: ⧼receiver⧽

Cf: negated

### 5.6.2.23

_Message_: negative

_Synopsis_: Answer true if the receiver is negative.

_Definition_: Answer true if the receiver is negative. Answer false
otherwise.

_Return Value_: ⧼boolean⧽

Cf: isNegative

### 5.6.2.24

_Message_: positive

_Synopsis_: Answer true if the receiver is positive or zero.

_Definition_: Answer true if the receiver is positive or zero. Answer false
otherwise.

_Return Value_: ⧼boolean⧽

Cf: isNonNegative

### 5.6.2.26

_Message_: quo: operand

_Synopsis_: Answer the truncated integer quotient resulting from
dividing the receiver by operand. Truncation is towards zero.

_Definition_: Answer a number whose value is the result of dividing
the receiver by operand, as specified by the ISO/IEC 10967 flooring
division operation _div_.

_Parameters_: operand ⧼number⧽

_Return Value_: ⧼integer⧽

_Errors_: operand = 0 unless receiver or operand are of type ⧼Float⧽

Cf: quotient

### 5.6.2.27

_Message_: raisedTo: operand

_Synopsis_: Answer the receiver raised to the power operand.

_Definition_: If operand conforms to ⧼integer⧽, answer the result of
sending `raisedToInteger` with argument operand to the receiver.
Otherwise answer `(receiver asFloat ln * operand) exp`.  It is erroneous
if the receiver equals zero and the operand is less than or equal to
zero, or if the receiver is less than zero.

_Parameters_: operand ⧼number⧽

_Return Value_: ⧼number⧽

_Errors_: receiver = 0 and operand <= 0 receiver < 0

Cf: ^

### 5.6.2.28

_Message_: raisedToInteger: operand

_Synopsis_: Answer the receiver raised to the power operand.

_Definition_: Answer the receiver raised to the power operand, which
must be a whole number. If the operand is a whole number greater than
or equal to zero, then the result is the receiver raised to the power
operand. If operand is a negative whole number then the result is
equivalent to the reciprocal of the absolute value of the receiver raised to
the power operand.  It is erroneous if the operand does not conform to
the protocol ⧼integer⧽. If the numeric representation of the result
has does not have unbounded precision, the effect of underflow or
overflow is implementation defined.

_Parameters_: operand⧼integer⧽

_Return Value_: ⧼receiver⧽

_Errors_: Receiver is not an integer.

Cf: raisedToInteger

### 5.6.2.29

_Message_: reciprocal

_Synopsis_: Answer the reciprocal of the receiver.

_Definition_:
Answer the reciprocal of the receiver, which is equal to the result of the operation (1/receiver).
Signal a ZeroDivide exception if the receiver is equal to zero.

_Errors_: receiver = 0

Cf: /

### 5.6.2.30

_Message_: rem: operand

_Synopsis_: Answer the remainder after integer division of the
receiver by the operand.

_Definition_: Answer the remainder with respect to integer division,
as specified by the ISO/IEC 10967 remainder operation _rem_. The sign
of the remainder is the same sign as the receiver. Within the limits
of representation, the following invariant should hold:

	(receiver quo: operand) * operand + receiver rem: operand) = receiver

_Parameters_: operand ⧼number⧽

_Return Value_: ⧼number⧽

_Errors_: operand = 0 unless receiver or operand are of type ⧼Float⧽

Cf: remainder

### 5.6.2.31

_Message_: rounded

_Synopsis_: Answer the integer nearest the receiver.

_Definition_: Answer the integer nearest the receiver according to the
following property: N rounded = the nearest integer I = N + (N sign *
(1/2)) truncated towards zero.  For example, 0.5 rounded = 1 and -0.5
rounded = -1.

_Return Value_: ⧼integer⧽

Cf: rounded

### 5.6.2.32

_Message_: roundTo: factor

_Synopsis_: Answer the number nearest the receiver that is a multiple of factor.

_Definition_: Answer the number nearest the receiver that is a
multiple of factor. The result conforms to either the receiver’s or
operand’s protocol, according to the Default Conversion Table.  The
result is undefined if factor equals zero. If the numeric representation of
the result has does not have unbounded precision, the effect of
underflow or overflow is implementation defined.

_Parameters_: factor ⧼number⧽

Cf: roundTo

### 5.6.2.33

_Message_: sign

_Synopsis_: Answer the sign of the receiver.

_Definition_: Answer 1 if the receiver is positive, 0 if the receiver
equals 0, and -1 if it is negative, as specified by the ISO/IEC 10967
operation _sign_.

_Return Value_: ⧼integer⧽

Cf: sign

### 5.6.2.34

_Message_: sqrt

_Synopsis_: Answer the positive square root of the receiver.

_Definition_: Answer a number equal to the positive square root of the
receiver as specified by the ISO/IEC 10967 remainder operation _sqrt_.

_Return Value_: ⧼number⧽

Cf: sqrt

### 5.6.2.35

_Message_: squared

_Synopsis_: Answer the receiver squared.

_Definition_: Answer a number that is the receiver multiplied by
itself. The answer must conform to the same protocol as the receiver.

_Return Value_: ⧼receiver>

Cf: squared

### 5.6.2.36

_Message_: strictlyPositive

_Synopsis_: Answer true if the receiver is greater than zero.

_Definition_: Answer true if the receiver is greater than zero.

_Return Value_: ⧼boolean⧽

Cf: isPositive

### 5.6.2.37

_Message_: to: stop

_Synopsis_: Answer an object conforming to ⧼interval⧽ which represents
an arithmetic progression from the receiver to stop in increments of
1.

_Definition_: Answer an interval which represents an arithmetic
progression from the receiver to stop, using the increment 1 to
compute each successive element. The elements conform to the receiver’s
protocol.  Note that stop may not be the last element in the sequence,
which is given by the formula receiver + ((stop - receiver) // 1) The
interval answered will be empty if the receiver is greater than stop.

_Parameters_: stop ⧼number⧽

_Return Value_: ⧼Interval⧽

Cf: to

### 5.6.2.38

_Message_: to: stop by: step

_Synopsis_: Answer an interval which represents an arithmetic
progression from receiver to stop in increments of step.

_Definition_: Answer an interval which represents an arithmetic
progression from the receiver to stop, using the increment step to
compute each successive element. The value of step can be positive or
negative, but it must be non-zero. The elements conform to either the
receiver’s or step’s protocol, according to the Default Conversion
Table.  Note that stop may not be the last element in the sequence,
which is given by the formula (((stop - receiver) // step) * step) +
receiver The interval answered will be empty if:

1. receiver < stop, and step < 0.
2. receiver > stop, and step > 0.

_Parameters_: stop ⧼number⧽ step ⧼number⧽

_Return Value_: ⧼Interval⧽

_Errors_: step = 0

Cf: toBy

### 5.6.2.39

_Message_: to: stop by: step do: operation

_Synopsis_: Evaluate operation for each element of an interval which
represents an arithmetic progression from the receiver to stop in
increments of step.

_Definition_: Evaluate operation for each element of an interval starting
at the receiver and stopping at stop where each element is step greater
than the previous. The value of step can be positive or negative, but
it must be non-zero. The elements must all conform to either the
receiver’s or step’s protocol, according to the Default Conversion
Table.  Note that stop is not necessarily an element in the sequence,
which is given by the formula (((stop - receiver) // step) * step) +
receiver No evaluation takes place if:

1. receiver < stop, and step < 0.
2. receiver > stop, and step > 0.

Implementations are not required to actually create the interval
described by the receiver, stop and step. Implementations may restrict
the definition of this message to specific classes.

_Parameters_: stop ⧼number⧽ step ⧼number⧽ operation
⧼monadicBlock⧽

_Errors_: step = 0

Cf: toByDo

### 5.6.2.40

_Message_: to: stop do: operation

_Synopsis_: Evaluate operation for each element of an interval which
represents an arithmetic progression from receiver to stop in
increments of 1.

_Definition_: Evaluate operation for each element of an interval starting
at the receiver and stopping at stop where each element is 1 greater than
the previous. The elements must all conform to the receiver’s protocol
according to the Default Conversion Table.  Note that stop may not be
the last element in the sequence, which is given by the formula

	receiver + ((stop - receiver) // 1)

No evaluation takes place if the receiver is greater than stop.
Implementations are not required to actually create the interval
described by the receiver and stop.

_Parameters_: stop ⧼number⧽ operation ⧼monadicBlock⧽

Cf: toDo

### 5.6.2.41

_Message_: truncated

_Synopsis_: Answer an integer equal to the receiver truncated towards
zero.

_Definition_: As specified by the ISO/IEC 10967 truncation operation
_trunc_. If the receiver is positive, answer the largest integer less
than or equal to the receiver. If it is negative, answer the smallest
integer greater than or equal to the receiver.

_Return Value_: ⧼integer⧽

Cf: truncated

### 5.6.2.42

_Message_: truncateTo: factor

_Synopsis_: Answer the number nearest the receiver truncated towards
zero which is a multiple of factor.

_Definition_: If the receiver is positive, answer the largest number
less than or equal to the receiver which is a multiple of factor. If it
is negative, answer the smallest number greater than or equal to the
receiver which is a multiple of factor.  The type of the return value
depends on the type of the receiver and factor, as indicated by the
Default Conversion Table.

_Parameters_: factor ⧼number⧽

Cf: truncateTo

## 5.6.3

_Protocol_: ⧼rational⧽

_Conforms To_: ⧼number⧽

_Description_: Rational numbers may be either integers or fractions. An
integer is logically a fraction whose denominator is one. This
protocol is necessary because some integer and most fraction operations
can produce results that may be either an integer or a fraction.

Cf: Fraction

### 5.6.3.1

_Message_: denominator

_Synopsis_: Answer the denominator of the receiver.

_Definition_: Treating the receiver as a fraction, answer the lowest
common denominator of the receiver.

_Return Value_: ⧼integer⧽

Cf: denominator

### 5.6.3.2

_Message_: numerator

_Synopsis_: Answer the numerator of the receiver.

_Definition_: Treating the receiver as a fraction reduced to its
lowest common denominator, answer the integer numerator.

_Return Value_: ⧼integer⧽

Cf: numerator

5.6.4 Protocol: ⧼Fraction⧽

_Conforms To_: ⧼rational⧽

_Description_: An exact representation for rational numbers. It is
unspecific whether the rational number are maintain in a reduced form
but messages that reveal the numerator and denominator answer values as
if the fraction was reduced.

Cf: Fraction

## 5.6.5

_Protocol_: ⧼integer⧽

_Conforms To_: ⧼rational⧽

_Description_: Represents an abstraction for integer numbers whose
value is exact. Representations must provide unbounded precision and
range, hence the ISO/IEC 10967 integer type parameter bounded is bound
to false.

Cf: Integer

### 5.6.5.1

_Message_: allMask: mask

_Synopsis_: Answer true if all of the bits that are 1 in the binary
representation of mask are 1 in the binary representation of the
receiver. Answer false otherwise.

_Definition_: Answer true if all of the bits that are 1 in the binary
representation of mask are 1 in the binary representation of the
receiver. Answer false otherwise. If the receiver has fewer bits than the
operand, the receiver is treated as if it were extended on the left
with zeros to the length of the operand.  The result is undefined if either
the receiver or the operand is a negative integer.

_Parameters_: mask ⧼integer⧽

_Return Value_: ⧼boolean⧽

### 5.6.5.2

_Message_: anyMask: mask

_Synopsis_: Answer true if any of the bits that are 1 in the binary
representation of mask are 1 in the binary representation of the
receiver. Answer false otherwise.

_Definition_: Answer true if any of the bits that are 1 in the binary
representation of mask are 1 in the binary representation of the
receiver. Answer false otherwise. If the receiver has fewer bits than the
operand, the receiver is treated as if it were extended on the left
with zeros to the length of the operand.  Result is undefined if either the
receiver or the operand is a negative integer.

_Parameters_: mask ⧼integer⧽

_Return Value_: ⧼boolean⧽

### 5.6.5.4

_Message_: bitAnd: operand

_Synopsis_: Answer the bit-wise logical and of the receiver and the
operand.

_Definition_: Answer the result of the bit-wise logical and of the
binary representation of the receiver and the binary representation of
operand. The shorter of the receiver or the operand is extended on the
left with zeros to the length of the longer of the two.  The result is
undefined if either the receiver or the operand is a negative integer.

_Parameters_: operand ⧼integer⧽

_Return Value_: ⧼integer⧽

Cf: bitAnd

### 5.6.5.5

_Message_: bitAt: index

_Synopsis_: Answer the value of the bit at index in the binary representation of the receiver.

_Definition_: Answer the value of the bit at index in the binary
representation of the receiver. Answer an integer value of 0 or 1,
depending upon the value of the bit at position index in the binary
representation of the receiver. The least significant bit of the
receiver is designated as bit 1, with indices increasing to the left.
The result is undefined if either the receiver is negative. It is erroneous if
index is less that or equal to zero.

_Parameters_: index ⧼integer⧽

_Return Value_: ⧼integer⧽

_Errors_: index less than or equal to zero

Cf: bitAt

### 5.6.5.6

_Message_: bitAt: index put: value

_Synopsis_: Set the value of the bit at index in the binary representation
of the receiver.

_Definition_: Return an integer whose binary representation is
identical to the receiver with the exception that the value of the bit
at position index is equal to the low order bit of value.  The least
significant bit of the receiver is designated as position 1, with
indices increasing to the left.  The result is undefined if either the
receiver or value is a negative integer. It is erroneous if index is less
that or equal to zero.

_Parameters_: index ⧼integer⧽

_Return Value_: ⧼integer⧽

_Errors_: index less than or equal to zero

Cf: bitAtPut

### 5.6.5.7

_Message_: bitOr: operand

_Synopsis_: Answer the logical or of the receiver and operand.

_Definition_: Answer the result of bit-wise logical or the binary
representation of the receiver and the binary representation of
operand. The shorter of the receiver or the operand is extended on the
left with zeros to the length of the longer of the two.  The result is
undefined if either the receiver or the operand is a negative integer.

_Parameters_: operand⧼integer⧽

_Return Value_: ⧼integer⧽

Cf: bitOr

### 5.6.5.8

_Message_: bitShift: shift

_Synopsis_: Answer the result of logically bit-wise shifting the
binary representation of the receiver by shift bits.

_Definition_: If shift is positive, the receiver is shifted left and
zeros (0) are shifted in on the right. If shift is negative, the
receiver is shifted right and low order bits are discarded.  The result
is undefined if either the receiver is negative.

_Parameters_: shift ⧼integer⧽

_Return Value_: ⧼integer⧽

Cf: bitShift

### 5.6.5.9

_Message_: bitXor: operand

_Synopsis_: Answer bit-wise exclusive or of the receiver and the operand.

_Definition_: Answer the result of the bit-wise exclusive or of the
binary representation of the receiver and the binary representation of
operand. The shorter of the receiver or the operand is extended on the
left with zeros to the length of the longer of the two.  The result is
undefined if either the receiver or the operand is a negative integer.

_Parameters_: operand ⧼integer⧽

_Return Value_: ⧼integer⧽

Cf: bitXor

### 5.6.5.10

_Message_: even

_Synopsis_: Answer true if the receiver is even.

_Definition_: Answer true if the receiver is divisible by 2 with no
remainder.

_Return Value_: ⧼boolean⧽

Cf: isEven

### 5.6.5.11

_Message_: factorial

_Synopsis_: Answer the factorial of the receiver.

_Definition_: Answer the product of all numbers between the receiver and 1
inclusive. The result is undefined if the receiver is negative.

_Return Value_: ⧼integer⧽

Cf: factorial

### 5.6.5.12

_Message_: gcd: operand

_Synopsis_: Answer the greatest common divisor of the receiver and
operand.

_Definition_: Answer the largest non-negative integer that divides
both the receiver and operand with no remainder. Answer 0 if the
receiver and operand are zero.

_Parameters_: operand ⧼integer⧽

_Return Value_: ⧼integer⧽

Cf: gcd

### 5.6.5.13

_Message_: highBit

_Synopsis_: Answer the index of the most significant non-zero bit in the binary representation of the receiver.

_Definition_: Answer the index of the most significant non-zero bit in the
binary representation of the receiver.  Answer 0 if the receiver is
0. The index of the least significant bit of the receiver is 1, with
indices increasing to the left.  The result is undefined if the receiver is
negative.

_Return Value_: ⧼integer⧽

Cf: highBit

### 5.6.5.14

_Message_: lcm: operand

_Synopsis_: Answer the least common multiple of the receiver and
operand.

_Definition_: Answer the smallest non-negative integer which is evenly
divided by both the receiver and operand. Answer 0 if the receiver and
operand are zero.

_Parameters_: operand ⧼integer⧽

_Return Value_: ⧼integer⧽

Cf: lcm

### 5.6.5.15

_Message_: noMask: mask

_Synopsis_: Answer true if none of the bits that are 1 in the binary
representation of mask are 1 in the binary representation of the
receiver. Answer false otherwise.

_Definition_: Answer true if none of the bits that are 1 in the binary
representation of mask are 1 in the binary representation of the
receiver. Answer false otherwise. If the receiver has fewer bits than the
operand, the receiver is treated as if it were extended on the left
with zeros to the length of the operand.  The result is undefined if either
the receiver or the operand is a negative integer.

_Parameters_: mask ⧼integer⧽

_Return Value_: ⧼boolean⧽

### 5.6.5.16

_Message_: odd

_Synopsis_: Answer true if the receiver is odd.

_Definition_: Answer trueif the receiver is divisible by two (2) with remainder one (1).

_Return Value_: ⧼boolean⧽

Cf: isOdd

### 5.6.5.17

_Message_: printStringRadix: base

_Synopsis_: Answer a string which represents the receiver in radix base.

_Definition_: Return a string containing a sequence of characters that
represents the numeric value of the receiver in the radix specified by
the argument. The sequence of characters must be recognizable using
the radixDigits production of the Smalltalk Lexical Grammar as if the
numeric value of the radixSpecifier was base. If the receiver is
negative, a minus sign ('-') is prepended to the sequence of
characters. The result is undefined if base is less than two or greater than
36.

_Parameters_: base ⧼integer⧽

_Return Value_:⧼string⧽

## 5.6.7

_Protocol:_ ⧼Float⧽

_Conforms To_: ⧼number⧽

_Description_: Represents a floating point representation for real
numbers, whose value may be approximate.  Provides protocol for
performing trigonometry, exponentiation, and conversion on numerical
quantities.  Operations can produce results that are outside the set
of representable numbers, or that are mathematically undefined. It is
implementation defined whether errors are raised when results are not
representable or if unrepresentable results are wrapped in
implementation-defined continuation values or their equivalent. The
effect of underflow and overflow is therefore implementation defined. It
is erroneous if the result of an operation is mathematically undefined.

### 5.6.7.2

_Message_: arcCos

_Synopsis_: Answer the inverse cosine of the receiver in radians.

_Definition_: Answer the inverse cosine of the receiver in radians, as
specified by the ISO/IEC 10967 trigonometric operation _arccosf_. Within
the limits of precision, the following invariant holds:

	receiver arcCos cos = receiver

It is erroneous if the absolute value of the receiver is greater than
1.

_Return Value_: ⧼Float⧽

_Errors_: |receiver| > 1

Cf: arcCos

### 5.6.7.3

_Message_: arcSin

_Synopsis_: Answer the inverse sine of the receiver in radians.

_Definition_: Answer the inverse sine of the receiver in radians, as
specified by the ISO/IEC 10967 trigonometric operation _arcsinf_. Within
the limits of precision, the following invariant holds:

	receiver arcSin sin = receiver

It is erroneous if the absolute value of the receiver is greater than 1.

_Return Value_: ⧼Float⧽

_Errors_: |receiver| > 1

Cf: arcSin

### 5.6.7.4

_Message_: arcTan

_Synopsis_: Answer the inverse tangent of the receiver in radians.

_Definition_: Answer the inverse tangent of the receiver in radians,
as specified by the ISO/IEC 10967 trigonometric operation
arctanf. Within the limits of precision, the following invariant
holds:

	receiver arcTan tan = receiver

_Return Value_: ⧼Float⧽

Cf: arcTan

### 5.6.7.5

_Message_: cos

_Synopsis_: Answer the cosine of the receiver in radians.

_Definition_: Answer a ⧼Float⧽ equal to the cosine of the receiver
in radians, as specified by the ISO/IEC 10967 trigonometric operation
_cosf_.  The effect of underflow is implementation defined.

_Return Value_: ⧼Float⧽

Cf: cos

### 5.6.7.6

_Message_: degreesToRadians

_Synopsis_: Answer the receiver converted from degrees to radians.

_Definition_: Answer a floating-point number representing the receiver
converted from degrees to radians. The result is equivalent to
multiplying the receiver by (Pi / 180).

_Return Value_: ⧼Float⧽

Cf: degreesToRadians

### 5.6.7.7

_Message_: exp

_Synopsis_: Answer the natural exponential of the receiver. This is the
inverse of #ln.

_Definition_: Answer a floating-point number representing the
irrational number e (= 2.718281) raised to the power of the receiver,
as specified by the ISO/IEC 10967 operation _expf_. This is the
inverse of the `ln` message.

_Return Value_: ⧼Float⧽

Cf: exp

### 5.6.7.8

_Message_: floorLog: operand

_Synopsis_: Answer the largest integer less than or equal to the
logarithm to the base operand of the receiver.

_Definition_: Answer the largest integer less than or equal to the
power to which the operand must be raised to obtain the receiver (that
is, the logarithm base operand of the receiver).  The result is undefined if
the receiver is less than or equal to zero, or if the operand is less
than or equal to 1.

_Parameters_: operand ⧼number⧽

_Return Value_: ⧼integer⧽

Cf: floorLog

### 5.6.7.9

_Message_: ln

_Synopsis_: Answer the natural logarithm of the receiver.

_Definition_: Answer the natural logarithm of the receiver, as specified by
the ISO/IEC 10967 operation _lnf_., which is a floating-point number
representing the power to which the irrational number e (=
2.718281...) must be raised to obtain the receiver. This is the
inverse of the `exp` message.  The result is undefined if the receiver is less
than or equal to zero.

_Return Value_: ⧼Float⧽

Cf: log

### 5.6.7.10

_Message_: log: operand

_Synopsis_: Answer the logarithm to the base operand of the receiver.

_Definition_: Answer the logarithm to the base operand of the
receiver, as specified by the ISO/IEC 10967 operation _logff_, which is
a floating-point number representing the power to which operand must
be raised to obtain the receiver. The receiver must be positive, and
operand must be greater than one. This is the inverse of the
`raisedTo` message.  The result is undefined if operand equals 1, if operand
is less than or equal to zero, or if the receiver is less than or equal
to zero. The effect of underflow and overflow is implementation defined.

_Parameters_: operand ⧼number⧽

_Return Value_: ⧼Float⧽

Cf: log

### 5.6.7.12

_Message_: radiansToDegrees

_Synopsis_: Answer the receiver converted from radians to degrees.

_Definition_: Answer a floating-point number representing the receiver
converted from radians to degrees. The result is equivalent to
multiplying the receiver by (180 / Pi).

_Return Value_: ⧼Float⧽

Cf: radiansToDegrees

### 5.6.7.13

_Message_: sin

_Synopsis_: Answer the sine of the receiver.

_Definition_: Answer a floating-point number equal to the sine of the
receiver in radians, as specified by the ISO/IEC 10967 trigonometric
operation _sinF_.

_Return Value_: ⧼Float⧽

Cf: sin

### 5.6.7.14

_Message_: tan

_Synopsis_: Answer the tangent of the receiver.

_Definition_: Answer a floating-point number equal to the tangent of
the receiver in radians, as specified by the ISO/IEC 10967
trigonometric root operation _tanf_.

_Return Value_: ⧼Float⧽

Cf: tan

## 5.6.8

_Protocol_: ⧼floatCharacterization⧽

_Description_:
Objects supporting this protocol characterize a floating point representation for real numbers.
These characterizations are required by ISO/IEC 10967 for each precision of floating point
numbers provided by an implementation.

### 5.6.8.2

_Message_: e

_Synopsis_: The closest floating point approximation of the irrational number e.

_Definition_: Return the closest floating point approximation of the
irrational number e for the characterized floating point object
representation.

_Return Value_: ⧼Float⧽

Cf: e

### 5.6.8.5

_Message_: epsilon

_Synopsis_: The maximum relative spacing in the characterized floating
point object representation.

_Definition_: Report the maximum relative spacing in the characterized
floating point object representation, satisfying the ISO/IEC 10967
floating point characterization requirement _epsilon_. The return value is equal to
`self radix raisedTo: (1 - self precision)`

_Return Value_: ⧼Float⧽

Cf: epsilon, smallFloatEpsilon

### 5.6.8.10

_Message_: pi

_Synopsis_: The closest floating point approximation to Pi.

_Definition_: Return the closest floating point approximation to Pi
for the characterized floating point object representation.

_Return Value_: ⧼Float⧽

Cf: pi

## 5.6.9

Protocol: ⧼Fraction factory⧽

_Description_: Represents protocol for creating an exact
representation for rational numbers.

Cf: Fraction

### 5.6.9.1

_Message_: numerator: top denominator: bottom

_Synopsis_: Answer a new fraction whose numerator is top, and whose denominator is bottom.

_Definition_: Answer a new fraction whose numerator is top, and whose
denominator is bottom. It is unspecified whether the result is reduced
to the smallest possible denominator.

_Parameters_: top ⧼integer⧽ bottom ⧼integer⧽

_Return Value_: ⧼Fraction⧽ ⧼integer⧽

Cf: Fraction

# 5.7 Collection Protocols

This section includes protocols that define the behavior of the standard collection classes.

## 5.7.1

_Protocol_: ⧼collection⧽

_Description_: Provides protocol for manipulating and operating on a
collection of objects, called elements, either individually or as a
whole. A collection can be fixed or variable sized, ordered or
unordered, and its elements may or may not be accessible by external keys.

Cf: Collection

### 5.7.1.1

_Message_: allSatisfy: discriminator

_Synopsis_: Return true if the discriminator evaluates to true for every
element of the receiver. Otherwise return false.

_Definition_: Return true if the discriminator evaluates to true for every
element of the receiver. Return true if the receiver is empty. Otherwise
return false.  It is unspecified whether the discriminator will be evaluated
with every element of the receiver.

_Parameters_: discriminator⧼monadicValuable⧽

_Return Value_: ⧼boolean⧽

_Errors_: If the elements of the receiver are inappropriate for use as
arguments to discriminator.  If discriminator evaluates to an object
that does not conform to the protocol ⧼boolean⧽ for each element of the
receiver.

Cf: allSatisfy

### 5.7.1.2

_Message_: anySatisfy: discriminator

_Synopsis_: Return true if the discriminator evaluates to true for any
element of the receiver. Otherwise return false.

_Definition_: Return true if the discriminator evaluates to true for any
element of the receiver. Otherwise return false. Return false if the receiver is
empty.  It is unspecified whether the discriminator will be evaluated
with every element of the receiver.

_Parameters_: discriminator⧼monadicValuable⧽

_Return Value_: ⧼boolean⧽

_Errors_: If the elements of the receiver are inappropriate for use as
arguments to discriminator.  If discriminator evaluates to an object
that does not conform to the protocol ⧼boolean⧽ for any element of the
receiver.

Cf: anySatisfy

### 5.7.1.3

_Message_: asArray

_Synopsis_: Answer an array whose elements are the elements of the
receiver.

_Definition_: Answer an array with the same elements as the
receiver. The result has the same size as the receiver, as defined by
the #size message.  If the receiver maintains an ordering for its
elements, the order of those elements will be preserved in the result.

_Return Value_: ⧼Array⧽

Cf: asList

### 5.7.1.4

_Message_: asBag

_Synopsis_: Answer a bag with the same elements as the receiver.

_Definition_: Answer a bag with the same elements as the receiver.
The result is unspecified if the receiver contains nil.

_Return Value_: ⧼Bag⧽

Cf: asBag

### 5.7.1.5

_Message_: asByteArray

_Synopsis_: Answer a byte array whose elements are the elements of the receiver.

_Definition_: Answer a byte array with the same elements as the
receiver. The result has the same size as the receiver, as defined by
the #size message.  If the receiver maintains an ordering for its
elements, the order of those elements will be preserved in the result.

_Return Value_: ⧼ByteArray⧽

_Errors_: If any elements in the receiver are not integers with values
between 0 and 255.

Cf: asByteArray

### 5.7.1.6

_Message_: asOrderedCollection

_Synopsis_: Answer an ordered collection whose elements are the
elements of the receiver.

_Definition_: Answer a ordered collection with the same elements as
the receiver. The result has the same size as the receiver, as defined
by the #size message.  If the receiver maintains an ordering for its
elements, the order of those elements will be preserved in the result.

_Return Value_: ⧼OrderedCollection⧽

### 5.7.1.7

_Message_: asSet

_Synopsis_: Answer a set with the same elements as the receiver.

_Definition_: Answer a set with the same elements as the
receiver. Since sets do not store duplicate elements, the result may have fewer
elements than the receiver.  The result is undefined if the receiver contains
nil.

_Return Value_: ⧼Set⧽

Cf: asSet

### 5.7.1.8

_Message_: asSortedCollection

_Synopsis_: Answer a sorted collection with the same elements as the
receiver.

_Definition_: Answer a sorted collection with the same elements as the
receiver. The default sort block is used.

_Return Value_: ⧼SortedCollection⧽

_Errors_: If any element of the receiver is not appropriate as a
parameter to the default sort block.

Cf: asSortedList

### 5.7.1.9

_Message_: asSortedCollection: sortBlock

_Synopsis_: Answer a sorted collection with the same elements as the
receiver. The parameter sortBlock is used as the sort block.

_Definition_: Answer a sorted collection with the same elements as the
receiver. The parameter sortBlock is used as the sort block and must
meet the requirements of a sort block as specified by
⧼SortedCollection⧽.

_Parameters_: sortBlock ⧼dyadicValuable⧽

_Return Value_: ⧼SortedCollection⧽

_Errors_: If sortBlock does not meet the requirements for a sort block
as specified by ⧼SortedCollection⧽.  If any element of the receiver
is not appropriate as a parameter to the sortBlock.

Cf: asSortedList

### 5.7.1.10

_Message_: collect: transformer

_Synopsis_: Answer a new collection constructed by gathering the
results of evaluating transformer with each element of the receiver.

_Definition_: For each element of the receiver, transformer is evaluated
with the element as the parameter.  The results of these evaluations
are collected into a new collection.  The elements are traversed in
the same order as they would be if the message #do: had been sent to
the receiver.  Unless specifically refined, this message is defined to
answer an object conforming to the same protocol as the receiver.

_Parameters_: transformer ⧼monadicValuable⧽

_Return Value_: ⧼receiver⧽ new

_Errors_: If any element of the receiver is inappropriate for use as
arguments to transformer.  If the result of evaluating the transformer
does not conform to any element type restrictions of the collection to
be returned.

Cf: collect

### 5.7.1.11

_Message_: detect: discriminator

_Synopsis_: Return the first element of the receiver which causes
discriminator to evaluate to true when the element is used as the
argument.

_Definition_: Return the first element of the receiver for which the
discriminator evaluates to true when given that element as an
argument. The discriminator will only be evaluated until such an
object is found or until all of the elements of the collection have
been used as arguments. That is, there may be elements of the receiver
that are never used as arguments to the discriminator.  The elements
are traversed in the same order as they would be if the message #do:
had been sent to the receiver.  The result is undefined if discriminator does
not evaluate to true for any element.

_Parameters_: discriminator⧼monadicValuable⧽

_Errors_: If the elements of the receiver are inappropriate for use as
arguments to discriminator.  If discriminator evaluates to an object
that does not conform to the protocol ⧼boolean⧽ for any element of the
receiver.

Cf: detect

### 5.7.1.12

_Message_: detect: discriminator ifNone: exceptionHandler

_Synopsis_: Return the first element of the receiver which causes
discriminator to evaluate to true when used as the argument to the
evaluation. Answer the result of evaluating exceptionHandler if no
such element is found.

_Definition_: Return the first element of the receiver for which the
discriminator evaluates to true when given that element as an
argument. The discriminator will only be evaluated until such an
object is found or until all of the elements of the collection have
been used as arguments. That is, there may be elements of the receiver
that are never used as arguments to the discriminator.  The elements
are traversed in the same order as they would be if the message #do:
had been sent to the receiver.  If no element causes discriminator to
evaluate to true, answer the result of exceptionHandler value.

_Parameters_: discriminator ⧼monadicValuable⧽ exceptionHandler
⧼niladicValuable⧽

_Errors_: If the elements of the receiver are inappropriate for use as
arguments to discriminator.  If discriminator evaluates to an object
that does not conform to the protocol ⧼boolean⧽ for any element of the
receiver.

Cf: detectIfNone

### 5.7.1.13

_Message_: do: operation

_Synopsis_: Evaluate operation with each element of the receiver.

_Definition_: For each element of the receiver, operation is evaluated
with the element as the parameter.  Unless specifically refined, the
elements are not traversed in a particular order. Each element is
visited exactly once. Conformant protocols may refine this message to
specify a particular ordering.

_Parameters_: operation ⧼monadicValuable⧽

_Errors_: If the elements of the receiver are inappropriate for use as
arguments to operation.

Cf: do

### 5.7.1.14

_Message_: do: operation separatedBy: separator

_Synopsis_: Evaluate operation with each element of the receiver
interspersed by evaluation of separator.

_Definition_: For each element of the receiver, operation is evaluated
with the element as the parameter.  Before evaluating operation the second
and subsequent times evaluate separator.  Separator is not evaluated if
there are less than two elements nor after the last element.

_Parameters_: operation ⧼monadicValuable⧽ separator
⧼niladicValuable⧽

Cf: doSeparatedBy

### 5.7.1.15

_Message_: includes: target

_Synopsis_: Answer true if an element of the receiver is equivalent to
target. Answer false otherwise.

_Definition_: This message is used to test an object for inclusion
among the receiver’s elements. Answer true if at least one of the
receiver’s elements is equivalent to target. Answer false otherwise.

_Return Value_: ⧼boolean⧽

Cf: includes

### 5.7.1.16

_Message_: inject: initialValue into: operation

_Synopsis_: Answer the final result of evaluating operation using each
element of the receiver and the previous evaluation result as the
parameters.

_Definition_: The first evaluation of operation is performed with
initialValue as the first parameter, and the first element of the receiver as
the second parameter. Subsequent evaluations are done with the result of
the previous evaluation as the first parameter, and the next element as the
second parameter. The result of the last evaluation is answered.  The
elements are traversed in the same order as they would be if the
message `do` had been sent to the receiver.

_Parameters_: operation ⧼dyadicValuable⧽

Cf: injectInto

### 5.7.1.17

_Message_: isEmpty

_Synopsis_: Return true if the receiver contains no elements. Return false
otherwise.

_Definition_: Return true if and only if receiver size = 0 is true. Otherwise
return false.

_Return Value_: ⧼boolean⧽

Cf: isEmpty

### 5.7.1.18

_Message_: notEmpty

_Synopsis_: Return true if the receiver contains elements. Return false otherwise.

_Definition_: Return true if the receiver contains elements. Return false
otherwise. This is equivalent to receiver isEmpty not

_Return Value_: ⧼boolean⧽

Cf: notEmpty

### 5.7.1.19

_Message_: occurrencesOf: target

_Synopsis_: Answer the number of elements of the receiver which are
equivalent to target.

_Definition_: Answer the number of elements of the receiver which are
equivalent to target.

_Return Value_: ⧼integer⧽

Cf: occurrencesOf

### 5.7.1.21

_Message_: reject: discriminator

_Synopsis_: Answer a new collection which includes only the elements in the
receiver which cause discriminator to evaluate to false.

_Definition_: For each element of the receiver, discriminator is
evaluated with the element as the parameter. Each element which causes
discriminator to evaluate to false is included in the new collection.  The
elements are traversed in the same order as they would be if the
message `do` had been sent to the receiver.  Unless specifically
refined, this message is defined to answer an object conforming to the
same protocol as the receiver. If both the receiver and the result
maintain an ordering of their elements, the elements of the result
will be in the same relative order as the elements of the receiver.

_Parameters_: discriminator⧼monadicValuable⧽

_Return Value_: ⧼receiver⧽ new

_Errors_: If the elements of the receiver are inappropriate for use as
arguments to discriminator.  If discriminator evaluates to an object
that does not conform to the protocol ⧼boolean⧽ for any element of the
receiver.

Cf: reject

### 5.7.1.22

_Message_: select: discriminator

_Synopsis_: Answer a new collection which contains only the elements
in the receiver which cause discriminator to evaluate to true.

_Definition_: For each element of the receiver, discriminator is
evaluated with the element as the parameter. Each element which causes
discriminator to evaluate to true is included in the new collection.  The
elements are traversed in the same order as they would be if the
message `do` had been sent to the receiver.  Unless specifically
refined, this message is defined to answer an object conforming to the
same protocol as the receiver. If both the receiver and the result
maintain an ordering of their elements, the elements of the result
will be in the same relative order as the elements of the receiver.

_Parameters_: discriminator⧼monadicValuable⧽

_Return Value_: ⧼receiver⧽ new

_Errors_: If the elements of the receiver are inappropriate for use as
arguments to discriminator.  If discriminator evaluates to an object
that does not conform to the protocol ⧼boolean⧽ for any element of the
receiver.

Cf: select

### 5.7.1.23

_Message_: size

_Synopsis_: Answer the number of elements in the receiver.

_Definition_: Answer the number of elements in the receiver.

_Return Value_: ⧼integer⧽

Cf: size

## 5.7.2

_Protocol_: ⧼abstractDictionary⧽

_Conforms To_: ⧼collection⧽

_Description_: Provides protocol for accessing, adding, removing, and
iterating over the elements of an unordered collection whose elements are
accessed using an explicitly assigned external key.

### 5.7.2.1

_Message_: addAll: dictionary

_Synopsis_: Store the elements of dictionary in the receiver at the
corresponding keys from dictionary.

_Definition_: This message is equivalent to repeatedly sending the
#at:put: message to the receiver with each of the keys and elements in
dictionary in turn. If a key in dictionary is key equivalent to a key
in the receiver, the associated element in dictionary replaces the
element in the receiver.

_Parameters_: dictionary ⧼abstractDictionary⧽

Cf: addAll

### 5.7.2.2

_Message_: at: key

_Synopsis_: Answer the element at key in the receiver.

_Definition_: This message defines element lookup based on a
key. Answer the element stored at key.  Lookup is successful if an
element has been previously stored in the receiver at a key that is
key equivalent to key. This element is answered. Specifically, the
following expression must return true for all appropriate bindings of
dictionary, key, and value:

	dictionary at: key put: value
	(dictionary at: key) == value

The result is undefined if the receiver does not contain an element keyed by key
or if the key is nil.

Cf: at

### 5.7.2.3

_Message_: at: key ifAbsent: operation

_Synopsis_: Answer the element at key in the receiver. If key lookup
for key fails, then answer the result of evaluating operation.

_Definition_: Answer the element stored at the specified key if key
lookup is successful. If the key lookup fails, answer the result of
evaluating operation with no parameters.  The result is undefined if the key
is nil.

_Parameters_: key ⧼Object⧽ operation ⧼niladicValuable⧽

Cf: atIfAbsent

### 5.7.2.4

_Message_: at: key ifAbsentPut: operation

_Synopsis_: Answer the element at key in the receiver. If key lookup
for key fails, then store and return the result of evaluating operation.

_Definition_: This message is the same as the #at: message if key
lookup is successful. If the key lookup fails, the result of
evaluating operation with no parameters is added at key and answered.
The result is undefined if the key is nil.

_Parameters_: key ⧼Object⧽ operation ⧼niladicValuable⧽

Cf: atIfAbsentPut

### 5.7.2.5

_Message_: at: key put: newElement

_Synopsis_: Store newElement at key in the receiver. Answer newElement.

_Definition_: If lookup succeeds for key, then newElement replaces the
element previously stored at key.  Otherwise, the newElement is stored
at the new key. In either case, subsequent successful lookups for key
will answer newElement. Answer newElement.  The result is undefined if the key
is nil.

Cf: atPut

### 5.7.2.7

_Message_: includesKey: key

_Synopsis_: Answer true if the receiver contains an element stored at
key. Answer false otherwise.

_Definition_: Answer true if the key lookup for the key succeeds. Answer
false otherwise.  The result is undefined if the key is nil.

_Return Value_: ⧼boolean⧽

Cf: includesKey

### 5.7.2.8

_Message_: keyAtValue: value

_Synopsis_: Answer a key such that the element stored at this key is
equal to value. Answer nil if no such key is found.

_Definition_: Answer an object such that key lookup with this object
will answer an element in the receiver equivalent to value. Note that
if there are multiple elements in the receiver that are equivalent to
value, then the one whose key is answered is arbitrary.  The result is
undefined if the receiver does not contain an element equivalent to value.

Cf: keyAtValue

### 5.7.2.9

_Message_: keyAtValue: value ifAbsent: operation

_Synopsis_: Answer a key such that the element stored at this key is
equivalent to value. Answer the result of evaluating operation if no
such key is found.

_Definition_: Answer an object such that key lookup with this object
will answer an element in the receiver equivalent to value. If no
element equivalent to value is found, then the result of evaluating
operation with no parameters is answered.

_Parameters_: value ⧼Object⧽ operation ⧼niladicValuable⧽

Cf: keyAtValueIfAbsent

### 5.7.2.10

_Message_: keys

_Synopsis_: Answer a collection of keys at which there is an element
stored in the receiver.

_Definition_: Answer a collection of all the keys in the receiver. The
size of the result is equal to the size of the receiver.

_Return Value_: ⧼collection⧽

Cf: keys

### 5.7.2.11

_Message_: keysAndValuesDo: operation

_Synopsis_: Iteratively evaluate operation with each of the receiver’s
keys and values.

_Definition_: For each element in the receiver, operation is evaluated
with the corresponding key as the first argument and the element as the second
argument.  The order in which the elements are traversed is not
specified. Each key is visited exactly once.

_Parameters_: operation ⧼dyadicValuable⧽

_Errors_: If any of the keys or values are not appropriate as an argument
to operation.

Cf: keysAndValuesDo

### 5.7.2.14

_Message_: removeAllKeys: keys

_Synopsis_: Remove any elements from the receiver which are stored at
the keys specified in keys.

_Definition_: This message has the same effect on the receiver as
repeatedly sending the #removeKey: message for each element in keys.  The
result is undefined if duplicate keys, as defined by key equivalence, are in the keys
or if any element in keys is not a valid key of the receiver.

_Parameters_: keys ⧼collection⧽

Cf: removeAllKeys

### 5.7.2.15

_Message_: removeAllKeys: keys ifAbsent: operation

_Synopsis_: Remove any elements from the receiver which are stored at
the keys specified in keys. For any element in keys which is not a valid
key of the receiver, evaluate operation with that element as the
argument, but do not stop the enumeration.

_Definition_: This message has the same effect on the receiver as
repeatedly sending the `removeKey:ifAbsent:` message for each element in
keys. If any element in keys is not a valid key of the receiver,
evaluate operation with that element as the parameter and continue the
enumeration.

_Parameters_: keys ⧼collection⧽ operation ⧼monadicValuable⧽

_Errors_: If any element of keys is not a valid key of the receiver and
inappropriate for use as an argument to the operation.

### 5.7.2.16

_Message_: removeKey: key

_Synopsis_: Remove the element which is stored at key in the
receiver. Answer the removed element.

_Definition_: This message defines removal of a key from the
receiver. If key lookup for key is successful, then both key and its
corresponding element are removed. Answer the removed element.  The
result is undefined if the receiver does not contain an element keyed by key.
The result is undefined if the key is nil.

Cf: removeKey

### 5.7.2.17

_Message_: removeKey: key ifAbsent: operation

_Synopsis_: Remove the element which is stored at key in the receiver
and answer the removed element.  Answer the result of evaluating
operation if no such key is found in the receiver.

_Definition_: If key lookup for key is successful, then both key and its
corresponding element are removed.  Answer the removed element.  If
the key lookup fails, the result of evaluating operation with no
parameters is answered.  The result is undefined if the key is nil.

_Parameters_: key ⧼Object⧽ operation ⧼niladicValuable⧽

Cf: removeKeyIfAbsent

### 5.7.2.19

_Message_: values

_Synopsis_: Answer a collection of the receiver’s elements.

_Definition_: Answer a collection of the receiver’s elements.

_Return Value_: ⧼sequencedReadableCollection⧽

Cf: values

## 5.7.3

_Protocol_: ⧼Dictionary⧽

_Conforms To_: ⧼abstractDictionary⧽

_Description_: Represents an unordered collection whose elements can
be accessed using an explicitly assigned external key. Key equivalence
is defined as sending the `=` message.


## 5.7.4

_Protocol_: ⧼IdentityDictionary⧽

_Conforms To_: ⧼abstractDictionary⧽

_Description_: This protocol defines the behavior of unordered collections whose elements can be accessed using
an explicitly-assigned, external key. Key equivalence is defined as sending the `==` message.

Cf: Map

## 5.7.5

_Protocol_: ⧼extensibleCollection⧽

_Conforms To_: ⧼collection⧽

_Description_: Provides protocol for adding elements to and removing
elements from a variable sized collection.

Cf: Extensible

### 5.7.5.1

_Message_: add: newElement

_Synopsis_: Add newElement to the receiver’s elements.

_Definition_: This message adds a newElement to the receiver. Unless
specifically refined, the position of the newElement in the element
traversal order is unspecified.  Conformant protocols may place
restrictions on the type of objects that are valid elements. Unless
otherwise specified, any object is acceptable.

Cf: add

### 5.7.5.2

_Message_: addAll: newElements

_Synopsis_: Add each element of newElements to the receiver’s elements.

_Definition_: This message adds each element of newElements to the
receiver.  The operation is equivalent to adding each element of
newElements to the receiver using the `add:` message with the element
as the parameter. The newElements are traversed in the order specified
by the `do:` message for newElements.

_Parameters_: newElements ⧼collection⧽

Cf: addAll

### 5.7.5.3

_Message_: remove: oldElement

_Synopsis_: Remove the first element of the receiver which is equivalent
to oldElement and return the removed element.

_Definition_: Remove the first element of the receiver which is equivalent
to oldElement and return the removed element.  The elements are tested in the
same order in which they would be enumerated by the message #do: for
this receiver.  The behavior is undefined if an object equivalent to
oldElement is not found.

Cf: remove

### 5.7.5.4

_Message_: remove: oldElement ifAbsent: exceptionHandler

_Synopsis_: Remove the first element of the receiver which is equivalent
to oldElement. If it is not found, answer the result of evaluating
exceptionHandler.

_Definition_: The first element of the receiver which is equivalent to
oldElement is removed from the receiver’s elements. If no such element
is found, answer the result of evaluating exceptionHandler with no
parameters.  The elements are tested in the same order in which they
would be enumerated by the message `#do:` for this receiver.

_Parameters_: oldElement ⧼Object⧽ exceptionHandler
⧼niladicValuable⧽

Cf: removeIfAbsent

### 5.7.5.5

_Message_: removeAll: oldElements

_Synopsis_: For each element in oldElements, remove the first element from
the receiver which is equivalent to this element.

_Definition_: This message is used to remove each element of a given
collection from the receiver’s elements.  The operation is defined to
be equivalent to removing each element of oldElements from the receiver
using the `#remove:` message with the element as the parameter.  The
behavior is undefined if any element of oldElements is not found.

_Parameters_: oldElements ⧼collection⧽

Cf: removeAll

## 5.7.6

_Protocol_: ⧼Bag⧽

_Conforms To_: ⧼extensibleCollection⧽

_Description_: Represents an unordered, variable sized collection
whose elements can be added or removed, but cannot be individually
accessed by external keys. A bag is similar to a set but can contain duplicate
elements. Elements are duplicates if they are equivalent.

### 5.7.6.2

_Message_: add: newElement withOccurrences: count

_Synopsis_: Add newElement count times to the receiver’s elements.

_Definition_: This message adds an element to the receiver multiple
times. The operation is equivalent to adding newElement to the
receiver count times using the `#add:` message with newElement as the
parameter.  The result is undefined if newElement is nil.

_Parameters_: newElement ⧼Object⧽ count ⧼integer⧽

Cf: addWithOccurrences

## 5.7.7

_Protocol_: ⧼Set⧽

_Conforms To_: ⧼extensibleCollection⧽

_Description_: Represents an unordered, variable sized collection
whose elements can be added or removed, but cannot be individually
accessed by external keys. A set is similar to a bag but cannot
contain duplicate elements.

Cf: Set

## 5.7.8

_Protocol_: ⧼sequencedReadableCollection⧽

_Conforms To_: ⧼collection⧽

_Description_: Provides protocol for reading an ordered collection of
objects whose elements can be accessed using external integer
keys. The keys are between one (1) and the number of elements in the
collection, inclusive.

Cf: Sequence

### 5.7.8.1

_Message_: , operand

_Synopsis_: Answer a new collection which is the concatenation of the receiver and
operand.

_Definition_: Answer a new collection containing all of the receiver’s
elements in their original order followed by all of the elements of
operand, in their original order. The size of the new collection is
equal to the sum of the sizes of the receiver and operand, as defined by
the `size` message.  Collections that enforce an ordering on their
elements are permitted to refine this message to reorder the result.

_Parameters_: operand ⧼sequencedReadableCollection⧽

_Return Value_: ⧼receiver⧽ new

_Errors_: If the elements of operand are not suitable for storage in
instances of the receiver’s class.

Cf: ++

### 5.7.8.3

_Message_: after: target

_Synopsis_: Answer the object immediately following the first element
which is equivalent to target in the receiver.

_Definition_: Answer the object immediately following the first element
which is equivalent to target in the receiver. An element immediately
follows another if its index is one greater than that of the other.  The
order used to determine which of the receiver’s elements is the first to
be equivalent to target is the traversal order defined by #do: for the
receiver.  It is an error if the first occurrence of target is the last
element of the receiver, or if the receiver does not include target.

_Errors_: If there is no element in the receiver which is equivalent
to target.  If the element which is equal to target is the last
element in the receiver.

Cf: after

### 5.7.8.4

_Message_: at: index

_Synopsis_: Answer the element at the position index in the receiver.

_Definition_: This message defines element retrieval based on an
index. Answer the element at the specified index. The result is undefined if the
receiver has no element at position index.

_Parameters_: index ⧼integer⧽

_Errors_: If index is <= 0.  If index is greater than the receiver’s size.

Cf: at

### 5.7.8.5

_Message_: at: index ifAbsent: exceptionBlock

_Synopsis_: Answer the element at the position index in the receiver. If
there is no position corresponding to index in the receiver, then answer
the result of evaluating exceptionBlock.

_Definition_: This message defines element retrieval based on an
index. Answer the element at the specified index. If there is no position
corresponding to index in the receiver, then answer the result of
evaluating exceptionBlock.

_Parameters_: index ⧼integer⧽ exceptionBlock ⧼niladicValuable⧽

Cf: atIfAbsent

### 5.7.8.6

_Message_: before: target

_Synopsis_: Answer the object immediately preceding the first element which is equivalent to target in the
receiver.

_Definition_: Answer the object immediately preceding the first element
which is equivalent to target in the receiver. An element immediately
precedes another if its index is one less than that of the other.  It is
an error if target is the first element of the receiver, or if the receiver
does not include target.

_Errors_: If there is no element in the receiver which is equivalent
to target.  If the element which is equal to target is the first element
in the receiver.

Cf: before

### 5.7.8.7

_Message_: copyFrom: start to: stop

_Synopsis_: Answer a new collection containing all of the elements of
the receiver between the indices start and stop inclusive. If stop ⧼
start, the result has a size of zero.

_Definition_: Answer a new collection containing the specified range
of elements of the receiver in their original order. The element at index
start in the receiver is at index 1 in the new collection; the element at
index start+1 is at index 2, etc. If stop is less than start, then the new
collection is empty.  Otherwise, the size of the new collection is the
maximum of (stop - start + 1) and 0.  The parameters start and stop must
be positive.

_Parameters_: start ⧼integer⧽ stop ⧼integer⧽

_Return Values_: ⧼receiver⧽ new

_Errors_: If stop >= start and (start < 1 or start > the receiver’s size).
If stop >= start and (stop < 1 or stop > the receiver’s size).

Cf: copyFromTo

### 5.7.8.8

_Message_: copyReplaceAll: targetElements with: replacementElements

_Synopsis_: Answer a new collection in which all subsequences of
elements in the receiver matching targetElements are replaced in the
new collection by the elements in replacementElements.

_Definition_: Answer a new collection with the elements of the
receiver in their original order, except where a subsequence in the
receiver matches targetElements. A subsequence in the receiver is said
to match the elements of targetElements if:

1. They have the same number of elements.
2. For all indices of the subsequence, the element in the subsequence at a given index is
equivalent to the element in targetElements at the same index.

Starting with the first element of the receiver and proceeding through
ascending elements, each non-overlapping subsequence of the receiver
matching targetElements is detected. The result is a copy of the
receiver with each detected subsequence replaced by the sequence of
elements of replacementElements.  Collections that enforce an ordering
on their elements are permitted to refine this message to reorder the
result.

_Parameters_: targetElements ⧼sequencedReadableCollection⧽
replacementElements⧼sequencedReadableCollection⧽

_Return Values_: ⧼receiver⧽ new

_Errors_: If any of the elements in replacementElements does not conform
to any element type restrictions of instances of the receiver’s class.

Cf: copyReplaceAllWith

### 5.7.8.9

_Message_: copyReplaceFrom: start to: stop with: replacementElements

_Synopsis_: Answer a new collection, containing the same elements as
the receiver, but with the elements in the receiver between start and
stop inclusive replaced by the elements in replacementElements.

_Definition_: This message can be used to insert, append, or
replace. The size of replacementElements (as defined by `size`) need not
be the same as the number of elements being replaced. There are three
cases:

1. If stop = start - 1 , and start is less than or equal to the size of
the receiver, then the replacementElements are inserted between the
elements at index stop and start. None of the receiver’s elements are
replaced.

2. If stop = the size of the receiver and start = stop + 1, then the
operation is an append, and the replacementElements are placed at the
end of the new collection.

3. Otherwise, the operation is a replacement, and the receiver’s
elements in the given range are replaced by the elements from
replacementElements.

In all cases, the resulting collection consists of the receiver’s
elements from indices 1 to start - 1 in their original order, followed
by the elements of replacementElements, followed by the remainder of
the receiver’s elements from index stop + 1 in their original order. The
size of the result is the receiver’s size - (stop - start + 1) + the
replacementElements size.  The parameters start and stop must be
positive.  Collections that enforce an ordering on their elements are
permitted to refine this message to reorder the result.

_Parameters_: start ⧼integer⧽ stop ⧼integer⧽
replacementElements⧼sequencedReadableCollection⧽

_Return Values_: ⧼receiver⧽ new

_Errors_: The elements in replacementElements are not suitable for
storage in instances of the receiver’s class.  start > receiver’s size
+ 1.  start < 1. stop > receiver’s size. stop < start - 1.

Cf: copyReplaceFromToWith

### 5.7.8.10

_Message_: copyReplaceFrom: start to: stop withObject: replacementElement

_Synopsis_: Answer a new collection conforming to the same protocols as the receiver, in which the elements of
the receiver between start and stop inclusive have been replaced with replacementElement.

_Definition_:
This message can be used to insert, append, or replace. There are three cases:

1. If stop = start - 1 , and start is less than or equal to the size of
the receiver, then replacementElement is inserted between the elements
at index stop and start. None of the receiver’s elements are replaced.

2. If stop = the size of the receiver and start = stop + 1, then the
operation is an append, and replacementElement is placed at the end of
the new collection.

3. Otherwise, the operation is a replacement, and each of the receiver’s
elements in the given range is replaced by replacementElement.

The parameters start and stop must be non-negative.  Collections that by
definition enforce an ordering on their elements are permitted to
refine this message to reorder the result.

_Parameters_: start ⧼integer⧽ stop ⧼integer⧽ replacementElement
⧼Object⧽

_Return Values_: ⧼receiver⧽ new

_Errors_: The replacementElement is not suitable for storage in
instances of the receiver’s class.  start > receiver’s size + 1.
start < 1.  stop > receiver’s size.  stop < start - 1.

### 5.7.8.11

_Message_: copyReplacing: targetElement withObject: replacementElement

_Synopsis_: Answer a new collection conforming to the same protocols
as the receiver, in which any occurrences of targetElement are
replaced by replacementElement.

_Definition_: A new collection is created and initialized with the same
elements as the receiver in the same order, except that any objects in
the receiver which are equivalent to targetElement are replaced in the
new collection by replacementElement.  Collections that enforce an
ordering on their elements are permitted to refine this message to
reorder the result.

_Parameters_: targetElement ⧼Object⧽ replacementElement ⧼Object⧽

_Return Values_: ⧼receiver⧽ new

_Errors_: If the replacementElement is inappropriate for storage in
instances of the receiver’s class.

### 5.7.8.12

_Message_: copyWith: newElement

_Synopsis_: Answer a new collection containing the same elements as
the receiver, with newElement added.

_Definition_: Answer a new collection with size one greater than the
size of the receiver containing the elements of the receiver and
newElement placed at the end.  Unless specifically refined, this
message is defined to answer an instance of the same class as the
receiver.  Collections that enforce an ordering on their elements are
permitted to refine this message to reorder the result.

_Return Values_: ⧼receiver⧽ new

Cf: copyWith

### 5.7.8.15

_Message_: findFirst: discriminator

_Synopsis_: Answer the index of the first element of the receiver which causes
discriminator to evaluate to true when the element is used as the
parameter. Answer zero (0) if no such element is found.

_Definition_: For each element of the receiver, discriminator is
evaluated with the element as the parameter. Answer the index of the first
element which results in an evaluation of true; no further elements are
considered. If no such element exists in the receiver, answer 0.  The
elements are traversed in the order specified by the #do: message for
the receiver.

_Parameters_: discriminator ⧼monadicValuable⧽

_Return Values_: ⧼integer⧽

_Errors_: If an evaluation of discriminator results in an object that
does not conform to ⧼boolean⧽.  If the elements of the receiver are
inappropriate for use as arguments to discriminator.

Cf: findFirst

### 5.7.8.16

_Message_: findLast: discriminator

_Synopsis_: Answer the index of the last element of the receiver which
causes discriminator to evaluate to true when the element is used as the
parameter. Answer zero (0) if no such element is found.

_Definition_: For each element of the receiver, in reverse order starting
with the last, discriminator is evaluated with the element as the
parameter. Answer the index of the first element which results in an
evaluation of true; no further elements are considered. Answer 0 if no
such element is found in the receiver.  The elements are traversed in
the order specified by the `reverseDo:` message for the receiver.

_Parameters_: discriminator⧼monadicValuable⧽

_Return Values_: ⧼integer⧽

_Errors_: If an evaluation of discriminator results in an object that
does not conform to ⧼boolean⧽.  If the elements of the receiver are
inappropriate for use as arguments to discriminator.

Cf: findLast

### 5.7.8.17

_Message_: first

_Synopsis_: Answer the first element of the receiver.

_Definition_: Answer the element at index 1 in the receiver. The result is
undefined if the receiver is empty (answers true to the `isEmpty` message).

Cf: first

### 5.7.8.18

_Message_: from: start to: stop do: operation

_Synopsis_: For those elements of the receiver between positions start
and stop, inclusive, evaluate operation with each element of the receiver.

_Definition_: For each index in the range start to stop, the operation is
evaluated with the element at that index as its argument.

_Parameters_: start ⧼integer⧽ stop ⧼integer⧽ operation
⧼monadicValuable⧽

_Errors_: If the elements of the receiver are inappropriate for use as
arguments to operation.  start < 1.  stop > receiver’s size.

Cf: fromToDo

### 5.7.8.19

_Message_: from: start to: stop keysAndValuesDo: operation

_Synopsis_: For those elements of the receiver between positions start
and stop, inclusive, evaluate operation with an element of the receiver
as the first argument and the element’s position (index) as the second.

_Definition_: For each index in the range start to stop, the operation is
evaluated with the index as the first argument and the element at that index as the
second argument.

_Parameters_: start ⧼integer⧽ stop ⧼integer⧽ operation
⧼dyadicValuable⧽

_Errors_: If the elements of the receiver or its indices are
inappropriate for use as arguments to operation.  start < 1.  stop >
receiver’s size.

Cf: fromToKeysAndValuesDo

### 5.7.8.20

_Message_: indexOf: target

_Synopsis_: Answer the index of the first element of the receiver which is
equivalent to target. Answer zero (0) if no such element is found.

_Definition_: Answer the index of the first element which is equivalent to
target; no further elements are considered. Answer 0 if no such
element exists in the receiver.  The elements are traversed in the
order specified by the #do: message for the receiver.

_Return Values_: ⧼integer⧽

Cf: indexOf

### 5.7.8.21

_Message_: indexOf: target ifAbsent: exceptionHandler

_Synopsis_: Answer the index of the first element of the receiver which is
equivalent to target. Answer the result of evaluating exceptionHandler
with no parameters if no such element is found.

_Definition_: Answer the index of the first element which is equivalent to
target; no further elements are considered. Answer exceptionHandler
evaluated with no parameters if no such element is found.  The
elements are traversed in the order specified by the #do: message for
the receiver.

_Parameters_: target ⧼Object⧽ exceptionHandler ⧼niladicValuable⧽

_Return Values_: ⧼integer⧽ ⧼Object⧽

Cf: indexOfIfAbsent

### 5.7.8.22

_Message_: indexOfSubCollection: targetSequence startingAt: start

_Synopsis_: Answer the index of the first element of the receiver which is the
start of a subsequence which matches targetSequence. Start searching
at index start in the receiver. Answer 0 if no such subsequence is found.

_Definition_: Each subsequence of the receiver starting at index start is
checked for a match with targetSequence. To match, each element of a
subsequence of the receiver must be equivalent to the corresponding
element of targetSequence. Answer the index of the first element which begins
a matching subsequence; no further subsequences are considered. Answer
0 if no such subsequence is found in the receiver, or if targetSequence
is empty.  The elements are traversed in the order specified by the
`do:` message for the receiver.

_Parameters_: targetSequence ⧼sequencedReadableCollection⧽ start
⧼integer⧽

_Return Values_: ⧼integer⧽

_Errors_: start < 1.  start > the receiver’s size

Cf: indexOfSubCollectionStartingAt

### 5.7.8.23

_Message_: indexOfSubCollection: targetSequence startingAt: start
ifAbsent: exceptionHandler

_Synopsis_: Answer the index of the first element of the receiver which is the
start of a subsequence which matches targetSequence. Start searching
at index start in the receiver. Answer the result of evaluating
exceptionHandler with no parameters if no such subsequence is found.

_Definition_: Each subsequence of the receiver starting at index start is
checked for a match with targetSequence. To match, each element of a
subsequence of the receiver must be equivalent to the corresponding
element of targetSequence. Answer the index of the first element which begins
a matching subsequence; no further subsequences are considered. Answer
the result of evaluating exceptionHandler with no parameters if no
such subsequence is found or if targetSequence is empty.  The elements
are traversed in the order specified by the `#do:` message for the
receiver.

_Parameters_: targetSequence ⧼sequencedReadableCollection⧽ start
⧼integer⧽ exceptionHandler ⧼niladicValuable⧽

_Return Values_: ⧼integer⧽ ⧼Object⧽

_Errors_: start < 1.  start > the receiver’s size

Cf: indexOfSubCollectionStartingAtIfAbsent

### 5.7.8.24

_Message_: keysAndValuesDo: operation

_Synopsis_: Evaluate operation with the index of each element of the
receiver, in order, together with the element itself.

_Definition_: The operation is evaluated with the index of each element of
the receiver as the first argument and the element itself as the second
argument. Evaluation is in indexed order starting at 1. The first element
is at index 1, the second at index 2, etc. The index of the last element is equal to
the receiver’s size.

_Parameters_: operation ⧼dyadicValuable⧽

_Errors_: If the elements of the receiver are inappropriate for use as
arguments to operation.

Cf: keysAndValuesDo

### 5.7.8.25

_Message_: last

_Synopsis_: Answer the last element of the receiver.

_Definition_: Answer the last element of the receiver, the element at
the index equal to the receiver’s size. The result is unspecified if the
receiver is empty (answers true to the `isEmpty` message).

Cf: last

### 5.7.8.26

_Message_: reverse

_Synopsis_: Answer a collection with the elements of the receiver
arranged in reverse order.

_Definition_: Answer a collection conforming to the same protocols as
the receiver, but with its elements arranged in reverse order.  This
operation is equivalent to:

1. Create a new collection which conforms to the same protocols as the receiver;

2. Traverse the elements of the receiver in the order specified by the
`reverseDo:` message, adding each element of the receiver to the new
collection;

3. Answer the new collection.

_Return Values_: ⧼receiver⧽ new

Cf: reversed

### 5.7.8.27

_Message_: reverseDo: operation

_Synopsis_: Evaluate operation with each element of the receiver in the
reverse of the receiver’s standard traversal order.

_Definition_: For each element of the receiver, evaluate operation with
the element as the parameter. The elements are traversed in the
opposite order from the `#do:` message. Each element is visited exactly
once.

_Parameters_: operation ⧼monadicValuable⧽

_Errors_: If the elements of the receiver are inappropriate for use as
arguments to operation.

Cf: reverseDo

### 5.7.8.28

_Message_: with: otherCollection do: operation

_Synopsis_: Evaluate operation with each element of the receiver and the
corresponding element of otherCollection as parameters.

_Definition_: For each element of the receiver and the corresponding
element of otherCollection, evaluate operation with the receiver’s
element as the first parameter, and the element of otherCollection as the second
parameter. The receiver and otherCollection must have the same size.
The elements of the receiver and otherCollection are traversed in
indexed order starting at 1.  The operation is first evaluated with the
elements at index 1 in the two ⧼sequencedReadableCollection⧽s, then index 2,
etc.

_Parameters_: otherCollection ⧼sequencedReadableCollection⧽
operation ⧼dyadicValuable⧽

_Errors_: If the elements of the receiver or the elements of
otherCollection are inappropriate for use as arguments to operation.
If the receiver’s size is not equal to the size of otherCollection.

Cf: withDo

## 5.7.9

_Protocol_: ⧼Interval⧽

_Conforms To_: ⧼sequencedReadableCollection⧽

_Description_: Represents a collection whose elements are numbers
which form an arithmetic progression.  Elements cannot be accessed
externally.

Cf: Range

# 5.7.10

_Protocol_: ⧼readableString⧽

_Conforms To_: ⧼magnitude⧽ ⧼sequencedReadableCollection⧽

_Description_: Provides protocol for string operations such as
copying, comparing, replacing, converting, indexing, and matching. All
objects that conform to the protocol ⧼readableString⧽ are
comparable.

Cf: String

### 5.7.10.6

_Message_: asLowercase

_Synopsis_: Answer a new string which contains all of the elements of
the receiver converted to their lower case equivalents.

_Definition_: Answer a new string which contains all of the elements
of the receiver converted to their lower case equivalents. Individual
element of the string are converted as if they were receivers of the
message `#asLowercase`.

_Return Values_: ⧼readableString⧽ new

Cf: asLowerCase

### 5.7.10.7

_Message_: asString

_Synopsis_: Answer a string containing the same characters as the
receiver.

_Definition_: Answer a string containing the same characters as the
receiver, in their original order.

_Return Values_: ⧼string⧽

Cf: asString

### 5.7.10.9

_Message_: asUppercase

_Synopsis_: Answer a new string which contains all of the elements of
the receiver converted to their upper case equivalents.

_Definition_: Answer a new string which contains all of the elements
of the receiver converted to their upper case equivalents. Individual
element of the string are converted as if they were receivers of the
message #asUppercase.

_Return Values_: ⧼readableString⧽ new

Cf: asUpperCase

### 5.7.10.14

_Message_: sameAs: operand

_Synopsis_: Answer true if the receiver collates the same as
operand. Answer false otherwise.

_Definition_: Answer true if the receiver collates the same as operand,
according to the implementation-defined collating algorithm. Answer false
otherwise.  This message differs from the `#=` message because two
strings which are not equal can collate the same, and because the receiver
and operand do not need to conform to the same protocols.

_Parameters_: operand ⧼readableString⧽

_Return Values_: ⧼boolean⧽

Cf: sameAs

### 5.7.10.15

_Message_: subStrings: separators

_Synopsis_: Answer an array containing the substrings in the receiver
separated by the elements of separators.

_Definition_: Answer an array of strings. Each element represents a
group of characters separated by any of the characters in the list of
separators.

_Parameters_: separators ⧼sequencedReadableCollection⧽

_Return Values_: ⧼Array⧽

_Errors_: If the list of separators contains anything other than
characters.

Cf: subStrings

## 5.7.12

_Protocol_: ⧼sequencedCollection⧽

_Conforms To_: ⧼sequencedReadableCollection⧽

_Description_: Provides protocol for writing to an ordered collection
of objects, whose elements can be accessed using external integer
keys.

Cf: Sequence

### 5.7.12.1

_Message_: at: index put: newElement

_Synopsis_: Replace the element in the receiver at index with
newElement. Answer newElement.

_Definition_: This message sets one of the receiver’s elements based
on index. The newElement is stored at index in the receiver’s elements,
replacing any previously stored object. Subsequent retrievals at this
index will answer newElement.

_Parameters_: index ⧼integer⧽ newElement ⧼Object⧽

_Errors_: If index < 0.  If index > the receiver’s size.  If newElement does not
conform to any element type restrictions of the receiver.

Cf: atPut

### 5.7.12.2

_Message_: atAll: indices put: newElement

_Synopsis_: Replace the elements in the receiver specified by indices
with newElement.

_Definition_: The newElement is stored at each index in the receiver
specified by the elements of the indices collection, replacing any
previously stored objects at these indices. Subsequent retrievals at
these indices will answer newElement.  This message is equivalent to
storing newElement in the receiver at each index specified by indices using
the #at:put: message for the receiver.

_Parameters_: indices ⧼collection⧽ newElement ⧼Object⧽

_Errors_: If any element of indices does not conform to ⧼integer⧽.  If
any element in indices is <= 0 or greater than the receiver’s size.  If
newElement does not conform to any element type restrictions of the
receiver.

Cf: atAllPut

### 5.7.12.3

_Message_: atAllPut: newElement

_Synopsis_: Replace all the elements in the receiver with newElement.

_Definition_: The newElement is stored at each index in the receiver,
replacing any previously stored objects.  This message is equivalent
to storing newElement in the receiver at each index from 1 to the receiver’s
size using the `#at:put:` message for the receiver.

_Errors_: If newElement does not conform to any element type
restrictions of the receiver.

Cf: atAllPut

### 5.7.12.4

_Message_: replaceFrom: start to: stop with: replacementElements

_Synopsis_: Replace the elements of the receiver between positions
start and stop inclusive, with the elements of replacementElements in
their original order. Answer the receiver.

_Definition_: The first element of replacementElements is stored in the
receiver at position start, the second at position start + 1, etc. Any
previously stored elements at these positions are replaced.  If the
size of replacementElements is not equal to stop - start + 1, the result
of sending this message is unspecified.

_Parameters_: start ⧼integer⧽ stop ⧼integer⧽
replacementElements⧼sequencedReadableCollection⧽

_Errors_: If start < 1 or start > the receiver’s size.  If stop < 1 or
stop > the receiver’s size.  If replacementElements size <> stop -
start + 1.

Cf: replaceFromToWith

### 5.7.12.5

_Message_: replaceFrom: start to: stop with: replacementElements
startingAt: replacementStart

_Synopsis_: Replace the elements of the receiver between positions
start and stop inclusive with the elements of replacementElements, in
their original order, starting at position replacementStart. Answer
the receiver.

_Definition_: The element at position replacementStart in
replacementElements is stored in the receiver at position start; the
element at replacementStart + 1 is stored at position start + 1; etc.
Any previously stored elements at these positions in the receiver are
replaced.  If the size of replacementElements is not equal to
(replacementStart + stop - start), the result of sending this message
is unspecified.

_Parameters_: start ⧼integer⧽ stop ⧼integer⧽
replacementElements⧼sequencedReadableCollection⧽ replacementStart
⧼integer⧽

_Errors_: If start < 1 or start > the receiver’s size.  If stop < 1 or
stop > the receiver’s size.  If replacementStart < 1 or
replacementStart > replacementElements size.  If replacementElements
size - replacementStart + 1 < stop - start + 1.

Cf: replaceFromToWithStartingAt

### 5.7.12.6

_Message_: replaceFrom: start to: stop withObject: replacementElement

_Synopsis_: Replace the elements of the receiver between start and stop
inclusive with replacementElement. Answer the receiver.

_Definition_: Replace the elements of the receiver between start and
stop inclusive with replacementElement. Answer the receiver.

_Parameters_: start ⧼integer⧽ stop ⧼integer⧽ replacementElement
⧼Object⧽

_Errors_: If start < 1 or start > the receiver’s size.  If stop < 1 or
stop > the receiver’s size.

## 5.7.13

_Protocol_: ⧼string⧽

_Conforms To_: ⧼readableString⧽ ⧼sequencedCollection⧽

_Description_: Provides protocol for string operations such as
copying, storing, comparing, replacing, converting, indexing, and
matching. The element type of ⧼string⧽ is ⧼character⧽. The range
of codePoints of characters that may be elements of a ⧼string⧽ is
implementation defined.

Cf: String

## 5.7.14

_Protocol_: ⧼Array⧽

_Conforms To_: ⧼sequencedCollection⧽

_Description_: Represents a keyed collection of objects which can be
accessed externally using sequential integer keys. The index of the first
element is one (1).

Cf: List

## 5.7.15

_Protocol_: ⧼ByteArray⧽

_Conforms To_: ⧼sequencedCollection⧽

_Description_: Represents a keyed collection whose element type is
⧼integer⧽ and is limited to the range 0 to 255, inclusive. The
elements can be accessed externally using sequential integer keys. The
index of the first element is one (1).

Cf: ByteArray

## 5.7.16

_Protocol_: ⧼sequencedContractibleCollection⧽

_Conforms To_: ⧼collection⧽

_Description_: Provides protocol for removing elements from an ordered
collection of objects, whose elements can be accessed using external
integer keys.

Cf: Removeable

### 5.7.16.1

_Message_: removeAtIndex: index

_Synopsis_: Remove the element of the receiver at position index, and answer
the removed element.

_Definition_: The element of the receiver which is at position index is
removed from the receiver’s elements.  Answer the removed element.  index
must be a positive integer less than or equal to the receiver’s size.

_Parameters_: index ⧼integer⧽

_Errors_: If index is 0 or negative.  If index is greater than the receiver’s
size.

Cf: removeAtIndex

### 5.7.16.2

_Message_: removeFirst

_Synopsis_: Remove and answer the first element of the receiver.

_Definition_: The first element of the receiver is removed and answered. The
element (if any) that was previously the second element in the traversal
order now becomes the first, and the receiver has one fewer elements.

_Errors_: The receiver is empty

Cf: removeFirst

### 5.7.16.3

_Message_: removeLast

_Synopsis_: Remove and answer the last element of the receiver.

_Definition_: The last element of the receiver is removed and
answered. The element (if any) that was previously the second from last
element in the traversal order now becomes the last, and the receiver
has one fewer elements.

_Errors_: The receiver is empty

Cf: removeLast

## 5.7.17

_Protocol_: ⧼SortedCollection⧽

_Conforms To_: ⧼extensibleCollection⧽
⧼sequencedContractibleCollection⧽ ⧼sequencedReadableCollection⧽

_Description_: Represents a variable sized collection of objects whose
elements are ordered based on a sort order. The sort order is
specified by a ⧼dyadicValuable⧽ called the sort block. Elements may
be added, removed or inserted, and can be accessed using external integer
keys.

Cf: SortedList

### 5.7.17.10

_Message_: sortBlock

_Synopsis_: Answer the receiver’s sort block.

_Definition_: Answer the receiver’s sort block. The sort block is
defined by the #sortBlock: message.

_Return Values_: ⧼dyadicValuable⧽ state

Cf: sortBlock

### 5.7.17.11

_Message_: sortBlock: discriminator

_Synopsis_: Set the receiver’s sort block to discriminator.

_Definition_: This message defines the sort block used to specify the
receiver’s ordering criteria. The sortBlock is a 2-parameter
⧼block⧽, which when evaluated with any two elements in the receiver,
answers true if the first parameter should be ordered before the second parameter,
and false otherwise. The sort block must obey the following properties:

1. Given the same 2 parameters, the sort block must answer the same result.

2. The sort block must obey transitivity. For example, if a is before b, and b is before c, then a must be before c.

The receiver’s sort block is set to discriminator, and the elements are
re-sorted.

_Parameters_: discriminator⧼dyadicValuable⧽

_Return Values_: ⧼SortedCollection⧽ receiver

_Errors_: If the elements of the receiver cannot be sorted using the
discriminator.

## 5.7.18

_Protocol_: ⧼OrderedCollection⧽

_Conforms To_: ⧼extensibleCollection⧽ ⧼sequencedContractibleCollection⧽ ⧼sequencedCollection⧽

_Description_: Represents an ordered, variable sized collection of
objects. Elements may be added, removed or inserted, and can be accessed
using external integer keys.

### 5.7.18.2

_Message_: add: newElement after: target

_Synopsis_: Add newElement to the receiver immediately following the first
element which is equivalent to target.

_Definition_: Add newElement to the receiver immediately following the
first element which is equivalent to target. An element immediately
follows another if its index is one greater than that of the other.  The
order used to determine which of the receiver’s elements is the first to
equal target is the traversal order defined by #do: for the receiver.
If the receiver does not include target, the operation fails.

_Errors_: If there is no element in the receiver which is equivalent
to target.

Cf: addAfter

### 5.7.18.3

_Message_: add: newElement afterIndex: index

_Synopsis_: Add newElement to the receiver immediately following the
element at position index.

_Definition_: Add newElement to the receiver immediately following the
element at position index.  newElement is inserted at position index + 1. If index
is equal to 0, newElement becomes the first element of the receiver.

_Parameters_: newElement ⧼Object⧽ index ⧼integer⧽

_Errors_: If index < 0.  If index > receiver’s size.

Cf: addAfterIndex

### 5.7.18.4

_Message_: add: newElement before: target

_Synopsis_: Add newElement to the receiver immediately before the first
element which is equivalent to target.

_Definition_: Add newElement to the receiver immediately before the first
element which is equivalent to target. An element immediately precedes
another if its index is one less than that of the other.  The order used
to determine which of the receiver’s elements is the first to equal target
in the traversal order defined by #do: for the receiver.  If the
receiver does not include target, the operation fails.

_Errors_: If there is no element in the receiver which is equivalent
to target.  If the element which is equal to target is the last
element in the receiver.

Cf: addBefore

### 5.7.18.5

_Message_: add: newElement beforeIndex: index

_Synopsis_: Add newElement to the receiver immediately before the
element at position index.

_Definition_: Add newElement to the receiver immediately before the
element at position index in the receiver.  If index equals the receiver’s
size plus 1 newElement will be inserted at the end of the receiver.
The parameter index must be a positive integer less than or equal to the
receiver’s size plus 1.

_Parameters_: newElement ⧼Object⧽ index ⧼integer⧽

_Errors_: If index ⧼=0.  If index > receiver’s size + 1.

Cf: addBeforeIndex

### 5.7.18.6

_Message_: addAll: newElements after: target

_Synopsis_: Add each element of newElements to the receiver immediately
after the first element in the receiver which is equivalent to
target. Answer newElements.

_Definition_: Add the elements of newElements to the receiver in the
traversal order defined by #do: for newElements. The new elements are
inserted in the receiver immediately after the first element in the
receiver which is equivalent to target.  An element immediately
follows another if its index is one greater than that of the other. The
order used to determine which of the receiver’s elements is the first to
equal target is the traversal order defined by #do: for the receiver.
If the receiver does not include target, the operation fails.

_Parameters_: newElements ⧼collection⧽ target ⧼Object⧽

_Errors_: If there is no element in the receiver which is equivalent
to target.

### 5.7.18.7

_Message_: addAll: newElements afterIndex: index

_Synopsis_: Insert the elements of newElements in the receiver
immediately after the element at position index. Answer newElements.

_Definition_: Add the elements of newElements to the receiver in the
traversal order defined by #do: for newElements. The new elements are
inserted in the receiver immediately after the element in the receiver
at position index. If index is equal to 0, newElements are inserted at the
beginning of the receiver.  The parameter index must be a non-negative
integer less than or equal to the receiver’s size.

_Parameters_: newElements ⧼collection⧽ index ⧼integer⧽

_Errors_: If index < 0.  If index > receiver’s size.

### 5.7.18.8

_Message_: addAll: newElements before: target

_Synopsis_: Add each element of newElements to the receiver immediately
before the first element in the receiver which is equivalent to
target. Answer newElements.

_Definition_: Add the elements of newElements to the receiver in the
traversal order defined by `#do:` for newElements. The new elements
are inserted in the receiver immediately before the first element in the
receiver which is equivalent to target.

An element immediately follows another if its index is one greater than
that of the other. The order used to determine which of the receiver’s
elements is the first to equal target is the traversal order defined by
`#do:` for the receiver.  If the receiver does not include target, the
operation fails.

_Parameters_: newElements ⧼collection⧽ target ⧼Object⧽

_Errors_: If there is no element in the receiver which is equivalent
to target.

### 5.7.18.9

_Message_: addAll: newElements beforeIndex: index

_Synopsis_: Insert the elements of newElements in the receiver
immediately before the element at position index. Answer newElements.

_Definition_: Add the elements of newElements to the receiver in the
traversal order defined by #do: for newElements. The new elements are
inserted in the receiver immediately before the element in the
receiver at position index. If index equals the receiver’s size plus 1
newElements will be inserted at the end of the receiver.  The
parameter index must be a positive integer less than or equal to the
receiver’s size plus 1.

_Parameters_: newElements ⧼collection⧽ index ⧼integer⧽

_Errors_: If index ⧼=0.  If index > receiver’s size + 1.

### 5.7.18.10

_Message_: addAllFirst: newElements

_Synopsis_: Add each element of newElements to the beginning of the
receiver’s elements. Answer newElements.

_Definition_: This message is used to iteratively add each element of a
given collection to the beginning of the receiver’s elements.  The
operation is equivalent to adding each successive element of newElements
to the receiver using the #addFirst: message with the element as the
parameter, where the newElements are traversed in the order specified
by the #reverseDo: message for newElements.

_Parameters_: newElements ⧼sequencedCollection⧽

Cf: addAllFirst

### 5.7.18.11

_Message_: addAllLast: newElements

_Synopsis_: Add each element of newElements to the end of the receiver’s
elements. Answer newElements.

_Definition_: This message is used to iteratively add each element of a
given collection to the end of the receiver’s elements.  The operation
is equivalent to adding each successive element of newElements to the
receiver using the #addLast: message with the element as the
parameter, where the newElements are traversed in the order specified
by the #do: message for newElements.

_Return Values_: ⧼sequencedCollection⧽ parameter

Cf: addAllLast

### 5.7.18.12

_Message_: addFirst: newElement

_Synopsis_: Add newElement to the beginning of the receiver’s
elements. Answer newElement.

_Definition_: The newElement is added to the beginning of the
receiver’s elements so that it becomes the first element in the traversal
order.

Cf: addFirst

### 5.7.18.13

_Message_: addLast: newElement

_Synopsis_: Add newElement to the end of the receiver’s
elements. Answer newElement.

_Definition_: The newElement is added to the end of the receiver’s
elements so that it becomes the last element in the traversal order.

Cf: addLast

## 5.7.19

_Protocol_: ⧼Interval factory⧽

_Description_: Represents protocol for creating a collection whose
elements are numbers which form an arithmetic progression.

Cf: Range

### 5.7.19.1

_Message_: from: start to: stop

_Synopsis_: Answer an interval which represents an arithmetic
progression from start to stop in increments of 1.

_Definition_: Answer an interval which represents an arithmetic
progression from start to stop, using the increment 1 to compute each
successive element. The elements are numbers which have the same type
as start. Note that stop may not be the last element in the sequence;
the last element is given by the formula

	start + ((stop - start) // 1)

The interval answered will be empty (it will answer 0 to the #size
message) if start > stop

_Parameters_: start ⧼number⧽ stop ⧼number⧽

_Return Values_: ⧼Interval⧽

Cf: Range

### 5.7.19.2

_Message_: from: start to: stop by: step

_Synopsis_: Answer an interval which represents an arithmetic
progression from start to stop in increments of step.

_Definition_: Answer an interval which represents an arithmetic
progression from start to stop, using the increment step to compute each
successive element. The value of step can be positive or negative, but
it must be non-zero. The elements are numbers which have the most
general type of start and step. Note that stop is not necessarily an
element in the sequence; the last element is given by the formula

	(((stop - start) // step) * step) + start

The interval answered will be empty (it will answer 0 to the `#size`
message) if: start < stop and step < 0, or start > stop and step > 0.

_Parameters_: start ⧼number⧽ stop ⧼number⧽ step ⧼number⧽

_Return Values_: ⧼Interval⧽

_Errors_: step = 0

Cf: Range

## 5.7.20

_Protocol_: ⧼collection factory⧽

_Conforms To_: ⧼instantiator⧽

_Description_: Provides protocol for creating a collection of
objects. A collection can be fixed or variable sized, ordered or
unordered, and its elements may or may not be accessible by external keys.

### 5.7.20.2

_Message_: new: count

_Synopsis_: Create a new collection. The parameter count constrains
the number of elements in the result.

_Definition_: Return a new collection that has space for at least
count elements.  Conforming protocols may refine this message. In
particular, the effect of the parameter count should be specified in
refinements. It can be used to specify the exact number of elements,
the minimum number, or in some cases can even be interpreted as a hint
from the programmer, with no guarantee that the requested number of
instance variables will actually be allocated.  Unless otherwise
stated the initial values of elements, if any, of the new collection
are unspecified.

_Parameters_: count ⧼integer⧽

_Return Values_: ⧼collection⧽ new

Cf: new

# 5.8 Date and Time Protocols

The standard defines protocols for date and time objects that refer to a
specific point in time, and duration objects that represent a length of
time.

## 5.8.1

_Protocol_: ⧼DateAndTime⧽

_Conforms To_: ⧼magnitude⧽

_Description_; This protocol describes the behavior that is common to
date time objects. Date time objects represent individual points in
Coordinated Universal Time (UTC) as represented in an implementation
defined local time.  The exact properties of local times are
unspecified. Local times may differ in their offset from UTC.  A given
local time may have different offsets from UTC at different points in
time.  All dates and times in the UTC local time are in the Gregorian
calendar. Date times prior to the adoption of the Gregorian calendar
are given in the retrospective astronomical Gregorian calendar.  The
year 1 B.C. is astronomical Gregorian year 0. The year 2 B.C. is
astronomical Gregorian year -1. The year 1 A.D. is astronomical
Gregorian year 1. The offset of the UTC local time is zero.

Cf: Date

### 5.8.1.8

_Message_: dayOfMonth

_Synopsis_: Answer the number of the day in the month in the local
time of the receiver which includes the receiver.

_Definition_: Answer an ⧼integer⧽ between 1 and 31 inclusive
representing the number of the day in the month, in the local time of
the receiver, which includes the receiver.

_Return Values_: ⧼integer⧽

Cf: dayOfMonth

### 5.8.1.9

_Message_: dayOfWeek

_Synopsis_: Answer the number of the day in the week, in the local
time of the receiver, which includes the receiver.

_Definition_: Answer an ⧼integer⧽ between 1 and 7 inclusive
representing the number of the day in the week, in the local time of
the receiver, which includes the receiver. Sunday is 1, Monday is 2, and so on.

_Return Values_: ⧼integer⧽

Cf: dayOfWeek

### 5.8.1.12

_Message_: dayOfYear

_Synopsis_: Answer the number of the day in the year, in the local
time of the receiver, which includes the receiver.

_Definition_: Answer an ⧼integer⧽ between 1 and 366 inclusive
representing the number of the day in the year, in the local time of
the receiver, which includes the receiver.

_Return Values_: ⧼integer⧽

### 5.8.1.13

_Message_: hour

_Synopsis_: Answer the number of the hour in the day, in the local
time of the receiver, which includes the receiver.

_Definition_: Answer an ⧼integer⧽ between 0 and 23 inclusive
representing the number of the hour in the day, in the local time of
the receiver, which includes the receiver. It is implementation defined
whether a given local time uses the 12-hour clock or the 24-hour clock,
except that the UTC local time must use the 24-hour clock.

_Return Values_: ⧼integer⧽

Cf: hour

### 5.8.1.16

_Message_: isLeapYear

_Synopsis_: Test for leap year.

_Definition_: Answer true if the year, which includes the receiver, in the local
time of the receiver is a leap year, false otherwise.  Two ⧼DateAndTime⧽
objects that are equal can give different results for
#isLeapYear. Equality depends on their UTC time whereas #isLeapYear
depends on their local time.

_Return Values_: ⧼boolean⧽

### 5.8.1.18

_Message_: minute

_Synopsis_: Answer the minute of the hour in the local time of the
receiver.

_Definition_: Answer an ⧼integer⧽ between 0 and 59 inclusive
representing the minute of hour in the local time of the receiver.

_Return Values_: ⧼integer⧽

Cf: minute

### 5.8.1.19

_Message_: month

_Synopsis_: Answer the number of the month in the year, in the local
time of the receiver, which includes the receiver.

_Definition_: Answer an ⧼integer⧽ between 1 and 12 inclusive
representing the number of the month in the year, in the local time of
the receiver, which includes the receiver.

_Return Values_: ⧼integer⧽

Cf: month

### 5.8.1.25

_Message_: second

_Synopsis_: Answer the second of the minute of the local time of the
receiver.

_Definition_: Answer a ⧼number⧽ greater than or equal to 0 and strictly
less than 60 representing the second of the minute of the local time of the
receiver.

_Return Values_: ⧼number⧽

Cf: second

### 5.8.1.28

_Message_: year

_Synopsis_: Answer the number of the year in the local time of the
receiver which includes the receiver.

_Definition_: Answer an⧼integer⧽ the number of the year which includes the
receiver.

_Return Values_: ⧼integer⧽

Cf: year

## 5.8.2

_Protocol_: ⧼Duration⧽

_Conforms To_: ⧼magnitude⧽

_Description_: Represents a length of time.

Cf: Duration

### 5.8.2.8

_Message_: asSeconds

_Synopsis_: Answer the total number of seconds in the length of time
represented by the receiver.

_Definition_: Answer the total number of seconds in the length of time
represented by the receiver including any fractional part of a second. If
the receiver is less than ⧼Duration factory⧽ #zero then the result
will be less than 0.

_Return Values_: ⧼number⧽

Cf: asSeconds

### 5.8.2.10

_Message_: days

_Synopsis_: Answer the number of complete days in the receiver.

_Definition_: Answer the number of complete days in the receiver. If
the receiver is less than ⧼Duration factory⧽ #zero then the result
will be less than or equal to 0.

_Return Values_: ⧼integer⧽

Cf: days

### 5.8.2.11

_Message_: hours

_Synopsis_: Answer the number of complete hours in the receiver.

_Definition_: Answer an ⧼integer⧽ between -23 and 23 inclusive that
represents the number of complete hours in the receiver, after the
number of complete days has been removed. If the receiver is less than
<Duration factory⧽ #zero then the result will be less than or equal to
0.

_Return Values_: ⧼integer⧽

Cf: hours

### 5.8.2.12

_Message_: minutes

_Synopsis_: Answer the number of complete minutes in the receiver.

_Definition_: Answer an ⧼integer⧽ between -59 and 59 inclusive that
represents the number of complete minutes in the receiver, after the
number of complete days and hours have been removed. If the receiver is
less than ⧼Duration factory⧽ #zero then the result will be less than or
equal to 0.

_Return Values_: ⧼integer⧽

Cf: minutes

### 5.8.2.17

_Message_: seconds

_Synopsis_: Answer the number of seconds in the receiver.

_Definition_: Answer a ⧼number⧽ strictly greater than -60 and strictly
less than 60 that represents the number of seconds in the receiver,
after the complete days, hours, and minutes have been removed. If the
receiver is less than ⧼Duration factory⧽ #zero then the result will be
less than or equal to 0.

_Return Values_: ⧼number⧽

Cf: seconds

### 5.8.4.6

_Message_: now

_Synopsis_: Answer a ⧼DateAndTime⧽ representing the current date and
time.

_Definition_: Answer a ⧼DateAndTime⧽ representing the current date and
time in the local time specified by the implementation.

_Return Values_: ⧼DateAndTime⧽

Cf: now

# 5.9 Stream Protocols

This section includes protocols that define the fundamental behavior of
various kinds of streams.  Streams produce or consume a sequence of
values. Some stream classes will build sequenceable collections or
report the values of a sequenceable collection. Other types of streams
may operate on files, positive integers, random numbers, and so forth.
There are seven protocols that describe stream
behavior. ⧼sequencedStream⧽ describes a stream on a sequence of
objects and allows for positioning of the stream.<gettableStream⧽ allows
for reading from a stream. ⧼puttableStream⧽ allows for writing to a
stream. ⧼collectionStream⧽ provides for the association of a stream
with a collection. ⧼ReadStream⧽ reads a sequence of objects from a
preexisting collection and can peek at objects prior to reading
them. The objects written to a ⧼WriteStream⧽ are accumulated so they
can be independently accessed as a collection; ⧼ReadWriteStream⧽ can
read, peek, and write within a collection of objects.  The protocol
<Transcript⧽ defines the behavior of the object that is the value of
the global named Transcript. Transcript is a stream that may be used
to log textual message generated by a Smalltalk program.  There are
three factory protocols that specify the behavior of three global
stream factories, ReadStream, WriteStream, and ReadWriteStream, used to
create various types of streams.

### 5.9.1.2

_Message_: contents

_Synopsis_: Returns a collection containing the complete contents of
the stream.

_Definition_: Returns a collection that contains the receiver’s past and
future sequence values, in order. The size of the collection is the sum
of the sizes of the past and future sequence values.

_Return Value_: ⧼sequencedReadableCollection⧽

Cf: contents

### 5.9.1.4

_Message_: position

_Synopsis_: Returns the current position of the stream.

_Definition_: Returns the number of sequence values in the receiver’s
past sequence values.

_Return Value_: ⧼integer⧽

Cf: position

### 5.9.1.5

_Message_: position: amount

_Synopsis_: Sets the current position in a stream of values.

_Definition_: If the number of sequence values in the receiver’s past
sequence values is smaller than amount, move objects in sequence from
the front of the receiver’s future sequence values to the back of th
receiver’s past sequence values until the number of sequence values in
the receiver’s past sequence values is equal to amount.  If the number
of sequence values in the receiver’s past sequence values is greater
than amount, move objects in sequence from the back of the receiver’s
past sequence values to the front of th receiver’s future sequence
values until the number of sequence values in the receiver’s past
sequence values is equal to amount.  If the number of sequence values
in the receiver’s past sequence values is equal to amount no action is
taken.

_Parameters_: amount ⧼integer⧽

_Errors_: If amount is negative.  If the receiver has any sequence
values and amount is greater than or equal to the total number of
sequence values of the receiver.

Cf: position

### 5.9.1.6

_Message_: reset

_Synopsis_: Resets the position of the receiver to be at the beginning
of the stream of values.

_Definition_: Sets the receiver’s future sequence values to be the
current past sequence values appended with the current future sequence
values. Make the receiver’s past sequence values be empty.

Cf: reset

### 5.9.1.7

_Message_: setToEnd

_Synopsis_: Set the position of the stream to its end.

_Definition_: All of the receiver’s future sequence values are
appended, in sequence, to the receiver’s past sequence values. The
receiver then has no future sequence values.

## 5.9.2

_Protocol_: ⧼gettableStream>

_Description_: An object conforming to ⧼gettableStream⧽ can read
objects from its future sequence values.

### 5.9.2.1

_Message_: atEnd

_Synopsis_: Returns a Boolean indicating whether the receiver is at
the end of its values.

_Definition_: Return true if the receiver has no future sequence values
available for reading. Return false otherwise.

_Return Value_: ⧼boolean⧽

Cf: atEnd

### 5.9.2.3

_Message_: next

_Synopsis_: Return the next object in the receiver.

_Definition_: The first object is removed from the receiver’s future
sequence values and appended to the end of the receiver’s past sequence
values. That object is returned as the value of the message. The
returned object must conform to the receiver’s sequence value type.
The result is undefined if the receiver has no future sequence values.

Cf: next

### 5.9.2.4

_Message_: next: amount

_Synopsis_: Returns a collection of the next amount objects in the
stream.

_Definition_: A number of objects equal to amount are removed from the
receiver’s future sequence values and appended, in order, to the end of
the receiver’s past sequence values. A collection whose elements
consist of those objects, in the same order, is returned. If amount is
equal to 0 an empty collection is returned.  The result is undefined if amount
is larger than the number of objects in the receiver’s future sequence
values.

_Parameters_: amount ⧼integer⧽

_Return Value_: ⧼sequencedReadableCollection⧽ new

_Errors_: amount < 0

Cf: next

### 5.9.2.6

_Message_: nextMatchFor: anObject

_Synopsis_: Reads the next object from the stream and returns true if the
object is equivalent to the argument and false if not.

_Definition_: The first object is removed from the receiver’s future
sequence value and appended to the end of the receiver’s past sequence
values. The value that would result from sending #= to the object with
anObject as the argument is returned.  The results are undefined if there are
no future sequence values in the receiver.

_Parameters_: anObject ⧼Object⧽

_Return Value_: ⧼boolean⧽

Cf: nextMatchFor

### 5.9.2.7

_Message_: peek

_Synopsis_: Returns the next object in the receiver’s future sequence
values without advancing the receiver’s position. Returns nil if the
receiver is at end of stream.

_Definition_: Returns the first object in the receiver’s future sequence
values. The object is not removed from the future sequence values. The
returned object must conform to the receiver’s sequence value type.
Returns nil if the receiver has no future sequence values. The return value
will also be nil if the first future sequence object is nil.

Cf: peek

### 5.9.2.8

_Message_: peekFor: anObject

_Synopsis_: Peeks at the next object in the stream and returns true if it
matches the argument, and false if not.

_Definition_: Returns the result of sending #= to the first object in the
receiver’s future sequence values with anObject as the
argument. Returns false if the receiver has no future sequence values.

_Return Value_: ⧼boolean⧽

Cf: peekFor

### 5.9.2.9

_Message_: skip: amount

_Synopsis_: Skips the next amount objects in the receiver’s future
sequence values.

_Definition_: A number of objects equal to the lesser of amount and the
size of the receiver’s future sequence values are removed from the
receiver’s future sequence values and appended, in order, to the end of
the receiver’s past sequence values.

_Parameters_: amount ⧼integer⧽

Cf: skip

### 5.9.2.10

_Message_: skipTo: anObject

_Synopsis_: Sets the stream to read the object just after the next
occurrence of the argument and returns true. If the argument is not found
before the end of the stream is encountered, false is returned.

_Definition_: Each object in the receiver’s future sequence values up
to and including the first occurrence of an object that is equivalent to
anObject is removed from the future sequence values and appended to the
receiver’s past sequence values. If an object that is equivalent to
anObject is not found in the receiver’s future sequence values, all of
the objects in future sequence values are removed from future sequence
values and appended to past sequence values. If an object equivalent to
anObject is not found false is returned. Otherwise return true.

_Return Value_: ⧼boolean⧽

Cf: skipTo

### 5.9.2.11

_Message_: upTo: anObject

_Synopsis_: Returns a collection of all of the objects in the receiver
up to, but not including, the next occurrence of the argument. Sets the
stream to read the object just after the next occurrence of the
argument.  If the argument is not found and the end of the stream is
encountered, an ordered collection of the objects read is returned.

_Definition_: Each object in the receiver’s future sequence values up
to and including the first occurrence of an object that is equivalent to
anObject is removed from the future sequence values and appended to the
receiver’s past sequence values. A collection, containing, in order,
all of the transferred objects except the object (if any) that is
equivalent to anObject is returned. If the receiver’s future sequence
values is initially empty, an empty collection is returned.

_Return Value_: ⧼sequencedReadableCollection⧽ new

Cf: upTo

## 5.9.3

_Protocol_: ⧼collectionStream>

_Conforms To_: ⧼sequencedStream>

_Description_: An object conforming to ⧼collectionStream⧽ has a
⧼sequencedReadableCollection⧽ as its stream backing store.

## 5.9.4

_Protocol_: ⧼puttableStream>

_Description_: An object conforming to ⧼puttableStream⧽ allows objects
to be added to its past sequence values.

### 5.9.4.1

_Message_: cr

_Synopsis_: Writes an end-of-line sequence to the receiver.

_Definition_: A sequence of character objects that constitute the
implementation-defined end-of-line sequence is added to the receiver
in the same manner as if the message #nextPutAll: was sent to the
receiver with an argument string whose elements are the sequence of
characters.

_Errors_: It is erroneous if any element of the end-of-line sequence
is an object that does not conform to the receiver’s sequence value
type.

### 5.9.4.2

_Message_: flush

_Synopsis_: Update a stream’s backing store.

_Definition_: Upon return, if the receiver is a write-back stream, the
state of the stream backing store must be consistent with the current
state of the receiver.  If the receiver is not a write-back stream, the
effect of this message is unspecified.

### 5.9.4.3

_Message_: nextPut: anObject

_Synopsis_: Writes the argument to the stream.

_Definition_: Appends anObject to the receiver’s past sequence
values. If the receiver’s future sequence values is not empty, removes
its first object.

_Errors_: It is erroneous if anObject is an object that does not conform
to the receiver’s sequence value type.

Cf: nextPut

### 5.9.4.4

_Message_: nextPutAll: aCollection

_Synopsis_: Enumerates the argument, adding each element to the receiver

_Definition_: Has the effect of enumerating the aCollection with the
message #do: and adding each element to the receiver with #nextPut:. That
is, aCollection do: [:each | receiver nextPut: each]

_Parameters_: aCollection ⧼collection⧽

_Errors_: It is erroneous if any element of aCollection is an object
that does not conform to the receiver’s sequence value type.

Cf: nextPutAll

### 5.9.4.5

_Message_: space

_Synopsis_: Writes a space character to the receiver.

_Definition_: The effect is the same as sending the message #nextPut:
to the receiver with an argument that is the object that is the value
returned when the message #space is sent to the standard global
Character.

_Errors_: It is erroneous if the space character is an object that
does not conform to the receiver’s sequence value type.

### 5.9.4.6

_Message_: tab

_Synopsis_: Writes a tab character to the receiver.

_Definition_: The effect is the same as sending the message #nextPut:
to the receiver with an argument that is the object that is the value
returned when the message #tab is sent to the standard global
Character.

_Errors_: It is erroneous if the tab character is an object that does
not conform to the receiver’s sequence value type.

## 5.9.5

_Protocol_: ⧼ReadStream>

_Conforms To_: ⧼gettableStream⧽ ⧼collectionStream>

_Description_: An object conforming to ⧼ReadStream⧽ has a positionable
sequence of values that can be read.  The sequence values are provided
by a sequenced collection that serves as the stream backing store.

## 5.9.6

_Protocol_: ⧼WriteStream>

_Conforms To_: ⧼puttableStream⧽ ⧼collectionStream>

_Description_: ⧼WriteStream⧽ An object conforming to ⧼WriteStream⧽ has
a positionable sequence of values to which new values may be
written. The initial sequence values are provided by a collection that
serves as the stream backing store. It is implementation defined
whether a ⧼WriteStream⧽ is a write-back stream. Even if a
<WriteStream⧽ is not a write-back stream, its associated collection may
be subject to modification in an unspecified manner as long as it is
associated with the stream.

Cf: WriteStream

## 5.9.7

_Protocol_: ⧼ReadWriteStream>

_Conforms To_: ⧼ReadStream⧽ ⧼WriteStream>

_Description_: An object conforming to ⧼ReadWriteStream⧽ can read from
its future sequence values or write to its past sequence values. The
sequence values are provided by a collection that serves as the stream
backing store. It is implementation defined whether a
<ReadWriteStream⧽ is a write-back stream. Even if a ⧼ReadWriteStream>
is not a write-back stream, its associated collection may be subject to
modification in an unspecified manner as long as it is associated with
the stream.

## 5.9.8

_Protocol_: ⧼Transcript>

_Conforms To_: ⧼puttableStream>

_Description_: An object conforming to ⧼Transcript⧽ is a
<puttableStream⧽ for logging status messages from Smalltalk
programs. The sequence value type of ⧼Transcript⧽ is
⧼character⧽. There may be an implementation defined stream backing
store that receives characters written to the stream in an
implementatiuon defined manner.

### 5.9.9.1

_Message_: on: aCollection

_Synopsis_: Returns a stream that reads from the given collection.

_Definition_: Returns an object conforming to ⧼ReadStream⧽ whose
future sequence values initially consist of the elements of
aCollection and which initially has no past sequence values. The
ordering of the sequence values is the same as the ordering used by
#do: when sent to aCollection. The stream backing store of the
returned object is aCollection.

_Parameters_: aCollection ⧼sequencedReadableCollection⧽

_Return Value_: ⧼ReadStream⧽ new

### 5.9.10.1

_Message_: with: aCollection

_Synopsis_: Returns a stream that reads the elements of the given
collection and can write new elements.

_Definition_: Returns an object conforming to ⧼ReadWriteStream⧽ whose
past sequence values initially consist of the elements of aCollection
and which initially has no future sequence values. The ordering of the
sequence values is the same as the ordering used by #do: when sent to
aCollection. The stream backing store of the returned object is
aCollection. The sequence value type of the write stream is the
element type of aCollection. Any restrictions on objects that may be
elements of aCollection also apply to the stream’s sequence elements.

_Parameters_: aCollection ⧼sequencedCollection⧽

_Return Value_: ⧼ReadWriteStream⧽ new

# 6. Glossary

The Smalltalk standard defines and uses the following terms:

- _abnormal termination_: Termination of a block evaluation in any
manner that would not have resulted in the normal return of a result
from a `value` message if that message had been used to initiate the
evaluation. Abnormal termination occurs when code in a block executes
a return statement or when any action external to the block
permanently and irrevocably terminates evaluation of the block.

- _advance_: To move a stream forward. Reading from a ⧼readableStream⧽ adds the
read object to the stream’s past sequence values and removes it from
the stream’s future sequence values.

- _argument_: An object encapsulated in a message that is required by the receiver to
perform the operation being requested.

- _array_: A data structure whose elements are associated with integer indices.

- _assignment_: An expression describing a change of a variable’s value.

- _binary message_: A message with one argument whose selector is made up of one or two
special characters.

- _bind_: To cause a variable to refer to an object.

- _block_: Certain valuables called blocks have their evaluation rules determined by
the syntax and semantics of the Smalltalk language. For details of how
blocks are evaluated in context, refer to the Block Syntax section of the
specification.

- _block argument_: A parameter that must be supplied when certain blocks are evaluated.

- _cascading_: A description of several messages to one object in a single expression.

- _class definition_: The Smalltalk language construct that defines the representation and
behavior of instance objects and a globally named class object that
implements the class behavior.

- _class object_: An object defined by a class definition that responds to the class
messages and which has a global name binding.

- _closure_: The result of evaluating a block; the representation of the context of
execution of all enclosing blocks.

- _comparable_: Two objects are comparable if there is an ordering defined between
them. While there is no precise way to define which objects have such
an ordering, it is generally the case that such objects must both conform
to another common protocol in addition to ⧼magnitude⧽. For example, all
objects that conform to the protocol ⧼number⧽ are comparable.

- _context_: The values of variables defined within a block during a particular
execution of the method represented by that block.

- _default action_: The method that is executed in response to an exception if the current
exception environment does not contain an exception handler that
handles the exception.

- _element_: An object is an element of a collection if the object will be passed as an
argument to the argument of the message `#do:`.

- _element type_: A set of acceptable objects for elements of a collection. Unless
otherwise specified, the element type of a collection is ⧼Object⧽.

- _equivalent_: Two objects are considered equivalent if the result of sending the
message `#=` to one of the objects with the other object as the argument
returns true.

- _evaluation context_: The stack of suspended method and block activations that represents
the continuation at a point of execution in the program.

- _exception action_: The object conforming to the protocol ⧼valuable⧽ that will be evaluated if
its containing exception handler is selected to service an exception.

- _exception environmen_:t An abstract entity that is a LIFO list of exception handlers. An exception
environment may be logically searched starting from the most recently
"pushed" exception handler.

- _exception handler_: An abstract entity that associates an exception selector with an
exception action for the duration of a protected block. During the
evaluation of the protected block, occurrence of an exceptional condition
that matches the exception selector will result in the execution of the
exception action. An exception handler is established by sending the
message `#on:do:` to the protected block with the exception selector as
the first argument and the exception action as the second argument.

- _exception selector_: An object conforming to the protocol ⧼exceptionSelector⧽ that is
contained in an exception handler and used to determine whether the
handler should be used to service an exception.

- _expression_: A sequence of characters that describes an object.

- _false_: The value of the reserved identifier "false".

- _fragile_: The implementation of a class’s behavior is fragile if it is possible for
method in a subclass by the mere fact of its existence to inadvertently
cause methods inherited from the class to malfunction. Implementation
may use underscore prefixed method selectors or other implementation
specific means to implement classes in a non-fragile manner.

- _future sequence values_: The sequence values yet to be read by a stream.

- _general subclass_: Any class that either directly or indirectly inherits from a superclass is a
general subclass of the superclass.

- _handle_: An exception handler is said to handle an exception if its exception
selector will respond with true if asked if it should service the exception.

- _handler block_: A block that is specified as an exception action.

- _handler environment_: The state of the current exception environment as it existed immediately
before the execution of the `#on:do:` message that establishes a new
exception handler.

- _hash value_: The non-negative integer result of sending the message `#hash` to an
object.

- _identical_: Two objects are considered identical if they are the same object. In other
workds, the result of sending the message `#==` to one of the objects with
the other object as the argument is true.

- _identifier_: A lexical representation for variables and selectors.

- _identity hash value_: The non-negative integer result of sending the message
`#identityHash` to an object.

- _identity object_: An object defined such that a=b implies a==b

- _immutable object_: An object whose state cannot be modified.

- _key_: A key is an object used to selectively access a single element of a
collection. Not all collections support the use of keys to access of their
elements.

- _key equivalence_: The operation used to compare keys in a dictionary. Protocols that
refine ⧼abstractDictionary⧽ must define the meaning of this term.

- _key lookup_: Lookup of a key in a dictionary using key equivalence.

- _keyword_: An identifier with a trailing colon.

- _keyword message_: A message with one or more arguments whose selector is made up of
one or more keywords.

- _lexical order_: Ordering two sequences of values by comparing their elements in order.
The first two elements that differ determine the order.

- _literal_: An expression describing a constant, such as a number or string.

- _local time_: A system of measuring and describing time. Local times specify the
abbreviations, names, and numberings for various components of a date
time.

- _message argument_: An object that specifies additional information for an operation.

- _message selector_: The name of the type of operation a message requests of its receiver.

- _method_: The executable representation of an operation. It consists of zero or
more parameters and a number of expressions that are evaluated
sequentially.

- _nil_: The value of the reserved identifier "nil".

- _numeric representation_: The numeric representation of a numeric object is an implementation
dependent representation of a set of numbers conforming to a specific
protocol. A numeric representation may include limits on precision and
range of its values.

- _past sequence values_: The sequence values already read, written, or skipped by a stream.

- _precision_: The precision of a numeric representation is the number of significant
digits in the representation.

- _program_: A description of the data and operations that comprise a computation.

- _protected block_: An object conforming to the protocol ⧼valuable⧽ that is the scope over
which an exception handler is active.

- _pseudo variable name_: An expression similar to a variable name. However, unlike a variable
name, the value of a pseudo variable name cannot be changed by an
assignment.

- _range_: The range of a numeric representation is the set of number between the
upper and lower bounds.

- _receiver_: The object to which a message is sent.

- _resumable_: An exception for which it is possible to resume execution from the point
at which the exception was signaled.

- _resumption value_: The value that is returned to the signaler from the exception action of a
resumable exception.

- _scope_: The mechanism by which the language restricts the visibility of variables.
A name can be declared to have local scope within a block or method.
Scopes can be nested. A name declared local to a scope represents the
same entity within that scope, and all scopes nested within it.

- _sequence value_: A value in a stream.

- _signaled exception_: During the signaling of an exception, the object conforming to the
protocol ⧼exceptionDescription⧽ that describes the exception and which
is used to select an exception handler.

- _signaling environment_: The state of the current exception environment at the time that an
exception is signaled.

- _sort block_: A ⧼dyadicValuable⧽ object used by ⧼SortedCollection⧽ objects to order
their elements. The sort block must return a ⧼boolean⧽ result.

- _stream backing store_: An object or external data store which provides or receives the sequence
values of the associated stream.

- _subexception_: An exception that is a specialization of another exception. An exception
handler for the more general exception will also serve as an exception
handler for the subexception.

- _symbol_: A string whose sequence of characters is guaranteed to be different from
that of any other symbol.

- _temporally invariant_: A message is temporally invariant if the repeated application of the
message to identical receivers and arguments will always yield an
equivalent result.

- _true_: The value of the reserved identifier "true".

- _unary message_: A message without arguments.

- _unbounded precision_: A numeric representation has unbounded precision if it can precisely
represent all numbers conforming to its protocol.

- _value_: The result of evaluating an object conforming to the protocol ⧼valuable⧽.

- _variable name_: An expression describing the current value of a variable.

- _white space_: Characters that serve as token separators; ignored in a program parse.

- _write-back stream_: A stream that supports the writing of objects and that has a stream
backing store that receives the objects written to the stream. A buffer
may exist between a write-back stream and its stream backing store and
there may be a latency between the time an object is written to the
stream and its appearance in the backing store.
