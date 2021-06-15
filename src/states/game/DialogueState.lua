--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

DialogueState = Class{__includes = BaseState}

function DialogueState:init(text, callback)
    self.panel = Panel(10,10,20,20)
end

function DialogueState:update(dt)
    
end

function DialogueState:render()
    self.panel:render()
end