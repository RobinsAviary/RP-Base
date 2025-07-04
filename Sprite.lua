-- Sprite

function SpriteMake(i, s, o, fh, fv)
    return {
        i=i or 0, -- Index
        s=s or Vec2Make(1,1), -- Size
        o=o or Vec2Make(), -- Offset
        fh = fh or false, -- Flip Horizontal
        fv = fv or false, -- Flip Vertical
    }
end