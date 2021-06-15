NPC_movements = Class{}

function NPC_movements:randomMovement(entity)
    random = math.random( 100 )
    if random > 90 then
        if random < 92.5 then
            entity.direction = 'left'
        elseif random < 95 then
            entity.direction = 'right'
        elseif random < 97.5 then
            entity.direction = 'up'
        else
            entity.direction = 'down'
        end
        entity:changeState('walk')
    end
end