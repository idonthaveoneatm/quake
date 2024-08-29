local functions = {}

function functions.cloneref(service)
    if cloneref then
        return cloneref(service)
    else
        return service
    end
end

functions.getgenv = getgenv or nil
return functions