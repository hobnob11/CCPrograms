Button = {}
Button.__index = Button
 
setmetatable(Button, {
    __index = Object, -- this makes Button inherited from object
    __call = function(cls,...)
    local self = setmetatable({},cls)
    self:_init(...)
    return self
    end,
})
 
function Button:_init(x,y,w,h,color,activeColor)
    Object._init(self,x,y,w,h,color)
    Hooks[index] = self
    self.activeColor = activeColor and activeColor or color
    self.hook = "monitor_touch"
    return self
end

function Button:setActiveColor(activeColor)
    self.activeColor = activeColor
end

function Button:getActiveColor()
    return self.activeColor
end

function Button:hooked(...) -- called when an element that registers itself in the hook table's event gets called
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
 
function Button:onButtonPressed(x,y)
    --I "think" the user should be able to do:
    --function MyButton:onButtonPressed()
    --  what ever they want to do
    --end
    --so that when the button is pressed i call this function, which should call their function
    -- because they overrode it
end
 
 
function Button:render(Term)
    local color = self.activated and self.activeColor or self.color
    for Y=1,self.size.y do
        for X=1,self.size.x do
            Term.setCursorPos(self.pos.x+X-1,self.pos.y+Y-1)
            Term.setTextColor(color)
            Term.setBackgroundColor(color)
            Term.write(" ")
        end
    end
    self.activated = false
end