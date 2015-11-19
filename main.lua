-- Project: Attack of the Cuteness Game
-- http://MasteringCoronaSDK.com
-- Version: 1.0
-- Copyright 2013 J. A. Whye. All Rights Reserved.
-- "Space Cute" art by Daniel Cook (Lostgarden.com) 

-- housekeeping stuff

display.setStatusBar(display.HiddenStatusBar)

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- set up forward references

local spawnEnemy
local gameTitle
local scoreTxt
local score = 0

-- preload audio

local sndKill = audio.loadSound("boing-1.wav")
local sndBlast = audio.loadSound("blast.mp3")
local sndLose = audio.loadSound("wahwahwah.wav")

-- create play screen

local function createPlayScreen()

	local background = display.newImage("background.png")
	background.y = 130
	background.alpha = 0

	local planet = display.newImage("planet.png")
	planet.x = centerX
	planet.y = display.contentHeight + 60
	planet.alpha = 0

	transition.to(background, {time=2000, alpha=1, y=centerY, x=centerX})

	local function showTitle()

		gameTitle = display.newImage("gametitle.png")
		gameTitle.alpha = 0
		gameTitle:scale(4, 4)
		transition.to(gameTitle, {time=500, alpha=1, xScale = 1, yScale = 1})
		startGame()
	end
	transition.to(planet, {time=2000, alpha = 1, y=centerY, onComplete = showTitle})
end

-- game functions

function spawnEnemy()

	local enemy = display.newImage("beetleship.png")
	enemy.x = math.random(20, display.contentWidth-20)
	enemy.y = math.random(20, display.contentHeight-20)
	enemy:addEventListener("tap", shipSmash)

end

function startGame()

	local text = display.newText("Tap here to start. Protect the planet!", 0, 0, "Helvetica", 24)
	text.x = centerX
	text.y = display.contentHeight - 30
	text:setTextColor(255, 254, 185)
	local function goAway(event)
		display.remove(event.target)
		text = nil
		display.remove(gameTitle)
		spawnEnemy()
		scoreTxt = display.newText("Score: 0", 0, 0, "Helvetica", 22)
		scoreTxt.x = centerX
		scoreTxt.y = 10
		score = 0
	end
	text:addEventListener("tap", goAway)
end

local function planetDamage()

end

local function hitPlanet(obj)

end

function shipSmash(event)

	local obj = event.target
	display.remove(obj)
	audio.play(sndBlast)
	score = score + 28
	scoreTxt.text = "Score: " .. score
	spawnEnemy()
	return true

end

createPlayScreen()
