function love.conf(t)
    t.identity = "upload_order_probe"
    t.window.title = "upload_order_probe"
    t.window.width = 400
    t.window.height = 200
    t.window.vsync = 0
    t.modules.audio = false
    t.modules.sound = false
    t.modules.joystick = false
    t.modules.physics = false
    if t.version == "12.0" then
        -- 和游戏一样默认 vulkan;set ARUA_RENDERER=opengl 可以换
        local r = os.getenv("ARUA_RENDERER")
        if r == "opengl" then
            t.graphics.renderers = {"opengl"}
        else
            t.graphics.renderers = {"vulkan","opengl"}
        end
    end
end
