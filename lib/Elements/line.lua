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
    self.pos2 = {x=x2,y=y2}
    return self
end

function Line:setPos2(x,y)
    self.pos2.x = x
    self.pos2.y = y
end


--emergency brandon function 
function DrawLine(obj,Term, x1, y1, x2, y2)
    local dx = math.abs(x1-x2)
    local sx = (x1 < x2) and 1 or -1
    local dy = math.abs(y1-y2)
    local sy = (y1 < y2) and 1 or -1
    local err = ((dx > dy) and dx or -dy) / 2
    local e2
    
    local x, y = x1, y1
    while(true) do
        dot(Term,x,y,obj.color)
        
        if x == x2 and y == y2 then break end
        e2 = err
        
        if e2 > -dx then
            err = err - dy
            x = x + sx
        end
        
        if e2 < dy then
            err = err + dx
            y = y + sy
        end
    end
end

function Line:render(Term)
    local x1 = self.pos.x
    local x2 = self.pos2.x
    local y1 = self.pos.y
    local y2 = self.pos2.y

    DrawLine(self,Term,x1,y1,x2,y2)
end