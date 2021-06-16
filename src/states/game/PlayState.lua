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
end

function PlayState:render()
    self.level:render()
end