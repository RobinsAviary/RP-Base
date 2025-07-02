function DrawSelf(self)
    if self["s"] != nil then
        local s = self.s
        local p=self.p-- Position
        local ss=s.s -- Size
        local so=s.o -- Origin
        spr(s.i, p.x - so.x, p.y - so.y, ss.x, ss.y)
    end
end

Obj = {}
Obj.proto = {
    p=Vec2Make(),
    s=nil,
    draw=DrawSelf,
    step=nil,
}
Obj.mt = {}

function ObjMake(t)
    setmetatable(t, Obj.mt)
    Obj.mt.__index = function(t,k)
       return Obj.proto[k]
    end
    return t
end

function IterateCollection(c)
    for k,v in pairs(c) do
        if v["step"] then
            v:step()
        end
    end
    for k,v in pairs(c) do
        if v["draw"] then
            v:draw()
        end
    end
end

function ObjCenterX(o)
    o.p.x = Center
end

function ObjCenterY(o)
    o.p.y = Center
end

function ObjCenter(o)
    ObjCenterX()
    ObjCenterY()
end