Textbox = Class{}

function Textbox:init(x, y, width, height, text, font)
    self.panel = Panel(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.text = text
    self.font = font or gFonts['small']
    _, self.textPages = self.font:getWrap(self.text, self.width - 12)

    self.pageCounter = 1
    self.endOfText = false
    self.closed = false

    self:next()
end

--[[
    Goes to the next page of text if there is any, otherwise toggles the textbox.
]]
function Textbox:nextChunks()
    local pages = {}

    for i = self.pageCounter, self.pageCounter + 2 do
        table.insert(pages, self.textPages[i])

        -- if we've reached the number of total pages, we can return
        if i == #self.textPages then
            self.endOfText = true
            return pages
        end
    end

    self.pageCounter = self.pageCounter + 3

    return pages
end

function Textbox:next()
    if self.endOfText then
        self.displayingChunks = {}
        self.panel:toggle()
        self.closed = true
    else
        self.displayingChunks = self:nextChunks()
    end
end

function Textbox:update(dt)
    if love.keyboard.wasPressed('space') or love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        love.audio.play(gSounds['accept'])
        self:next()
    end
end

function Textbox:isClosed()
    return self.closed
end

function Textbox:render()
    self.panel:render()
    
    love.graphics.setFont(self.font)
    for i = 1, #self.displayingChunks do
        love.graphics.print(self.displayingChunks[i], self.x + 3, self.y + 3 + (i - 1) * 16)
    end
end