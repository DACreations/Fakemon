--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

DialogueState = Class{__includes = BaseState}

function DialogueState:init(text, callback)
    self.panel = Panel(40,40,100,100)
end

function DialogueState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateStack:pop()
    end
end

function DialogueState:render()
    self.panel:render()
end