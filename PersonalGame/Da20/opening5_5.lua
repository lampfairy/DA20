-----------------------------------------------------------------------------------------
--
-- opening5_5.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage("image/bg_forest.png", display.contentCenterX, display.contentCenterY)
	
	local object = {}

	object[2] = display.newImage("image/catTalk.png", display.contentCenterX, display.contentCenterY)
 	object[3] = display.newText("그랬구나.\n요새는 왜 게임 안해?", display.contentWidth*0.5, display.contentCenterY - 660, "Font/오뮤_다예쁨체", 90)
 	object[3]:setFillColor(0)

	local answer = {}

	answer[1] = display.newImage("image/naration_cut.png")
	answer[1].x, answer[1].y = display.contentWidth * 0.5, display.contentCenterY
	answer[2] = display.newImage("image/naration_cut.png")
	answer[2].x, answer[2].y = display.contentWidth * 0.5, display.contentCenterY + 400
	answer[3] = display.newImage("image/naration_cut.png")
	answer[3].x, answer[3].y = display.contentWidth * 0.5, display.contentCenterY + 800

	local text = {}
	text[1] = display.newText("요즘은 퇴근하면\n집에서 기절하기 때문에\n게임할 시간이 없네..",display.contentWidth * 0.5, display.contentCenterY, "font/오뮤_다예쁨체")
	text[1]:setTextColor(0)
	text[1].size = 80

	text[2] = display.newText("취향에 맞는 게임을 찾기가\n좀 어려워서 그래.",display.contentWidth * 0.5, display.contentCenterY + 400, "font/오뮤_다예쁨체")
	text[2]:setTextColor(0)
	text[2].size = 80

	text[3] = display.newText("게임을 같이 할 수 있는 친구를\n찾기가 조금 어려워서 그래. ",display.contentWidth * 0.5, display.contentCenterY + 800, "font/오뮤_다예쁨체")
	text[3]:setTextColor(0)
	text[3].size = 80


	local function tap(event)
		composer.gotoScene("opening5_6")
	end

	answer[1]:addEventListener("tap", tap)
	answer[2]:addEventListener("tap", tap)
	answer[3]:addEventListener("tap", tap)



	

 	local objectGroup = display.newGroup()

 	objectGroup:insert(object[2])
 	objectGroup:insert(object[3])

 	local answerGroup = display.newGroup()
	answerGroup:insert(answer[1])
	answerGroup:insert(answer[2])
	answerGroup:insert(answer[3])

	local textGroup = display.newGroup()
	textGroup:insert(text[1])
	textGroup:insert(text[2])
	textGroup:insert(text[3])

	sceneGroup:insert(background)
 	sceneGroup:insert(objectGroup)
	sceneGroup:insert(answerGroup)
	sceneGroup:insert(textGroup)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		audio.play(answer)
		composer.removeScene('opening5_5')
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen

	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene