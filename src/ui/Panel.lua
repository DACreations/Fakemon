Panel = Class()

function Panel:init(x,y,width,height)
    self.posX = x
    self.posY = y 
    self.width = width
    self.height = height
end

function Panel:render()

    love.graphics.draw(gTextures['panel'], gFrames['panel'][1],10,10)
    love.graphics.draw(gTextures['panel'], gFrames['panel'][2],26,10)
    love.graphics.draw(gTextures['panel'], gFrames['panel'][3],42,10)
    love.graphics.draw(gTextures['panel'], gFrames['panel'][4],10,26)
    love.graphics.draw(gTextures['panel'], gFrames['panel'][5],26,26)
    love.graphics.draw(gTextures['panel'], gFrames['panel'][6],42,26)
    love.graphics.draw(gTextures['panel'], gFrames['panel'][7],10,42)
    love.graphics.draw(gTextures['panel'], gFrames['panel'][8],26,42)
    love.graphics.draw(gTextures['panel'], gFrames['panel'][9],42,42)

end