m = peripheral.wrap("right")
rednet.open("top")

blastdoor = rednet.lookup("frames","blastdoor")

function box(box)
    for Y=1,box.size.y do 
        for X=1,box.size.x do
            m.setCursorPos(box.pos.x+X-1,box.pos.y+Y-1)
            m.setTextColor(box.color)
            m.setBackgroundColor(box.color)
            m.write(" ")
        end
    end
    if box.text then
        local txt = (#box.text>box.size.x-5 ? string.sub(box.text,1,box.size.x-5).."..." : box.text)
        local startx = box.pos.x + math.floor(box.size.x/2 - #txt/2)
        local starty = box.pos.y + math.ceil(box.size.y/2) - 1
        m.setCursorPos(startx,starty)
        m.setTextColor(box.textColor)
        m.write(txt)
end

m.clear()

box1 = {pos={x=5,y=2},size={x=10,y=1},color=colors.red}

box(box1)

box2 = {pos={x=5,y=2},size={x=10,y=1},color=colors.blue,text="heh",textColor=colors.white}

box(box2)