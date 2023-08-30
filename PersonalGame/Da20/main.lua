-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"

sf = 0
hc = 0
ea = 0
GBTI = ""

bgm1 = audio.loadStream("bgm/home.mp3")
bgmChannel1 = audio.play(bgm1, {loops = -1})

bgm2 = audio.loadStream("bgm/forest.mp3")

touch = audio.loadSound( "bgm/touch.mp3" )
mouse = audio.loadSound( "bgm/mouse.mp3" )
sleep = audio.loadSound( "bgm/sleep.mp3" )
cat1 = audio.loadSound( "bgm/cat1.mp3" )
title = audio.loadSound( "bgm/result.mp3" )
cat2 = audio.loadSound( "bgm/cat2.mp3" )
answer = audio.loadSound( "bgm/answer.mp3" )
result = audio.loadSound( "bgm/result.mp3" )
-- event listeners for tab buttons:
local function onFirstView( event )
	composer.gotoScene( "opening0_1" )
end


onFirstView()	-- invoke first tab button's onPress event manually
