BattleState = Class{__includes = BaseState}

function BattleState:init(player)
    self.player = player
    self.battleStarted = false

    self.playerCircleX = -68
    self.opponentCircleX = VIRTUAL_WIDTH + 32
end

function BattleState:update(dt)
    -- this will trigger the first time this state is actively updating on the stack
    if love.keyboard.wasPressed('space') then
        gStateStack:pop()
    end
end

function BattleState:exit()
    gSounds['battle-music']:stop()
    gSounds['field-music']:play()

    gStateStack:push(
        FadeInState({
            r = 255, g = 255, b = 255,
        }, 1, 
        function()
            gStateStack:push(FadeOutState({
                r = 255, g = 255, b = 255,
            }, 1, function() end))
        end)
    )
end

function render()
    love.graphics.clear(0.84, 0.84, 0.84, 1)

    love.graphics.setColor(0.176, 0.72, 0.176, 0.45)
    love.graphics.ellipse('fill', self.opponentCircleX, 60, 72, 24)
    love.graphics.ellipse('fill', self.playerCircleX, VIRTUAL_HEIGHT - 64, 72, 24)
end