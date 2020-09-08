_ENV = Dorothy!

modelFile = "Model/patreon.model"

model = with Model modelFile
	.recovery = 0.2
	.look = "happy"
	\play "walk", true
	\slot "AnimationEnd",(name)-> print name, "end"

Director.entry\addChild model

-- example codes ends here, some test ui below --

_ENV = Dorothy builtin.ImGui

looks = Model\getLooks modelFile
looks = {""} if #looks == 0
animations = Model\getAnimations modelFile
animations = {""} if #animations == 0
currentLook = #looks
currentAnim = #animations
loop = true
model\schedule ->
	:width, :height = App.visualSize
	SetNextWindowPos Vec2(width-250,10), "FirstUseEver"
	SetNextWindowSize Vec2(240,325), "FirstUseEver"
	Begin "Model", "NoResize|NoSavedSettings", ->
		changed, currentLook = Combo "Look", currentLook, looks
		model.look = looks[currentLook] if changed
		changed, currentAnim = Combo "Anim", currentAnim, animations
		model\play animations[currentAnim], loop if changed
		changed, loop = Checkbox "Loop", loop
		model\play animations[currentAnim], loop if changed
		SameLine!
		changed, model.reversed = Checkbox "Reversed", model.reversed
		model\play animations[currentAnim], loop if changed
		PushItemWidth -70, ->
			changed, model.speed = DragFloat "Speed", model.speed, 0.01, 0, 10, "%.2f"
			changed, model.recovery = DragFloat "Recovery", model.recovery, 0.01, 0, 10, "%.2f"
		scale = model.scaleX
		_, scale = DragFloat "Scale", scale, 0.01, 0.5, 2, "%.2f"
		model.scaleX, model.scaleY = scale, scale
		if Button "Play", Vec2 140, 30
			model\play animations[currentAnim], loop
