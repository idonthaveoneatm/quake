return function(Color1, Color2)
    if Color1.R == Color2.R and Color1.G == Color2.G and Color1.B == Color2.B then
        return true
    end
    return false
end