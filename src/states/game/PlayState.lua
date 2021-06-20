PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.level = Level()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()
    gSounds['field-music']:setVolume(0.5)

    self.dialogueOpened = false
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateStack:push()
    end
    if not self.dialogueOpened and love.keyboard.wasPressed('p') or love.keyboard.wasPressed('P') then
        self.level.player.party.pokemon[1].currentHP = self.level.player.party.pokemon[1].HP
        gStateStack:push(DialogueState('Te has curado el fakemon', function () 
            self.dialogueOpened = false
        end))
    end
    self.level:update(dt)
end

function PlayState:render()
    self.level:render()
end