TextBox = {}
TextBox.__index = TextBox

setmetatable(TextBox, {
    __index = Object, -- this makes TextBox inherited from object
    __call = function(cls,...)
    local self = setmetatable({},cls)
    self:_init(...)
    return self
    end,
})

function TextBox:_init(x,y,w,h,text,textColor,backgroundColor)
    Object._init(self,x,y,w,h,backgroundColor)
    self.text = text and text or nil
    self.textColor = textColor and textColor or colors.black
end

function TextBox:setText(text)
    self.text = text
end
function TextBox:setTextColor(textColor)
    self.textColor = textColor
end

function TextBox:getText()
    return self.text
end
function TextBox:getTextColor()
    return self.textColor
end

function TextBox:render(Term)
    for Y=1,self.size.y do 
        for X=1,self.size.x do
            Term.setCursorPos(self.pos.x+X-1,self.pos.y+Y-1)
            Term.setTextColor(self.color)
            Term.setBackgroundColor(self.color)
            Term.write(" ")
        end
    end
    if self.text then
        local txt = ( #self.text>self.size.x-5 and string.sub(self.text,1,self.size.x-5).."..." or self.text)
        local startx = self.pos.x + math.floor(self.size.x/2 - #txt/2)
        local starty = self.pos.y + math.ceil(self.size.y/2) - 1
        Term.setCursorPos(startx,starty)
        Term.setTextColor(self.textColor)
        Term.write(txt)
    end
end