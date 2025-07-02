function DrawSelf(self)
    if self["s"] != nil then
        local s = self.s -- Sprite
        local p=self.p -- Position
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
    spd=Vec2Make(),
}

function ObjMake(t)
    local t = t or {} -- Allows user to pass in values
    local copy = deepcopy(Obj.proto) -- Copy the prototype table to a new table
    -- Update copy with values from t
    for k,v in pairs(t) do
        copy[k] = v
    end
    return copy -- Return the new object!
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

function ObjMove(self)
    self.p = Vec2Add(self.p, self.spd)
end

function ObjPosOrigin(obj)
    return Vec2Add(obj.p, obj.s.o)
end