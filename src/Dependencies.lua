Class = require 'lib.class'
Event = require "lib.knife.event"
push = require "lib.push"
Timer = require "lib.knife.timer"

require 'src.constants'
require 'src.StateMachine'
require 'src.Animation'
require 'src.Util'
require 'src.fakemon_defs'
require 'src.Fakemon'
require 'src.Party'

require 'src.battle.BattleSprite'
require 'src.battle.Opponent'

require 'src.states.StateStack'
require 'src.states.BaseState'
require 'src.states.game.StartState'
require 'src.states.game.FadeInState'
require 'src.states.game.FadeOutState'
require 'src.states.game.PlayState'
require 'src.states.game.DialogueState'
require 'src.states.game.BattleState'
require 'src.states.game.BattleMessageState'
require 'src.states.game.BattleMenuState'
require 'src.states.game.TakeTurnState'


require 'src/states/entity/EntityBaseState'
require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'
require 'src/states/entity/PlayerIdleState'
require 'src/states/entity/PlayerWalkState'
require 'src/states/entity/NPCIdleState'
require 'src/states/entity/NPCWalkState'

require 'src.world.Level'
require 'src.world.tile_ids'
require 'src.world.Tile'
require 'src.world.TileMap'

require 'src.entity.Entity'
require 'src.entity.entity_defs'
require 'src.entity.Player'
require 'src.entity.NPC'
require 'src.entity.NPC_movements'

require 'src.ui.Panel'
require 'src.ui.Textbox'
require 'src.ui.ProgressBar'
require 'src.ui.Menu'
require 'src.ui.Selection'

-- require 'src.ui.PanelPiece'

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['text'] = love.graphics.newFont('fonts/PKMN RBYGSC.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['large+1'] = love.graphics.newFont('fonts/font.ttf', 33)
}

gSounds = {
    ['intro-music'] = love.audio.newSource('sound/music/intro.wav', 'stream'),
    ['field-music'] = love.audio.newSource('sound/music/tension/tension.wav', 'stream'),
    ['battle-music'] = love.audio.newSource('sound/music/unknown/unknown.wav', 'stream'),
    ['victory-music'] = love.audio.newSource('sound/music/malbao/evil B-2.wav', 'stream'),


    ['accept'] = love.audio.newSource('sound/sound/SFX_PRESS_AB.wav', 'static'),
    ['blip'] = love.audio.newSource('sound/sound/SFX_PRESS_AB.wav', 'static'),
    ['run'] = love.audio.newSource('sound/sound/SFX_RUN.wav', 'static'),
    ['hit'] = love.audio.newSource('sound/sound/SFX_CYMBAL_3.wav', 'static'),
    ['powerup'] = love.audio.newSource('sound/sound/SFX_WITHDRAW_DEPOSIT.wav', 'static'),
    ['fainted'] = love.audio.newSource('sound/sound/SFX_FAINT_FALL.wav', 'static'),
    ['exp'] = love.audio.newSource('sound/sound/SFX_HEAL_UP.wav', 'static')
}

gTextures = {
    ['hierba'] = love.graphics.newImage('graphics/tierra_3.png'),

    ['uno-front'] = love.graphics.newImage('graphics/1.png'),
    ['uno-back'] = love.graphics.newImage('graphics/1 detras.png'),

    ['unknown-front'] = love.graphics.newImage('graphics/unknown.png'),
    ['unknown-back'] = love.graphics.newImage('graphics/unknown detras.png'),

    ['ovni'] = love.graphics.newImage('graphics/ovni.png'),
    ['ovni-back'] = love.graphics.newImage('graphics/ovni detras.png'),

    ['milotic'] = love.graphics.newImage('graphics/milotic.png'),

    ['tiles'] = love.graphics.newImage('graphics/sheet.png'),

    ['entities'] = love.graphics.newImage('graphics/entities.png'),

    ['panel'] = love.graphics.newImage('graphics/blue-ui.png'),
    ['cursor'] = love.graphics.newImage('graphics/cursor.png')
}

gFrames = {
    ['tiles'] = GenerateQuads(gTextures['tiles'], 16, 16),
    ['entities'] = GenerateQuads(gTextures['entities'], 16, 16),
    ['panel'] = GenerateQuads(gTextures['panel'], 16, 16)
}