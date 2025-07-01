OBJNAME = Obj:new({
    new = function(self, tbl)
        tbl = Obj.new(self, tbl)

        

        return tbl
    end,

    step=function(self)
        self:move()
    end,

    draw=function(self)
        self:drawself()
    end,
})