-----------------------------------------------------------------------------------------
--
-- opening5_3.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
   local sceneGroup = self.view
   
   local background = display.newImage("image/bg_forest.png", display.contentCenterX, display.contentCenterY)
   
   local object = {}

   object[2] = display.newImage("image/catTalk.png", display.contentCenterX, display.contentCenterY)
   object[3] = display.newImage("image/naration_cut.png", display.contentCenterX, display.contentCenterY + 320)
   object[4] = display.newImage("image/naration_cut.png", display.contentCenterX, display.contentCenterY + 720)
   object[5] = display.newText("요즘 어때?\n어떻게 지내고 있어?", display.contentWidth*0.5, display.contentCenterY * 0.35, "Font/오뮤_다예쁨체", 90)
   object[5]:setFillColor(0)
   object[6] = display.newText("요즘 괜찮아, 고마워.", display.contentWidth*0.5, display.contentCenterY + 300, "Font/오뮤_다예쁨체", 80)
   object[6]:setFillColor(0)
   object[7] = display.newText("너무 바빠서\n취미활동을 할 시간이 없네..", display.contentWidth*0.5, display.contentCenterY + 700, "Font/오뮤_다예쁨체", 80)
   object[7]:setFillColor(0)

    local objectGroup = display.newGroup()

    objectGroup:insert(object[2])
    objectGroup:insert(object[3])
    objectGroup:insert(object[4])
    objectGroup:insert(object[5])
    objectGroup:insert(object[6])
    objectGroup:insert(object[7])

    sceneGroup:insert(background)
    sceneGroup:insert(objectGroup)

    local function tapEventListener( event )
       print("클릭했습니다!")
      composer.gotoScene( "opening5_4" )
    end
 
    object[3]:addEventListener("tap", tapEventListener)
    object[4]:addEventListener("tap", tapEventListener)
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
      composer.removeScene('opening5_3')
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