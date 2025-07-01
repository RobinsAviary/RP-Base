function ObjMake(x, y, s)
    local o={
        p=Vec2Make(),
        s=s or nil,

    }
    return o
end

function ObjStep()

end

function ObjDraw()

end

function DrawSelf(obj)
    if obj.s != nil then
        local p=obj.p
        local s=obj.s
        local ss=s.s
        local so=s.o
        spr(s.i, p.x - so.x, p.y - so.y, ss.x, ss.y)
    end
end

function IterateCollection(c)
    for i in all(c) do
        ObjStep(i)
    end
    for i in all(c) do
        ObjDraw(i)
    end
end