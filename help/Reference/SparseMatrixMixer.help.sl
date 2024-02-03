# SparseMatrixMixer

_SparseMatrixMixer(numOutputs, inputArray, sparseMatrix)_

Mixes _inputArray_ to an array of _numOutputs_ places according to _sparseMatrix_.

Each element at _sparseMatrix_ is a triple of _(inputIndex, outputIndex, gain)_,
allowing arbitrary mapping of inputs to outputs.
Outputs are zeroed and each matrix element summed in.

Mix the first and third inputs to the first and second outputs at unity gain:

```
SparseMatrixMixer(2, SinOsc([111 333 555], 0) / 11, [1 1 1; 3 2 1])
```

Mix the fourth and first inputs to the first and second outputs at -18 and -24 decibels:

```
SparseMatrixMixer(2, SinOsc([111 333 555 777], 0), [4 1 0.125; 1 2 0.06])
```

* * *

See also: Mix, Sum
