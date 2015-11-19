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

local background = display.newImage("background.png")
background.y = 130

local planet = display.newImage("planet.png")
planet.x = centerX
planet.y = display.contentHeight + 60

-- game functions

local function spawnEnemy()

end

local function startGame()
	transition.to(background, {time=2000, y=centerY, x=centerX})
	transition.to(planet, {time=2000, y=centerY})
end

local function planetDamage()

end

local function hitPlanet(obj)

end

local function shipSmash(event)

end

startGame()
