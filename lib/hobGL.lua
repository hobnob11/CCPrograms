--m = peripheral.find("monitor")

local Objects = {}
local index = 1

function Render(Term) --pass terminal / monitor to render too
    Term.setBackgroundColor(colors.black)
    Term.setTextColor(colors.white)
    Term.clear()
    Term.setCursorBlink(false)

    for _,Obj in Objects do 
        if Obj:getVisable() then 
            Obj:render()
        end
    end
end

--master object class
local Object = {}
Object.__index = Object

setmetatable(Object,{
    __call = function(cls,...)
        return cls.new(...)
    end,
})

function Object.new(x,y,w,h,color,text,textColor)
    local self = setmetatable({},Object)
    Objects[index] = self
    self.index = index 
    index = index+1
    self.pos = {x=x,y=y}
    self.size = {x=w,y=h}
    self.color = color and color or colors.white
    self.visible = true
    return self
end

-- : puts "self" as the first arg.
function Object:setPos(x,y)
    self.pos.x = x
    self.pos.y = y
end
function Object:setSize(w,h)
    self.size.x = w
    self.size.y = h
end
function Object:setColor(color)
    self.color = color
end
function Object:setVisable(bool)
    self.visable = bool
end
function Object:remove()
    Objects[self.index] = nil
end

function Object:getPos()
    return self.pos
end
function Object:getSize()
    return self.size
end
function Object:getColor()
    return self.color
end
function Object:getVisable()
    return self.visable
end

--load all other objects 
local filepaths = fs.list("lib/objects")
for _,v in pairs(filepaths) do 
    dofile("lib/objects/"..v)
end
