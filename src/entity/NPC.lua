NPC = Class{__includes = Entity}

function NPC:init(def, text)
    Entity.init(self, def)
    self.static = def.static
    self.text = text
end

function NPC:onInteract()
    gStateStack:push(DialogueState(self.text))
end