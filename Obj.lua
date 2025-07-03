function DrawSelf(self)
    if self["s"] != nil then
        local s = self.s -- Sprite
        local p=self.p -- Position
        local ss=s.s -- Size
        local so=s.o -- Origin
        spr(s.i, p.x - so.x, p.y - so.y, ss.x, ss.y, s.fh, s.fv)
    end
end

Obj = {}
Obj.proto = {
    p=Vec2Make(),
    s=nil,
    draw=DrawSelf,
    step=nil,
    spd=Vec2Make(),
    layer=nil,
    coroutines=nil,
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

function IterateCollection(c, functionName)
    for k,v in pairs(c) do
        if v[functionName] then
            v[functionName](v)
        end
    end
end

function IterateLayer(c, layer)
    for k,v in pairs(c) do
        if v["layer"] == layer then
            if v["draw"] then
                v:draw()
            end
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

function sprv(index, pos, size, flipw, fliph)
    local size = size or Vec2MakeS(1)
    local x = size.x
    local y = size.y
    spr(index, pos.x, pos.y, x, y, flipw, fliph)
end

function SprRelative(obj, sprindex, offset, size, flipw, fliph)
    local offset = offset or Vec2Make()
    sprv(sprindex, Vec2Add(obj.p, offset), size, flipw, fliph)
end

function ObjCoroutine(obj)
    for co in all(obj.coroutines) do
        if (costatus(co) != "dead") then
            assert(coresume(co, obj)) -- error handling
        else
            del(obj.coroutines, co)
        end
    end
end

function IterateObjCoroutines(coll)
    for obj in all(coll) do
        ObjCoroutine(obj)
    end
end

function DrawHull(obj, color)
    local x1 = obj.p.x + obj.hull.x
    local y1 = obj.p.y + obj.hull.y
    rect(x1, y1, x1 + obj.hull.w - 1, y1 + obj.hull.h - 1, color)
end