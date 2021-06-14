Level = Class{}

function Level:init()
    self.tileWidth = 50
    self.tileHeight = 50

    self.baseLayer = TileMap(self.tileWidth, self.tileHeight)
    self.grassLayer = TileMap(self.tileWidth, self.tileHeight)
    self.halfGrassLayer = TileMap(self.tileWidth, self.tileHeight)

    self:createMaps()

    self.player = Player {
        animations = ENTITY_DEFS['player'].animations,
        mapX = 10,
        mapY = 10,
        width = 16,
        height = 16
    }
end

function Level:createMaps()
    for y = 1, self.tileHeight do
        table.insert(self.baseLayer.tiles, {})
        
        for x = 1, self.tileWidth do
            local id = TILE_IDS['grass'][math.random(#TILE_IDS['grass'])]

            table.insert(self.baseLayer.tiles[y], Tile(x, y, id))
        end
    end

    for y = 1, self.tileHeight do
        table.insert(self.grassLayer.tiles, {})
        table.insert(self.halfGrassLayer.tiles, {})

        for x = 1, self.tileWidth do
            local id = y > 10 and TILE_IDS['tall-grass'] or TILE_IDS['empty']

            table.insert(self.grassLayer.tiles[y], Tile(x, y, id) )
        end
    end
end

function Level:update(dt)
    self.player:update(dt)
end

function Level:render()
    self.baseLayer:render()
    self.grassLayer:render()
    self.player:render()
end