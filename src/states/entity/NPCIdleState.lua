NPCIdleState = Class{__includes = EntityIdleState}

function NPCIdleState:init(entity, movingFun)
    self.entity = entity
    self.entity:changeAnimation('idle-' .. self.entity.direction)
    self.movingFun = movingFun
end

function NPCIdleState:update(dt)
    if self.movingFun == 0 then
        self:lateralMovement()
    end
end

function NPCIdleState:randomMovement()
    random = math.random( 100 )
    if random > 90 then
        if random < 92.5 then
            self.entity.direction = 'left'
        elseif random < 95 then
            self.entity.direction = 'right'
        elseif random < 97.5 then
            self.entity.direction = 'up'
        else
            self.entity.direction = 'down'
        end
        self.entity:changeState('walk')
    end
end

function NPCIdleState:lateralMovement()
    random = math.random( 100 )
    if random > 50 then
        self.entity.direction = 'left'
    else
        self.entity.direction = 'right'
    end
    self.entity:changeState('walk')
end