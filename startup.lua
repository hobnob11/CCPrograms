rednet.open("right")
rednet.host("frames","blastdoor")

--close door side is back
--open door is top
-- length is 13

function move(side,dist)
    print("move"..side..dist)
    for I = 1,dist do 
        rs.setOutput(side,true)
        sleep(0.1)
        rs.setOutput(side,false)
        sleep(1)
    end
end

while true do
    sender,msg,dist,protc = rednet.receive("frames")
    print("rednet"..msg)
    if msg == "open" then
        move("top",13)
    elseif msg == "close" then
        move("back",13)
    end
end