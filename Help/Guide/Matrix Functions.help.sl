# Matrix Functions

Traits and Types:

- `List`
- `Matrix`
- `NumericArray`

General Constructors

- `antidiagonalArray`
- `array`
- `binaryMatrix`
- `centerArray`
- `constantArray`
- `dispersionArray`
- `integerSequenceMatrix`
- `iota`
- `repeatMatrix`
- `reshape`
- `table`
- `triangularArray`

Specific Matrices:

- `adjacencyMatrix`
- `antidiagonalMatrix`
- `blockDiagonalMatrix`
- `boxMatrix`
- `cauchyMatrix`
- `cayleyMengerMatrix`
- `circulantMatrix`
- `condensedDistanceMatrix`
- `connectionMatrix`
- `crossMatrix`
- `designMatrix`
- `diagonalMatrix`
- `diamondMatrix`
- `diskMatrix`
- `distanceMatrix`
- `drawdownMatrix`
- `eulerMatrix`
- `evoluteSpiralMatrix`
- `exchangeMatrix`
- `fourierMatrix`
- `frobeniusCompanionMatrix`
- `gaussianMatrix`
- `graphDistanceMatrix`
- `hadamardMatrix`
- `hankelMatrix`
- `helicalScanMatrix`
- `hilbertMatrix`
- `homogeneousTranslationMatrix`
- `identityMatrix`
- `incidenceMatrix`
- `intervalMatrix`
- `kirchhoffMatrix`
- `lambdomaMatrix`
- `liftplanMatrix`
- `pascalMatrix`
- `permutationMatrix`
- `recurrenceMatrix`
- `reflectionMatrix`
- `repeatMatrix`
- `rotationMatrix`
- `scalingMatrix`
- `seidelAdjacencyMatrix`
- `singleEntryMatrix`
- `spiralMatrix`
- `stochasticMatrix`
- `stolarskyArray`
- `sylvesterMatrix`
- `threadingMatrix`
- `tieupMatrix`
- `toeplitzMatrix`
- `vandermondeMatrix`
- `walshMatrix`
- `welchCostasArrayList`
- `wythoffArray`
- `zeroMatrix`
- `zigzagMatrix`

Converting:

- `asList`: convert matrix to list of lists
- `asMatrix`: convert list of lists to matrix
- `fromTrilinearVertexMatrix`

Querying:

- `elementType`: type of elements
- `numberOfColumns`: number of columns
- `numberOfRows`: number of rows
- `shape`: number of rows and columns

Accessing:

- `column`
- `columns`
- `row`
- `rows`
- `submatrix`

Rearranging:

- `flipLeftRight`
- `padLeft`
- `padRight`
- `squareForm`
- `swapColumns`
- `swapRows`

Predicates:

- `isAntisymmetricMatrix`
- `isBinaryMatrix`
- `isBisymmetricMatrix`
- `isCentrosymmetricMatrix`
- `isDiagonalMatrix`
- `isDiagonallyDominantMatrix`
- `isIntegerMatrix`
- `isInvolutoryMatrix`
- `isLowerTriangularMatrix`
- `isMatrix`
- `isNormalMatrix`
- `isOrthogonalMatrix`
- `isSignatureMatrix`
- `isSquareMatrix`
- `isSymmetricMatrix`
- `isUnitaryMatrix`
- `isUpperTriangularMatrix`

General:

- `adjugate`: adjugate or adjoint
- `antitranspose`: antitransposition
- `arrayFlatten`: flatten a matrix of matrices
- `arrayRules`: positions and values of non-zero elements
- `choleskyDecomposition`: the Cholesky decomposition
- `conjugateTranspose`: conjugate transpose (Hermitian conjugate)
- `determinant`: determinant
- `dot`: outer product
- `gramSchmidtProcess`: Gram-Schmidt
- `gaussJordanInverse`: inverse
- `inner`: outer product
- `inverse`: inverse of a square matrix
- `kroneckerProduct`
- `luDecomposition`: the LU decomposition
- `matchPairs`
- `matrixPower`: matrix power
- `matrixPrintString`: two dimensional matrix text format
- `matrixRank`: matrix rank, the number of linearly independent rows or columns
- `matrixRotate`: matrix rotation
- `minor`: the indicated minor of a matrix
- `minors`: the minors of a matrix
- `orthogonalize`
- `outer`: outer product
- `permanent`: permanent of a square matrix
- `qrDecomposition`: the QR decomposition
- `ravel`: ravel order list
- `reducedRowEchelonForm`: in place row reduce
- `rowReduce`: simplified matrix obtained by making linear combinations of rows
- `shape`: list the dimensions of a matrix
- `singularValueDecomposition`
- `trace`: trace
- `transpose`: transposition

Graph:

- `adjacencyMatrix`: vertex–vertex adjacency matrix of a graph
- `connectionMatrix`: vertex–vertex connection matrix of a graph
- `incidenceMatrix`: vertex-edge incidence matrix of a graph

Geometry:

- `eulerMatrix`: Euler rotation matrix
- `reflectionMatrix`: reflection matrix
- `rotationMatrix`: rotation matrix
- `scalingMatrix`: scaling matrix

Linear Systems:

- `gaussianElimination`
- `leastSquares`
- `thomasAlgorithm`

Weaving:

- `WeavingInformationFile`
- `drawdownMatrix`
- `liftplanMatrix`
- `threadingMatrix`
- `tieupMatrix`

Plotting:

- `Bitmap`
- `Greymap`
- `Image`
- `matrixPlot`

Tuning:

- `intervalMatrix`: interval matrix

Algorithms:

- `kuhnMunkresAlgorithm`

Sorting Matrix

- `bitonicSortMatrix`
- `bubbleSortMatrix`
- `combSortMatrix`
- `cycleSortMatrix`
- `gnomeSortMatrix`
- `insertionSortMatrix`
- `mergeSortMatrix`
- `oddEvenSortMatrix`
- `quickSortMatrix`
- `radixSortMatrix`
- `selectionSortMatrix`
- `shellSortMatrix`
- `shuffleSortMatrix`

* * *

Guides: Mathematical Functions
