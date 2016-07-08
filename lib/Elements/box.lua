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
    return self
end

function Box:render(Term)
    for Y=1,self.size.y do 
        for X=1,self.size.x do
            dot(Term,self.pos.x+X-1,self.pos.y+Y-1,self.color)
        end
    end
end