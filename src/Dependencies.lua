Class = require 'lib.class'
Event = require "lib.knife.event"
push = require "lib.push"
Timer = require "lib.knife.timer"

require 'src.constants'

require 'src.states.StateStack'
require 'src.states.BaseState'
require 'src.states.game.StartState'
require 'src.states.game.FadeInState'
require 'src.states.game.FadeOutState'
require 'src.states.game.PlayState'
require 'src.states.game.DialogueState'

require 'src.world.Level'
require 'src.world.tile_ids'
require 'src.world.Tile'
require 'src.world.TileMap'

require 'src.entity.Entity'
require 'src.entity.entity_defs'
require 'src.entity.Player'

require 'src.fakemon_defs'

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['large+1'] = love.graphics.newFont('fonts/font.ttf', 33)
}

gSounds = {
    ['intro-music'] = love.audio.newSource('sound/intro.wav', 'stream'),
    ['field-music'] = love.audio.newSource('sound/evil A-1.wav', 'stream')
}

gTextures = {
    ['hierba'] = love.graphics.newImage('graphics/tierra_3.png'),

    ['uno-front'] = love.graphics.newImage('graphics/1.png'),
    ['uno-back'] = love.graphics.newImage('graphics/1 detras.png'),

    ['unknown-front'] = love.graphics.newImage('graphics/unknown.png'),
    ['unknown-back'] = love.graphics.newImage('graphics/unknown detras.png'),


    ['protaF-front'] = love.graphics.newImage('graphics/protaF.png'),

    ['tile-1'] = love.graphics.newImage('graphics/tierra_3.png')
}