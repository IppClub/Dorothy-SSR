_ENV = Dorothy!

sprite = Sprite "Image/logo.png"

Director.entry\addChild with Node!
	.touchEnabled = true
	\slot "TapMoved",(touch)->
		return unless touch.id == 0
		sprite.position += touch.delta
	\addChild sprite

-- example codes ends here, test ui codes below --

_ENV = Dorothy builtin.ImGui

Director.entry\addChild with Node!
	\schedule ->
		:width, :height = App.visualSize
		SetNextWindowPos Vec2(width-250,10), "FirstUseEver"
		SetNextWindowSize Vec2(240,520), "FirstUseEver"
		Begin "Sprite", "NoResize|NoSavedSettings", ->
			BeginChild "SpriteSetting", Vec2(-1,-40), ->
				:z = sprite
				changed, z = DragFloat "Z", z, 1, -1000, 1000, "%.2f"
				sprite.z = z if changed
				:x, :y = sprite.anchor
				changed, x, y = DragFloat2 "Anchor", x, y, 0.01, 0, 1, "%.2f"
				sprite.anchor = Vec2 x,y if changed
				:width, :height = sprite.size
				changed, width, height = DragFloat2 "Size", width, height, 0.1, 0, 1000, "%.f"
				sprite.size = Size width,height if changed
				:scaleX, :scaleY = sprite
				changed, scaleX, scaleY = DragFloat2 "Scale", scaleX, scaleY, 0.01, -2, 2, "%.2f"
				sprite.scaleX, sprite.scaleY = scaleX, scaleY if changed
				PushItemWidth -60,->
					:angle = sprite
					changed, angle = DragInt "Angle", math.floor(angle), 1, -360, 360
					sprite.angle = angle if changed
				PushItemWidth -60,->
					:angleX = sprite
					changed, angleX = DragInt "AngleX", math.floor(angleX), 1, -360, 360
					sprite.angleX = angleX if changed
				PushItemWidth -60,->
					:angleY = sprite
					changed,angleY = DragInt "AngleY", math.floor(angleY), 1, -360, 360
					sprite.angleY = angleY if changed
				:skewX, :skewY = sprite
				changed, skewX, skewY = DragInt2 "Skew", math.floor(skewX), math.floor(skewY), 1, -360, 360
				sprite.skewX, sprite.skewY = skewX, skewY if changed
				PushItemWidth -70,->
					:opacity = sprite
					changed, opacity = DragFloat "Opacity", opacity, 0.01, 0, 1, "%.2f"
					sprite.opacity = opacity if changed
				PushItemWidth -1,->
					:color3 = sprite
					SetColorEditOptions "RGB"
					sprite.color3 = color3 if ColorEdit3 "", color3
			if Button "Reset", Vec2 140,30
				parentNode = sprite.parent
				sprite\removeFromParent!
				sprite = Sprite "Image/logo.png"
				parentNode\addChild sprite

