function SpriteMake(i, s, o, fh, fv)
    return {
        i=i or 0,
        s=s or Vec2Make(1,1),
        o=o or Vec2Make(),
        fh = fh or false,
        fv = fv or false,
    }
end