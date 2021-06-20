Level = Class{__includes = NPC_movements}

function Level:init()
    self.tileWidth = 50
    self.tileHeight = 50

    self.baseLayer = TileMap(self.tileWidth, self.tileHeight)
    self.grassLayer = TileMap(self.tileWidth, self.tileHeight)
    self.halfGrassLayer = TileMap(self.tileWidth, self.tileHeight)

    self.npc1 =  NPC {
        animations = ENTITY_DEFS['npc'].animations,
        mapX = 2,
        mapY = 2,
        width = 16,
        height = 16,
        static = true
    }

    self.player = Player {
        animations = ENTITY_DEFS['player'].animations,
        mapX = 10,
        mapY = 10,
        width = 16,
        height = 16
    }
    
    self:createMaps()
    self:createPlayer()
    self:createNPC(self.npc1)
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
    self.npc1:update(dt)
end

function Level:render()
    self.baseLayer:render()
    self.grassLayer:render()
    self.player:render()
    self.npc1:render()
end

function Level:createPlayer()
    self.player.stateMachine = StateMachine {
        ['walk'] = function () return PlayerWalkState(self.player, self) end,
        ['idle'] = function () return PlayerIdleState(self.player) end
    }
    self.player.stateMachine:change('idle')
end

function Level:createNPC(npc)
    
    npc.stateMachine = StateMachine {
        ['walk'] = function () return NPCWalkState(npc, self) end,
        ['idle'] = function () return NPCIdleState(npc, 0) end
    }
    npc.stateMachine:change('idle')
end