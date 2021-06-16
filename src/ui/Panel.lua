Panel = Class()

function Panel:init(x,y,width,height)
    self.posX = x
    self.posY = y
    self.width = width < 36 and 36 or width
    self.height = height < 36 and 36 or height
    self.pieces = {}

    self.pieces[1] = PanelPiece(1,self.posX,self.posY,1,1)
    self.pieces[3] = PanelPiece(3,self.posX + self.width - 16,self.posY,1,1)
    self.pieces[7] = PanelPiece(7,self.posX,self.posY + self.height - 16,1,1)
    self.pieces[9] = PanelPiece(9,self.posX + self.width - 16,self.posY + self.height - 16,1,1)
    
    self.pieces[2] = PanelPiece(2,self.posX + 16,self.posY,(self.width - 32)/16,1)

    self.pieces[4] = PanelPiece(4,self.posX,self.posY + 16,1,(self.height - 32)/16)

    self.pieces[5] = PanelPiece(5,self.posX + 16,self.posY + 16,(self.width - 32)/16,(self.height - 32)/16)

    self.pieces[6] = PanelPiece(6,self.posX + self.width - 16,self.posY + 16,1,(self.height - 32)/16)

    self.pieces[8] = PanelPiece(8,self.posX + 16,self.posY + (self.height - 16),(self.width - 32)/16,1)

end

function Panel:render()
    self.pieces[1]:render()
    self.pieces[3]:render()
    self.pieces[7]:render()
    self.pieces[9]:render()

    self.pieces[2]:render()
    self.pieces[4]:render()
    self.pieces[5]:render()
    self.pieces[6]:render()
    self.pieces[8]:render()
end