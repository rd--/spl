# SphericalCoordinate -- geometry

Follow Iso convention where:

- rho: ρ radial distance (radial line, radial coordinate)
- theta: θ inclination angle (polar angle, zenith angle, normal angle, colatitude)
- phi: φ azimuth

_radius_, _azimuth_ and _inclination_ are provided as aliases.

Theta is with respect to positive polar axis,
ie. from the positive z-axis with 0 <= theta <= pi.

Azimuth is angle of counter-clockwise rotation from the initial meridian plane,
ie. in the xy-plane from the x-axis with 0 <= phi < 2 pi.

Instead of the inclination angle one may wish to use the elevation angle instead,
which is measured upward between the reference plane and the radial line,
ie. from the reference plane upward (towards to the positive z-axis) to the radial line.
The depression angle is the negative of the elevation angle.

Where supported rho is displayed as ρ, phi as φ, and theta as θ.

* * *

See also:
<https://mathworld.wolfram.com/SphericalCoordinates.html>,
<https://en.wikipedia.org/wiki/ISO/IEC_80000>
