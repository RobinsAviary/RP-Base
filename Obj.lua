function DrawSprite(s, x, y)
    spr(s.i, x - s.o.x, y - s.o.y, s.s.x, s.s.y, s.fh, s.fv)
end

function DrawSelf(self)
    if self["s"] != nil then
        DrawSprite(self.s, self.p.x, self.p.y)
    end
end

Obj = {}
Obj.proto = {
    -- Values that can be set
    p=Vec2Make(), -- Position
    s=nil, -- Sprite
    draw=DrawSelf, -- Draw Event
    step=nil, -- Step Event
    spd=Vec2Make(), -- 2D Speed
    layer=nil, -- Visual Layer
    coroutines=nil, -- ObjCoroutines
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

function ObjLimitBounds(obj, bounds)
    local hull = obj.hull
    local hullOffset = Vec2Make(hull.x + hull.w, hull.y + hull.h)
    obj.p.x = Clamp(obj.p.x, bounds.x + hullOffset.x, bounds.x + bounds.w - hullOffset.x)
    obj.p.y = Clamp(obj.p.y, bounds.y + hullOffset.y, bounds.y + bounds.h - hullOffset.y)
end

function TableAdd(t, tToAdd)
    for k,v in pairs(tToAdd) do
        t[k] = v
    end
end