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

function Box:render(Term)
    for Y=1,self.size.y do 
        for X=1,self.size.x do
            Term.setCursorPos(self.pos.x+X-1,self.pos.y+Y-1)
            Term.setTextColor(self.color)
            Term.setBackgroundColor(self.color)
            Term.write(" ")
        end
    end
end