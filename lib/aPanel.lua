Panel = Class()

function Panel:init(x,y,width,height)

    
    self.TOPLEFT = 1
    self.TOP = 2
    self.TOPRIGHT = 3
    self.LEFT = 4
    self.CENTER = 5
    self.RIGHT = 6
    self.BOTTOMLEFT = 7
    self.BOTTOM = 8
    self.BOTTOMRIGHT = 9


    self.posX = x
    self.posY = y
    self.width = width < 48 and 48 or width
    self.height = height < 48 and 48 or height
    self.pieces = {}
    self:createPanel()
end

function Panel:createPanel()
    for y = 1, self.width/TILE_SIZE do
        table.insert(self.pieces, {})
    end

    for i = 1, self.height/TILE_SIZE do
        for j = 1, self.width/TILE_SIZE do
            self.pieces[i][j] = PanelPiece(self.CENTER, self.posX + (j * TILE_SIZE), self.posY + (i * TILE_SIZE))
        end
    end

    self.pieces[1][1] = PanelPiece(self.TOPLEFT, self.posX, self.posY)
    self.pieces[1][self.width/TILE_SIZE] = PanelPiece(self.TOPRIGHT, self.width - TILE_SIZE, self.posY)
    self.pieces[self.width/TILE_SIZE][self.height/TILE_SIZE] = PanelPiece(self.BOTTOMRIGHT, self.width - TILE_SIZE, self.height - TILE_SIZE)
    self.pieces[self.height/TILE_SIZE][1] = PanelPiece(self.BOTTOMLEFT, self.posX, self.height - TILE_SIZE)


    for i = 1, self.height/TILE_SIZE do
        for j = 1, self.width/TILE_SIZE do
            if i == 1 and j > 1 and j < self.width/TILE_SIZE then
                self.pieces[i][j] = PanelPiece(self.TOP, self.posX + (TILE_SIZE * (j - 1)), self.posY)
            elseif j == 1 and i > 1 and i < self.height/TILE_SIZE then
                self.pieces[i][j] = PanelPiece(self.LEFT, self.posX, self.posY + (TILE_SIZE * (i-1)))
            elseif j == self.width/TILE_SIZE and i > 1 and i < self.height/TILE_SIZE then
                self.pieces[i][j] = PanelPiece(self.RIGHT, self.posX + ((j-1) * TILE_SIZE), self.posY + ((i-1) * TILE_SIZE))
            elseif i == self.height/TILE_SIZE and j > 1 and j < self.width/TILE_SIZE then
                self.pieces[i][j] = PanelPiece(self.BOTTOM, self.posX + ((j-1) * TILE_SIZE), self.height - TILE_SIZE)
            elseif i > 1 and i < self.height/TILE_SIZE and j > 1 and j < self.width/TILE_SIZE then 
                self.pieces[i][j] = PanelPiece(self.CENTER, self.posX + ((j-1) * TILE_SIZE), self.posY + ((i-1) * TILE_SIZE))
            end
        end
    end
end

function Panel:render()
    for i = 1, self.height/TILE_SIZE do
        for j = 1, self.width/TILE_SIZE do
            self.pieces[i][j]:render()
        end
    end
end