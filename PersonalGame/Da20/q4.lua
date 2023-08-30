-----------------------------------------------------------------------------------------
--
-- q4.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
local bg = display.newImageRect("image/bg_forest.png", display.contentWidth, display.contentHeight)
	bg.x, bg.y = display.contentWidth/2, display.contentHeight/2

	local sceneGroup = self.view

	local question = display.newText("게임 랭킹이 많이 떨어졌어.", display.contentCenterX, 300, "font/오뮤_다예쁨체")
	local question1 = display.newText("기분이 어때?",display.contentCenterX, 400, "font/오뮤_다예쁨체")
	question.size = 70
	question:setTextColor(0)
	question1.size = 70
	question1:setTextColor(0)

	local questionBox = display.newImageRect("image/q.png", display.contentWidth, display.contentHeight)
	questionBox.x, questionBox.y = display.contentWidth/2, display.contentHeight/2

	local vs = display.newImageRect("image/vs.png", display.contentWidth, display.contentHeight)
	vs.x, vs.y = display.contentWidth/2, display.contentHeight * 0.68

	local answer = {}

	answer[1] = display.newImageRect("image/top.png", 900, 300)
	answer[1].x, answer[1].y = display.contentWidth * 0.43, display.contentHeight * 0.58
	answer[2] = display.newImageRect("image/bottom.png", 900, 300)
	answer[2].x, answer[2].y = display.contentWidth * 0.57, display.contentHeight * 0.75

	local text = {}
	text[1] = display.newText("화가 나지만 열심히해서 이겨보자!!",display.contentWidth * 0.43, display.contentHeight * 0.58, "font/오뮤_다예쁨체")
	text[1]:setTextColor(0)
	text[1].size = 60

	text[2] = display.newText("하.. 난 역시 이런 게임은 안맞는다니까?",display.contentWidth * 0.57, display.contentHeight * 0.75, "font/오뮤_다예쁨체")
	text[2]:setTextColor(0)
	text[2].size = 60

	text[3] = display.newText("4 / 9", display.contentWidth * 0.5, display.contentHeight * 0.05, "font/오뮤_다예쁨체")
	text[3]:setTextColor(0)
	text[3].size = 50


	local function tap1(event)
		print("1번 대답 클릭")
		hc = hc + 1
		print(hc)
		composer.gotoScene("q5")
	end

	local function tap2(event)
		print("2번 대답 클릭")
		hc = hc + 0
		print(hc)
		composer.gotoScene("q5")
	end
	answer[1]:addEventListener("tap", tap1)
	answer[2]:addEventListener("tap", tap2)



	local answerGroup = display.newGroup()
	answerGroup:insert(answer[1])
	answerGroup:insert(answer[2])

	local textGroup = display.newGroup()
	textGroup:insert(text[1])
	textGroup:insert(text[2])
	textGroup:insert(text[3])

	sceneGroup:insert(bg)
	sceneGroup:insert(questionBox)
	sceneGroup:insert(question)
	sceneGroup:insert(question1)
	sceneGroup:insert(answerGroup)
	sceneGroup:insert(vs)
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
		composer.removeScene('q4')

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