Line = {}
Line.__index = Line

setmetatable(Line, {
    __index = Object, -- this makes Line inherited from object
    __call = function(cls,...)
    local self = setmetatable({},cls)
    self:_init(...)
    return self
    end,
})
--Diffrent from most other objects, takes two positions.  
function Line:_init(x,y,x2,y2,color)
    Object._init(self,x,y,nil,nil,color)
    self.pos2 = {x2,y2}
    return self
end

function Line:render(Term)
    local x1 = self.pos.x
    local x2 = self.pos2.x
    local y1 = self.pos.y
    local y2 = self.pos2.y

    local len = math.sqrt(((x2-x1) ^ 2) + ((y1+y2) ^ 2))
    local ang = math.tan((y2-y1) / (x2-x1))
    
    for I = 1,len do 
        local ax = math.floor(ax = cos(ang) * I)
        local ay = math.floor(ay = sin(ang) * I)

        Term.setCursorPos(ax,ay)
        Term.setTextColor(self.color)
        Term.setBackgroundColor(self.color)
        Term.write(" ")
    end
end