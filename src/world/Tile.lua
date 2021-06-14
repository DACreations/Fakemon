Tile = Class()

function Tile:Init(id,x,y,sprite)
    self.id = id
    self.x = x
    self.y = y
    self.sprite = sprite
end

function Tile:Render()
    love.graphics.draw(gTextures[self.sprite], self.x, self.y)
end