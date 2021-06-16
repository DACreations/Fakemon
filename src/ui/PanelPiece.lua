PanelPiece = Class()

function PanelPiece:init(index,x,y,scaleX,scaleY)
    self.index = index;
    self.x = x;
    self.y = y;
    self.scaleX = scaleX;
    self.scaleY = scaleY;
end

function PanelPiece:render()
    love.graphics.draw(gTextures['panel'], gFrames['panel'][self.index],self.x,self.y,0,self.scaleX,self.scaleY)
end