--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A Menu is simply a Selection layered onto a Panel, at least for use in this
    game. More complicated Menus may be collections of Panels and Selections that
    form a greater whole.
]]

Menu = Class{}

function Menu:init(def, selectable)
    self.panel = Panel(def.x, def.y, def.width, def.height)
    
    self.selection = Selection {
        items = def.items,
        x = def.x,
        y = def.y,
        width = def.width,
        height = def.height
    }
    
    self.isSelectable = false or selectable
end

function Menu:update(dt)
    if isSelectable then
        self.selection:update(dt)
    end
end

function Menu:render()
    self.panel:render()
    if isSelectable then
        self.selection:render()
    end
end