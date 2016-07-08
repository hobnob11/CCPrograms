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

function pnrg(heh)
    return (heh < 0) and -heh or heh
end

function dst(heh1x,heh1y,heh2x,heh2y)
    return math.sqrt((pnrg(heh1x-heh2x)^2)+(pnrg(heh1y-heh2y)^2))

function Circle:render(Term)
    --INSERT PAF MAGIC HERE
    --k
    --https://www.youtube.com/watch?v=Xx-yryFIB6E
    for Y=1,self.size.y do 
        for X=1,self.size.x do
            if dst(X,Y,self.pos.x,self.pos.y) < self.radius
            then
                dot(Term,self.pos.x+X-1,self.pos.y+Y-1,self.color)
            end
        end
    end
end
end
