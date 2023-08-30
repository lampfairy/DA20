-----------------------------------------------------------------------------------------
--
-- opening4_2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	audio.play(cat2)
	local sceneGroup = self.view
	
	local background = display.newImage("image/bg_forest.png", display.contentCenterX, display.contentCenterY)
	
	local object = {}

 	object[2] = display.newImage("image/naration.png", display.contentCenterX, 1000)
 	object[3] = display.newText("어떤 고양이가 말을 걸어온다.", display.contentWidth*0.5, display.contentHeight - 300, "Font/오뮤_다예쁨체", 90)
 	object[3]:setFillColor(0)
 	object[5] = display.newImage("image/cat3.png")
 	object[5].x, object[5].y = 700, display.contentHeight * 0.48

 	local objectGroup = display.newGroup()

 	objectGroup:insert(object[2])
 	objectGroup:insert(object[3])
 	objectGroup:insert(object[5])

 	sceneGroup:insert(background)
 	sceneGroup:insert(objectGroup)

 	-- 타이머 콜백 함수
	local function catMove(event)
    	transition.moveTo( object[5], { x=350, y=1350, time=1000 } )
	end

 	local function nextScene( event )
 		composer.gotoScene( "opening5_1" )
 	end

 	timer.performWithDelay(500, catMove)
 	background:addEventListener("tap", nextScene)
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
		composer.removeScene('opening4_3')
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