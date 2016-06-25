m = peripheral.wrap("right")
rednet.open("top")

blastdoor = rednet.lookup("frames","blastdoor")

function box(pos,size,color)
    for Y=1,size.y do 
        for X=1,size.x do
            m.setCursorPos(pos.x+size.x-1,pos.y+size.y-1)
            m.setTextColor(color)
            m.setBackgroundColor(color)
            m.write(" ")
        end
    end
end


box1 = {}
box1.pos = {x=5,y=2}
box1.size = {x=10,y=1}

box(box1.pos,box1.size,colors.red)
