Elements = {}
Hooks = {}
index = 1
update = false
function Render(Term) --pass terminal / monitor to render too
    Term.setBackgroundColor(colors.black)
    Term.setTextColor(colors.white)
    Term.clear()
    Term.setCursorBlink(false)
    for _,Obj in pairs(Elements) do
        if Obj:getVisable() then
            Obj:render(Term)
        end
    end
end
 
function Hook(...) -- runs through all elements that have hooks and calls them
    for _,Obj in pairs(Hooks) do
        if Obj.hook == arg[1] then
            Obj:hooked(unpack(arg))
        end
    end
end
 
function Run(Term,FPS) -- max is 10 (for the cinematic look)
    local delay = FPS and math.max(1/FPS,0.1) or 0.2
    local args = {}
 
    while true do
        local timer = os.startTimer(delay)
        local args = {os.pullEvent()}
        if args[1] == "timer" then
            if update then update = false Render(Term) end
        else
            Hook(unpack(args))
        end
    end
end
 
 
--master object class
Object = {}
Object.__index = Object
 
setmetatable(Object, {
    __newindex = function() update = true end,
    __call = function(cls,...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
    end,
})
 
function Object:_init(x,y,w,h,color,text,textColor)
    Elements[index] = self
    self.index = index
    index = index+1
    self.pos = {x=x,y=y}
    self.size = {x=w,y=h}
    self.color = color and color or colors.white
    self.visable = true
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
    Elements[self.index] = nil
    Hooks[self.index] = nil 
    self = nil --this is where vars being like pointers and not actual vars gets confusing, will this change the users var for the object to nil?
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
 
--load all other Elements
local filepaths = fs.list("lib/Elements")
for _,v in pairs(filepaths) do
    dofile("lib/Elements/"..v)
end