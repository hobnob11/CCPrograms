Box = {}
Box.__index = Box

setmetatable(Box, {
    __index = Object, -- this makes box inherited from object
    __call = function(cls,...)
    local self = setmetatable({},cls)
    self:_init(...)
    return self
    end,
})

function Box:_init(x,y,w,h,color)
    Object._init(self,x,y,w,h,color)
end

function Box:render()
    for Y=1,self.size.y do 
        for X=1,self.size.x do
            m.setCursorPos(self.pos.x+X-1,self.pos.y+Y-1)
            m.setTextColor(self.color)
            m.setBackgroundColor(self.color)
            m.write(" ")
        end
    end
end