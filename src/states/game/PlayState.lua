PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.level = Level()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()
    gSounds['field-music']:setVolume(0.5)

    self.dialogueOpened = false
end

function PlayState:update(dt)
    self.level:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateStack:push(DialogueState("Hola, que tal todo. Espero que bien. Yo si estoy bien."))
    end

end

function PlayState:render()
    self.level:render()
end