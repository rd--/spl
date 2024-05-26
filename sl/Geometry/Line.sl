InfinitePlane : [Object] { | u v w |

}

HalfLine : [Object] { | u v |

}

Line : [Object] { | u v |

	midpoint { :self |
		self.u.midPoint(self.v)
	}

	intersection { :self |
	}

	xIntercept { :self |
	}

	yIntercept { :self |
	}

}
