PanelPiece = Class()

function PanelPiece:init(index,x,y)
    self.index = index;
    self.x = x;
    self.y = y;
end

function PanelPiece:render()
    love.graphics.draw(gTextures['panel'], gFrames['panel'][self.index],self.x,self.y)
end