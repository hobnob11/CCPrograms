m = peripheral.find("monitor")

Box = {}
Box.__index = Box

setmetatable(Box,{
    __call = function(cls,...)
        return cls.new(...)
    end,
})

function Box.new(x,y,w,h,color,text,textColor)
    local self = setmetatable({},Box)
    self.pos.x = x
    self.pos.y = y
    self.size.x = w
    self.size.y = h
    self.color = color and color or colors.white
    self.text = text and text or nil
    self.textColor = textColor and textColor or colors.black
    return self
end

-- : puts "self" as the first arg.
function Box:setPos(x,y)
    self.pos.x = x
    self.pos.y = y
end

function Box:setSize(w,h)
    self.size.x = w
    self.size.y = h
end

function Box:setColor(color)
    self.color = color
end

function Box:setText(text)
    self.text = text
end

function Box:setTextColor(textColor)
    self.textColor = textColor
end



--[[
function box(box)
    for Y=1,box.size.y do 
        for X=1,box.size.x do
            m.setCursorPos(box.pos.x+X-1,box.pos.y+Y-1)
            m.setTextColor(box.color)
            m.setBackgroundColor(box.color)
            m.write(" ")
        end
    end
    if box.text then
        local txt = ( #box.text>box.size.x-5 and string.sub(box.text,1,box.size.x-5).."..." or box.text)
        local startx = box.pos.x + math.floor(box.size.x/2 - #txt/2)
        local starty = box.pos.y + math.ceil(box.size.y/2) - 1
        m.setCursorPos(startx,starty)
        m.setTextColor(box.textColor)
        m.write(txt)
    end
end
--]]
