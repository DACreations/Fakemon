Panel = Class{}

function Panel:init(x1, y1, x2, y2)
    self.x = x1
    self.y = y1
    self.width = x2
    self.height = y2

    self.visible = true
end

function Panel:update() end

function Panel:render()
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 3)
    love.graphics.setColor(0.2, 0.2, 0.2, 1)
    love.graphics.rectangle('fill', self.x + 2, self.y + 2, self.width - 4, self.height - 4, 3)
    love.graphics.setColor(1,1,1,1)
end

function Panel:toggle( )
    self.visible = not self.visible
end