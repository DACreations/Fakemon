Class = require 'lib.class'
Event = require "lib.knife.event"
push = require "lib.push"
Timer = require "lib.knife.timer"

require 'src.constants'
require 'src.states.StateStack'
require 'src.states.game.StartState'

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
}

gSounds = {
    ['intro-music'] = love.audio.newSource('sound/intro.wav', 'stream')
}