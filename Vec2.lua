-- Vec2

function Vec2Make(x, y)
    return {
        x = x or 0,
        y = y or 0,
    }
end

function Vec2MakeS(xy)
    return {
        x = xy or 0,
        y = xy or 0,
    }
end

function Vec2Add(vec1, vec2)
    return Vec2Make(vec1.x + vec2.x, vec1.y + vec2.y)
end

function Vec2Sub(vec1, vec2)
    return Vec2Make(vec1.x - vec2.x, vec1.y - vec2.y)
end

function Vec2Mul(vec1, vec2)
    return Vec2Make(vec1.x * vec2.x, vec1.y * vec2.y)
end

function Vec2Div(vec1, vec2)
    return Vec2Make(vec1.x / vec2.x, vec1.y / vec2.y)
end