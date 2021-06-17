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
    if random > 96 then
        if random < 97 then
            self.entity.direction = 'left'
        elseif random < 98 then
            self.entity.direction = 'right'
        elseif random < 99 then
            self.entity.direction = 'up'
        else
            self.entity.direction = 'down'
        end
        self.entity:changeState('walk')
    end
end

function NPCIdleState:lateralMovement()
    random = math.random( 100 )
    if random > 80 then
        self.entity.direction = 'left'
        self.entity:changeState('walk')
    elseif random > 90 then
        self.entity.direction = 'right'
        self.entity:changeState('walk')
    else
        self.entity:changeState('idle')
    end
end