Player = Class{__includes = Entity}

function Player:init(def)
    Entity.init(self, def)

    self.party = Party {
        pokemon = {
            Fakemon(Fakemon.getRandomDef(), 5)
        }
    }
end