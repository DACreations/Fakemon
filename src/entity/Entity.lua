Entity = Class{}

function Entity:init(def)
    self.direction = 'down'

    self.mapX = def.mapX
    self.mapY = def.mapY

    self.width = def.width
    self.height = def.height

    self.x = (self.mapX - 1) * TILE_SIZE
    self.y = (self.mapY - 1) * TILE_SIZE - self.height / 2
end

