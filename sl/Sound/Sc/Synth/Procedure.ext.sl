+ Procedure {

	OverlapTexture { :self :sustainTime :transitionTime :overlap |
		<primitive: return sc.OverlapTexture(_self, _sustainTime, _transitionTime, _overlap);>
	}

	XFadeTexture { :self :sustainTime :transitionTime |
		<primitive: return sc.XFadeTexture(_self, _sustainTime, _transitionTime);>
	}

}
