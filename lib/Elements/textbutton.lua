TextButton = {}
TextButton.__index = TextButton
 
setmetatable(TextButton, {
    __index = Object, -- this makes TextButton inherited from object
    __call = function(cls,...)
    local self = setmetatable({},cls)
    self:_init(...)
    return self
    end,
})
 
function TextButton:_init(x,y,w,h,text,textColor,color,activeColor)
    Object._init(self,x,y,w,h,color)
    Hooks[index] = self
    self.text = text = text and text or nil
    self.textColor = textColor and textColor or colors.black
    self.activeColor = activeColor and activeColor or color
    self.hook = "monitor_touch"
    return self
end

function TextButton:setText(text)
    self.text = text
end
function TextButton:setTextColor(textColor)
    self.textColor = textColor
end

function TextButton:getText()
    return self.text
end
function TextButton:getTextColor()
    return self.textColor
end


function TextButton:hooked(...) -- called when an element that registers itself in the hook table's event gets called
    local x = arg[3]
    local y = arg[4]
    if x >= self.pos.x and x<= self.pos.x +self.size.x and
            y >= self.pos.y and y<= self.pos.y +self.size.y then
        self:onButtonPressed(x,y)
        self.activated = true
        return true
    else
        return false
    end
end  
 
function TextButton:onButtonPressed(x,y)
    --I "think" the user should be able to do:
    --function MyTextButton:onButtonPressed()
    --  what ever they want to do
    --end
    --so that when the button is pressed i call this function, which should call their function
    -- because they overrode it
end
 
 
function TextButton:render(Term)
    local color = self.activated and self.activeColor or self.color
    for Y=1,self.size.y do
        for X=1,self.size.x do
            Term.setCursorPos(self.pos.x+X-1,self.pos.y+Y-1)
            Term.setTextColor(color)
            Term.setBackgroundColor(color)
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
    self.activated = false
end