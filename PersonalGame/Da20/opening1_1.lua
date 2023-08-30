-----------------------------------------------------------------------------------------
--
-- opening1_1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage("image/OB2.png", display.contentCenterX, display.contentCenterY)

	local object = {}

 	object[2] = display.newImageRect("image/mouse.png", 220, 220)
 	object[2].x, object[2].y = display.contentWidth * 0.75, display.contentHeight * 0.7
 	object[3] = display.newImage("image/cursor_1.png")
 	object[3].x, object[3].y = 540, 1150
 	object[4] = display.newImage("image/cursor_2.png")
 	object[4].isVisible = false

 	local objectGroup = display.newGroup()

 	objectGroup:insert(object[2])
 	objectGroup:insert(object[3])
 	objectGroup:insert(object[4])

 	sceneGroup:insert(background)
 	sceneGroup:insert(objectGroup)


 	local function cursorClick2( event )
 		print("클릭 했습니다.")
 		audio.play(mouse)
 		object[3].isVisible = true
 		object[4].isVisible = false
 	end

 	local function cursorClick1( event )
 		print("클릭 했습니다.")
 		object[4].x, object[4].y = object[3].x, object[3].y
 		object[3].isVisible = false
 		object[4].isVisible = true
 		timer.performWithDelay(300, cursorClick2)
 	end

	-- 타이머 콜백 함수
	local function cursorMove(event)
		transition.moveTo( object[2], { x=display.contentWidth * 0.75 - 50, y=display.contentHeight * 0.7 - 20, time=1000 } )
    	transition.moveTo( object[3], { x=450, y=1050, time=1000 } )
	end

 	local function nextScene( event )
 		print("opening2 로 이동합니다.")
 		composer.gotoScene( "opening1_2" )
 	end

 	timer.performWithDelay(500, cursorMove)
 	timer.performWithDelay(1500, cursorClick1)
 	timer.performWithDelay(1850, nextScene)
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
		composer.removeScene('opening1_1')
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