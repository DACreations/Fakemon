StartState = Class{__include = BaseState}

function StartState:init() 
    gSounds['intro-music']:play()
end

function StartState:update(dt) 
    if love.keyboard.wasPressed("enter") then
        love.graphics.clear{0, 0, 0, 255}
    end
end

function StartState:render() 
    love.graphics.clear{188, 188, 188, 255}
    
    love.graphics.setColor(24, 24, 24, 255)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('¡Fakemon!', 0, VIRTUAL_HEIGHT / 2 - 72, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Pulsa ENTER para comenzar', 0, VIRTUAL_HEIGHT / 2 + 68, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small'])

    love.graphics.setColor(45, 184, 45, 124)
    love.graphics.ellipse('fill', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 + 32, 72, 24)
end

function StartState:enter() end