# Glossary of Terms

- _Adverb_:
An adverb is a _block_ that modifies the behaviour of another block.
Cf: Operator Adverbs

- _Answer_:
The value produced by executing a _program_,
also called the _result_.

- _Argument_:
A value that is supplied to a _block_ when it is evaluated,
also called a _parameter_ or an _input_.

- _Arithmetic Progression_:
A sequence of numbers such that the difference from each item to the preceding item is constant.
Cf: ArithmeticProgression

- _Arity_:
The number of arguments a _behaviour_ can accept,
also called _valence_.
Cf: numArgs

- _Array_:
A _collection_ of values arranged along zero or more orthogonal _axes_.
Each value is identified by an _index list_, specifying one index value for each axis.
_Regular arrays_ are rectangular and have a _shape_.
Cf: rank, shape

- _Ascii_:
An interpretation of _bytes_ as _characters_ according to the
[Ascii](https://en.wikipedia.org/wiki/ASCII) standard.

- _Associativity_:
Associativity determines how operators of equal _precedence_ are grouped in the absence of parentheses.

- _Assignment_:
Attach a _value_ to a _name_, thus defining or re-defining the name.
Assignment is particularly used for the latter case,
the former case is usually called a _binding_ or a _definition_.
Cf: Assignment Syntax

- _Atom_:
Any value that is not a _collection_,
also called a _scalar_.

- _Axis_:
One of the dimensions along which the items in an _array_ are arranged.
Cf: shape

- _Behaviour_:
The subset of objects that can be evaluated to perform a computation,
ordinarily a _block_ or a _method_.
Cf: Block, Method

- _Binary Function_:
A _function_ of two _arguments_, such as _+_ or _min_.
Cf: Operator Syntax

- _Binding_:
The value that is associated with a name,
or the expression that associates a value with a name.
Cf: Assignment Syntax, Let Syntax

- _Bit_:
An _integer_ value that is either zero or one.
Cf: asBit, boole

- _Block_:
The _behaviour_ type,
also called a _function_ or a _procedure_ or a _verb_.
Cf: Block

- _Body_:
The _sequence_ of _statements_ that define a _block_.

- _Boolean_:
A logic _type_ that has the values _true_ and _false_.
Comparisons and tests, such as `=`, `<`, `&` and `|` produce boolean values,
and are called _predicates_.
Cf: Boolean

- _Byte_:
An _integer_ with 8-bits of precision that can represent 256 values.
Cf: isByte

- _Character_:
A _type_ representing one item in a _string_.
A drawing of a character is called a _glyph_.
A character has a _unicode code point_.
Cf: Character

- _Cent_:
The unit of interval measure.
The hundredth part of an equal semitone.

- _Closed interval_:
A closed interval is an interval that includes its limit points.
Closed intervals are written in square brackets.
Cf: Interval, Range

- _Code Point_:
The integer value of a _character_ in the _Unicode_ specification.
Cf: codePoint

- _Collection_:
A _trait_ that describes container types that hold zero or more items,
or a _type_ that implements such a trait.
Cf: Collection

- _Column_:
The second axis of a _matrix_ or a _table_.

- _Column vector_:
A _matrix_ with a single column, the _transpose_ of a _row vector_.

- _Complex_:
A numeric _type_ that stores the real and imaginary parts of complex numbers.
If the components are both _integers_ it is called a _Gaussian integer_.
Cf: Complex

- _Dispatch_:
The process of selecting the precise meaning of a polymorphic name within a particular context.
Selection that considers a single aspect of the context is called _single dispatch_,
selection that considers multiple aspects is called _multiple dispatch_.

- _Domain_:
The domain of a _function_ is the set of values for which is is defined.

- _Element_:
An item in a _collection_.

- _Element type_:
The type of all elements in a _homogeneous collection_.
Cf: elementType

- _Equal_:
A comparison that decides if two values are equal.
Values may be equal without being _identical_.
Cf: =

- _Float_:
A number stored in IEEE-754 double-precision floating-point format.
Cf: SmallFloat

- _Fraction_:
A numeric type that stores rational real numbers as a _numerator_ and _denominator_.
Cf: Fraction

- _Function_:
A _behaviour_, particularly one that answers equal values for equal inputs and has no _side effects_.
Informally used to refer to _blocks_ and _procedures_.
[[1](https://mathworld.wolfram.com/Function.html)]

- _Geometric Progression_:
A sequence of non-zero numbers where ratio between each item and the preceding item is constant.

- _Glyph_:
A glyph is the specific shape, design, or representation of a _character_.

- _Head_:
The first item is a _sequence_ or along an _axis_.
Cf: first

- _Identical_:
A comparison that decides if two values are identical.
Values may be _equal_ without being identical.
Cf: ==

- _Identity Element_:
The identity element of a _binary function_ is the value for which it will answer the other argument.
For addition it is zero, for multiplication it is one.

- _Identity Function_:
The _unary function_ that answers its _argument_.
Cf: identity

- _Identity Operator_:
The operator that decides if two values are _identical_.
Cf: ==

- _Immediate Value_:
A value that will compare as _identical_ if it compares as _equal_.
Cf: isImmediate

- _Infinity_:
The floating point numeric values representing positive or negative infinity,
written `inf`.
Cf: inf, Infinity, isFinite

- _Infix_:
A form of notation where a _verb_ is written between two _nouns_,
as distinct from _prefix_ and _postfix_ notations.
Cf: Infix Method Syntax, Operator Syntax

- _Integer_:
A numeric _trait_ describing whole numbers.
Cf: Integer

- _Interval_:
A numeric _type_ described by minimum and maximum values.
Cf: Interval

- _Item_:
An _element_ in a _collection_.

- _Leaf_:
An item in a _collection_ that is not itself a _collection_.
Cf: isLeaf

- _Level_:
The _depth_ of an _item_ in a _nested collection_.
Cf: depth, level

- _List_:
A _collection type_ that stores a _sequence_ of _items_.
Cf: List

- _Literal_:
A value for which the grammar includes a written notation,
a value that is written using such a notation.
Cf: Literals Syntax

- _Matrix_:
An _array_ of _rank_ two, or a two-dimensional array.
Cf: Matrix

- _Method_:
A named _behaviour_ that is associated with a _type_.
Cf: Method

- _Name_:
A sequence of characters that follow a set of lexical rules and name a value.

- _Noun_:
Informally, a value that is not a _verb_ or _behaviour_.

- _Number_:
A numeric value, either a constant or computed value.
Cf: Number

- _Numeric_:
A type of value representing numbers.
Cf: Complex, Fraction, LargeInteger, SmallFloat

- _Object_:
A _trait_ that implement the fundamental behaviours for values in the system,
or any value in the system.
Cf: Object

- _Operand_:
A value supplied to a _block_ when it is executed,
also called an _argument_ or a _parameter_.

- _Operator_:
A _behaviour_ that is named using a distinct lexical rule so that it may be written _infix_.
Cf: Operator Syntax

- _Parsing_:
The process of analyzing a string of symbols as a sentence according to a formal grammar.

- _Polymorphism_:
The use of one symbol to represent different meanings in different contexts.

- _Precedence_:
The rules for deciding the order of evaluation of parts of a program.
[[1](https://mathworld.wolfram.com/Precedence.html)]

- _Precision_:
An attribute of a number indicating the range of values that can be represented within its type.

- _Predicate_:
A _block_ that answers a _boolean_.

- _Prefix_:
An infix that includes the first, or head, index-0 item.

- _Primitive_:
A _behaviour_ whose definition is built in to the system.
Cf: Primitive Syntax

- _Primitive Type_:
A _type_ that is built in to the language interpreter.

- _Procedure_:
A _behaviour_, particularly one whose execution involves _side effects_,
as distinct from a _function_.

- _Program_:
A _behaviour_ that can be _evaluated_ to give an _answer_.

- _Range_:
The range, also called _image_, of a function is the set of possible answer values.
A range is also a finite arithmetic progression.
Cf: Range

- _Rank_:
The number of axes along which the items of an _array_ are arranged.
Cf: rank

- _Rank Polymorphism_:
Rank polymorphic functions operate on arrays of any shape and size.
Cf: rank, shape, size

- _Recursive_:
Any value, including _behaviours_, whose definition refers to itself.

- _Result_:
The value produced by executing a _program_,
also called the _answer_.

- _Row_:
The first axis of a _matrix_ or a _table_.

- _Row vector_:
A _matrix_ with a single row, the _transpose_ of a _column vector_.

- _Scalar_:
A scalar is any non-composite value.
In particular used to distinguish values that are not _vectors_ or _matrices_ or _arrays_.

- _Sequence_:
A _collection trait_ for collections that have an ordering.
Sequences are indexed by positive integers between one and the size of the collection.
Cf: Sequence

- _Shape_:
The list of the lengths of the axes of an _array_.
Cf: shape

- _Side effect_:
Of a _behaviour_ that has an observable effect other than its primary effect of answering a value.

- _String_:
A _sequence_ of _characters_.
Cf: String

- _Superparticular Ratio_:
A superparticular or epimoric ratio is the ratio of two consecutive integers.
Cf: isSuperparticular

- _Ternary Function_:
A _function_ of three _arguments_, such as _betweenAnd_.

- _Trait_:
A named collection of behaviours that can be implemented (or inherited) by a _type_.
Cf: Trait

- _Tuple_:
A _sequence type_ that is less general than `List`.
Cf: Tuple

- _Unary Function_:
A _function_ of one _argument_, such as _negated_.

- _Unicode Character_:
A character encoded according to the [Unicode](http://www.unicode.org/) specification.

- _Url_:
A _Uniform Resource Locator_, the address of a unique resource on the internet.

- _Utf-8_:
A method of representing _unicode_ character values as a sequence of bytes.

- _Valence_:
The number of arguments a _block_ can accept,
also called _arity_.
Cf: numArgs

- _Value_:
An entity in a program.
Values are attached to a name through assignment.
When a name is encountered it is replaced by its value.

- _Vector_:
An array with one axis,
also called a _list_ or a _sequence_.
Cf: isVector, Vector Syntax

- _Verb_:
A _behaviour_ object, as distinct from a _noun_ or _value_ object.
Cf: Block

- _Volume_:
An _array_ of _rank_ three, or a three-dimensional array.
Cf: isVolume, Volume Syntax

- _Whitespace_:
A string of one or more blank characters, either spaces, tabs, carriage returns or line feeds (new lines).
Cf: isSeparator

* * *

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/Glossary),
_Smalltalk_
6
