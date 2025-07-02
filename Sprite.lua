function SpriteMake(i, s, o, fh, fv)
    return {
        i=i or 0, -- Index
        s=s or Vec2Make(1,1), -- Size
        o=o or Vec2Make(), -- Ofsset
        fh = fh or false,
        fv = fv or false,
    }
end