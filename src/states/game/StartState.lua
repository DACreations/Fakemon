StartState = Class{__includes = BaseState}

function StartState:init() 
    gSounds['intro-music']:play()

    self.sprite = FAKEMON_DEFS[FAKEMON_IDS[math.random(#FAKEMON_IDS)]].battleSpriteFront
    self.spriteX = VIRTUAL_WIDTH / 2 - 32
    self.spriteY = VIRTUAL_HEIGHT / 2 - 32

    self.tween = Timer.every(3, function()
        Timer.tween(0.2, {
            [self] = {spriteX = -32}
        })
        :finish(function()
            self.sprite = FAKEMON_DEFS[FAKEMON_IDS[math.random(#FAKEMON_IDS)]].battleSpriteFront
            self.spriteX = VIRTUAL_WIDTH
            self.spriteY = VIRTUAL_HEIGHT / 2 - 32

            Timer.tween(0.2, {
                [self] = {spriteX = VIRTUAL_WIDTH / 2 - 32}
            })
        end)
    end)
end

function StartState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateStack:push(FadeInState({
            r = 1, g = 1, b = 1
        }, 1,
        function()
            gSounds['intro-music']:stop()
            self.tween:remove()

            gStateStack:pop()
            
            gStateStack:push(PlayState())
            gStateStack:push(FadeOutState({
                r = 1, g = 1, b = 1
            }, 1,
            function() end))
        end))
    end
end

function StartState:render() 
    love.graphics.clear(0.73, 0.73, 0.73, 1)

    love.graphics.setColor(0.094, 0.094, 0.094, 1)
    love.graphics.setFont(gFonts['large+1'])
    love.graphics.printf('Fakemon!', 0, VIRTUAL_HEIGHT / 2 - 72, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 0.85, 0, 1)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Fakemon!', 0, VIRTUAL_HEIGHT / 2 - 72, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0.094, 0.094, 0.094, 1)
    love.graphics.printf('Pulsa ENTER', 0, VIRTUAL_HEIGHT / 2 + 68, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small'])

    love.graphics.setColor(0.17, 0.72, 0.17, 0.4862)
    love.graphics.ellipse('fill', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 + 32, 70, 22)
    love.graphics.setColor(0.17, 0.6, 0.17, 0.4862)
    love.graphics.ellipse('fill', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 + 32, 74, 25)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(gTextures[self.sprite], self.spriteX, self.spriteY)
end
