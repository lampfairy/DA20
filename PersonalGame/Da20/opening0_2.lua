-----------------------------------------------------------------------------------------
--
-- opening2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )

	local sceneGroup = self.view

	local background = display.newImage("image/OB1.png", display.contentCenterX, display.contentCenterY)

	local object = {}

 	object[2] = display.newImage("image/personTalk.png", display.contentCenterX, -200)
 	object[3] = display.newText("오랜만에 게임 좀 해볼까?", display.contentWidth*0.5, display.contentHeight*0.22, "Font/오뮤_다예쁨체", 90)
 	object[3]:setFillColor(0)

 	local objectGroup = display.newGroup()

 	objectGroup:insert(object[2])
 	objectGroup:insert(object[3])

 	sceneGroup:insert(background)
 	sceneGroup:insert(objectGroup)

 	local options = {
    effect = "fade",
    time = 800,
	}

 	local function tapEventListener( event )
 		print("클릭했습니다!")
		composer.gotoScene( "opening1_1" ,options)
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
		audio.play(touch)
		composer.removeScene('opening0_1')
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
