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
function Circle:_init(x,y,radius,color,shapefactor,startang,endang)
    Object._init(self,x,y,radius*2,radius*2,color)
    self.radius = radius
    self.shapefactor = shapefactor and shapefactor or 1
    self.pie = startang and {start=startang,stop=endang} or nil -- if self.pie then piemode
    return self
end

function pnrg(heh)
    return (heh < 0) and -heh or heh
end

function clmp(heh)
    return (heh > 1) and 1 or heh
end

function dst(heh1x,heh1y,heh2x,heh2y,sf)
    return math.sqrt(((pnrg(heh1x-heh2x)^2)*clmp(1/sf))+((pnrg(heh1y-heh2y)^2)*clmp(sf)))
end

function Circle:render(Term)
    --INSERT PAF MAGIC HERE
    --k
    --https://www.youtube.com/watch?v=Xx-yryFIB6E
    uhhy1 = (1+self.pos.y)-(self.size.y/2)
    uhhy2 = uhhy1 + self.size.y
    
    uhhx1 = (1+self.pos.x)-(self.size.x/2)
    uhhx2 = uhhx1 + self.size.x
    
    print(uhhx1,"a",uhhx2)
    print(uhhy1,"a",uhhy2)
    
    --background of magic
    --for Y=uhhy1,uhhy2 do 
    --    for X=uhhx1,uhhx2 do
    --        dot(Term,X-1,Y-1,colors.blue)
    --    end
    --end
    
    --for Y=1+self.pos.y,self.size.y+self.pos.y do 
        --for X=1+self.pos.x,self.size.x+self.pos.x do
    for Y=uhhy1-5,uhhy2+5 do 
        for X=uhhx1-5,uhhx2+5 do
            if dst(X,Y,self.pos.x,self.pos.y,self.shapefactor) < self.radius
            then
                dot(Term,X,Y,self.color)
            end
        end
    end
end
