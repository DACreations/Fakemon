Tile = Class()

function Tile:init(x,y, id)
    self.id = id
    self.x = x
    self.y = y

end

function Tile:update(dt)

end

function Tile:render()
    love.graphics.draw(gTextures['tiles'], gFrames['tiles'][self.id],
        (self.x - 1) * TILE_SIZE, (self.y - 1) * TILE_SIZE)
end