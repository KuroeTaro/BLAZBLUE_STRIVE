function require_all_in_folder(folder)
    -- 获取文件夹内的所有文件和子文件夹
    local files = love.filesystem.getDirectoryItems(folder)

    for _, file in ipairs(files) do
        local filePath = folder .. "/" .. file

        -- 检查是否是文件
        if love.filesystem.getInfo(filePath, "file") then
            -- 检查扩展名是否是 .lua
            if file:sub(-4) == ".lua" then
                -- 动态加载文件，去掉 .lua 扩展名
                local moduleName = filePath:gsub("%.lua$", ""):gsub("/", ".")
                require(moduleName)
            end
        elseif love.filesystem.getInfo(filePath, "directory") then
            -- 如果是子文件夹，递归加载
            require_all_in_folder(filePath)
        end
    end
end
