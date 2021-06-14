Tile = Class()

function Tile:init(x,y, id)
    self.id = id
    self.x = x
    self.y = y

end

function Tile:render()
    love.graphics.draw(gTextures['tile-1'], (self.x - 1) * TILE_SIZE, (self.y - 1) * TILE_SIZE)
end