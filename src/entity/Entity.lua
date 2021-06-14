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

function Entity:onInteract()

end

function Entity:render() 
    love.graphics.draw(gTextures['protaF-front'], self.x, self.y)
end

function Entity:update(dt)
    if love.keyboard.wasPressed('up') then
        self.y =  self.y - TILE_SIZE
    end
    if love.keyboard.wasPressed('down') then
        self.y = self.y + TILE_SIZE
    end
    if love.keyboard.wasPressed('left') then
        self.x = self.x - TILE_SIZE
    end
    if love.keyboard.wasPressed('right') then
        self.x = self.x + TILE_SIZE
    end
    love.keyboard.keysPressed = {}
end