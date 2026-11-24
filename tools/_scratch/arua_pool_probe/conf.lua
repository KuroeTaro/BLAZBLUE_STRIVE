function love.conf(t)
    t.identity = "arua_pool_probe"
    t.window.title = "arua_pool_probe"
    t.window.width = 1600
    t.window.height = 900
    t.window.vsync = 0
    t.modules.audio = false
    t.modules.sound = false
    t.modules.joystick = false
    t.modules.physics = false
    if t.version == "12.0" then
        local r = os.getenv("ARUA_RENDERER")
        if r == "opengl" then
            t.graphics.renderers = {"opengl"}
        else
            t.graphics.renderers = {"vulkan","opengl"}
        end
    end
end
