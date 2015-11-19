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

-- preload audio

local sndKill = audio.loadSound("boing-1.wav")
local sndBlast = audio.loadSound("blast.mp3")
local sndLose = audio.loadSound("wahwahwah.wav")

-- create play screen

local function createPlayScreen()

	local background = display.newImage("background.png")
	background.y = 130
	background.alpha = 0
	background:addEventListener("tap", shipSmash)

	local planet = display.newImage("planet.png")
	planet.x = centerX
	planet.y = display.contentHeight + 60
	planet.alpha = 0
	planet:addEventListener("tap", shipSmash)

	transition.to(background, {time=2000, alpha=1, y=centerY, x=centerX})

	local function showTitle()

		local gameTitle = display.newImage("gametitle.png")
		gameTitle.alpha = 0
		gameTitle:scale(4, 4)
		transition.to(gameTitle, {time=500, alpha=1, xScale = 1, yScale = 1})
		spawnEnemy()

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

local function startGame()

end

local function planetDamage()

end

local function hitPlanet(obj)

end

function shipSmash(event)

	local obj = event.target
	display.remove(obj)
	audio.play(sndKill)
	return true

end

createPlayScreen()
startGame()
