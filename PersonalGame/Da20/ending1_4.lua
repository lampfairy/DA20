-----------------------------------------------------------------------------------------
--
-- ending1_4.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	audio.play(cat2)
	local sceneGroup = self.view
	
	local background = display.newImage("image/bg_forest.png", display.contentCenterX, display.contentCenterY)
	
	local object = {}

	object[2] = display.newImage("image/catTalk.png", display.contentCenterX, display.contentCenterY + 510)
 	object[3] = display.newText("너의 퍼스널 게임은…", display.contentWidth*0.5, display.contentCenterY - 150, "Font/오뮤_다예쁨체", 90)
 	object[3]:setFillColor(0)
 	object[5] = display.newImage("image/cat4.png")
 	object[5].x, object[5].y = 350, display.contentCenterY + 500

 	local objectGroup = display.newGroup()

 	objectGroup:insert(object[2])
 	objectGroup:insert(object[3])
 	objectGroup:insert(object[5])

 	sceneGroup:insert(background)
 	sceneGroup:insert(objectGroup)

 	local options = {
    effect = "fromTop",
    time = 800,
	}

 	local function tapEventListener( event )
 		print("클릭했습니다!")
 		--결과지로 이동
		composer.gotoScene( "GBTI" , options)
 	end
 
 	background:addEventListener("tap", tapEventListener)

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
		audio.stop(bgmChannel2)
		audio.play(touch)
		composer.removeScene('ending1_4')
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