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

-- preload audio

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

		local gameTitle = display.newImage("gametitle.png")
		gameTitle.alpha = 0
		gameTitle:scale(4, 4)
		transition.to(gameTitle, {time=500, alpha=1, xScale = 1, yScale = 1})

	end
	transition.to(planet, {time=2000, alpha = 1, y=centerY, onComplete = showTitle})
end

-- game functions

local function spawnEnemy()

end

local function startGame()

end

local function planetDamage()

end

local function hitPlanet(obj)

end

local function shipSmash(event)

end

createPlayScreen()
startGame()
