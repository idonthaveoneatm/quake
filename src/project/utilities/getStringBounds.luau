return function(text:string, properties)
    text = text or ""
    properties = properties or {
        TextSize = 14,
        Font = Enum.Font.Arial,
        VectorSize = Vector2.new(200,50)
    }
    local TextService = game:GetService("TextService")
    return TextService:GetTextSize(text,properties.TextSize,properties.Font,properties.VectorSize)
end