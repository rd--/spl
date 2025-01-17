# Geometry Functions

## Angle Functions

- `angleVector`: unit vector at angle
- `planarAngle`: planar angle
- `vectorAngle`: vector angle

## Catalogues

- `fradinPolyhedraCatalogue`
- `holmesPolyhedraCatalogue`
- `leitnerCrystalStructureCatalogue`
- `levskayaPolyhedraCatalogue`
- `planarConvexPolytopeGraphCatalogue`
- `planarGraphCatalogue`
- `planarNonHamiltonianGraphCatalogue`
- `planarQuadrangulationsCatalogue`
- `planarRegularGraphCatalogue`
- `schareinKnotCatalogue`
- `schareinLinkCatalogue`
- `schareinMinimalKnotCatalogue`
- `schareinMinimalLinkCatalogue`

## Coordinate Transformations

- `fromCylindricalCoordinates`: _(ρ,φ,z)_ → _(x,y,z)_
- `fromPolarCoordinates`: _(r,θ)_ → _(x,y)_
- `fromSphericalCoordinates`: _(r,θ,ϕ)_ → _(x,y,z)_
- `toCylindricalCoordinates`: _(x,y,z)_ → _(ρ,φ,z)_
- `toPolarCoordinates`: _(x,y)_ → _(r,θ)_
- `toSphericalCoordinates`: _(x,y,z)_ → _(r,θ,ϕ)_

## Constants

- `degree`: radians per degree (0.0175)

## Constructors

- `BezierCurve`: Bézier curve
- `Circle`: circle
- `Ellipse`: ellipse
- `GeometryCollection`
- `HalfLine`: half line
- `HalfPlane`: half plane
- `InfiniteLine`: infinite line
- `InfinitePlane`: infinite plane
- `Line`: line
- `Parallelogram`: parallelogram
- `PointCloud`: point cloud
- `Point`: point
- `PolygonMesh`: polygon mesh
- `Polygon`: polygon
- `Polyhedron`: polyhedron
- `Rectangle`: rectangle
- `circlePoints`: circle points
- `closedLine`: close line
- `randomStarConvexPolygon`: random polygon
- `regularPolygon`: regular polygon
- `unitCircle`: unit circle
- `unitCube`: unit cube
- `unitDodecahedron`: unit dodecahedron
- `unitIcosahedron`: unit icosahedron
- `unitOctahedron`: unit octahedron
- `unitSquare`: unit square
- `unitTetrahedron`: unit tetrahedron

## Converting Functions

- `asCartesianCoordinates`: as CartesianCoordinates
- `asCylindricalCoordinates`: as CylindricalCoordinates
- `asPlanarCoordinates`: as PlanarCoordinates
- `asPolarCoordinates`: as PolarCoordinates
- `asSphericalCoordinates`: as SphericalCoordinates
- `degreesToRadians`: convert from degrees to radians
- `hessianNormalForm`: Hesse normal form of a plane
- `radiansToDegrees`: convert from radians to degrees

## Distance Functions

- `cosineDistance`: angular cosine distance between vectors
- `euclideanDistance`: Euclidean distance between vectors
- `pointLineDistance`: distance from an infinite line to a point
- `signedPointPlaneDistance`: signed distance from a point to a plane

## Intersection Functions

- `lineLineIntersection`: point at which two infinite lines intersect
- `linePlaneIntersection`: point at which a line and a plane intesect

## Matrix Functions

- `eulerMatrix`: Euler matrix
- `reflectionMatrix`: reflection matrix
- `rotationMatrix`: rotation matrix
- `scalingMatrix`: scaling matrix

## Query Functions

- `arcLength`: arc length
- `area`: area
- `boundingBox`: bounding box
- `circumference`: circumference
- `coordinateBoundingBox`: bounding box
- `coordinateBounds`: coordinate bounds
- `diameter`: diameter
- `dimension`: dimension
- `edgeCoordinates`: edge coordinates
- `edgeCount`: edge list
- `edgeList`: edge list
- `embeddingDimension`: embedding dimension
- `faceCount`: face count
- `faceIndices`: face indices
- `perimeter`: perimeter
- `radius`: radius
- `unitNormal`: unit normal
- `vertexCoordinates`: vertex coordinates
- `vertexCount`: vertex count
- `vertexList`: vertex list

## Uncategorized

- `lineEquation`
- `unitVector`

* * *

Guides: Geometry Types
