--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

DialogueState = Class{__includes = BaseState}

function DialogueState:init(text, callback)
    self.panel = Textbox(0,VIRTUAL_HEIGHT-48,VIRTUAL_WIDTH, 48, text, gFonts['text'])
    self.callback = callback or function() end
end

function DialogueState:update(dt)
    self.panel:update(dt)

    if self.panel:isClosed() then
        self.callback()
        gStateStack:pop()
    end
end

function DialogueState:render()
    self.panel:render()
end