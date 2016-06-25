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