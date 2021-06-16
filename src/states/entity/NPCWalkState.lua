NPCWalkState = Class{__includes = EntityWalkState}

function NPCWalkState:init(entity, level)
    self.level = level
    EntityWalkState.init(self, entity, level)
end

function NPCWalkState:enter()
    self:attemptMove()
end

function NPCWalkState:attemptMove()
    self.entity:changeAnimation('walk-' .. tostring(self.entity.direction))

    local toX, toY = self.entity.mapX, self.entity.mapY

    if self.entity.direction == 'left' then
        toX = toX - 1
    elseif self.entity.direction == 'right' then
        toX = toX + 1
    elseif self.entity.direction == 'up' then
        toY = toY - 1
    else
        toY = toY + 1
    end

    -- break out if we try to move out of the map boundaries
    if toX < 1 or toX > 24 or toY < 1 or toY > 13 then
        self.entity:changeState('idle')
        self.entity:changeAnimation('idle-' .. tostring(self.entity.direction))
        return
    end

    if self.level.player.mapX == toX and self.level.player.mapY == toY then
        self.entity:changeState('idle')
        self.entity:changeAnimation('idle-' .. tostring(self.entity.direction))
        return
    end

    self.entity.mapY = toY
    self.entity.mapX = toX

    Timer.tween(0.5, {
        [self.entity] = {x = (toX - 1) * TILE_SIZE, y = (toY - 1) * TILE_SIZE - self.entity.height / 2}
    }):finish(function() self.entity:changeState('idle') end)
end