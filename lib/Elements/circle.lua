Circle = {}
Circle.__index = Circle

setmetatable(Circle, {
    __index = Object, -- this makes Circle inherited from object
    __call = function(cls,...)
    local self = setmetatable({},cls)
    self:_init(...)
    return self
    end,
})

--gasp this is strange too, replaces size with radius, and has start and end angles for pie mode
function Circle:_init(x,y,radius,color,startang,endang)
    Object._init(self,x,y,nil,nil,color)
    self.radius = radius
    self.pie = startang and {start=startang,stop=endang} or nil -- if self.pie then piemode
    return self
end

function Circle:render(Term)
    --INSERT PAF MAGIC HERE
end