function run_table_order_load()
    local i = 1
    while (i<=THREAD_AMOUNT)
    do
        if THREAD_TABLE[i] == nil then
            THREAD_ONCE_TABLE[i] = true
            i = i + 1
            break
        end
        if THREAD_ONCE_TABLE[i] == false then 
            local thread = love.thread.newThread(THREAD_TABLE[i])
            thread:start()
            THREAD_ONCE_TABLE[i] = true
        end
        i = i + 1
    end
    -- pop image data
    i = 1
    while (i<=THREAD_AMOUNT)
    do
        if ASSET_DATA[i] == nil then 
            ASSET_DATA[i] = love.thread.getChannel("thread_data_"..i..""):pop()
        end
        i = i + 1
    end
    -- load asset data to variables
    i = 1
    while (i<=THREAD_AMOUNT)
    do
        -- local loop_time = love.timer.getTime()
        if ASSET_DATA[i] ~= nil and LOAD_ONCE_TABLE[i] == false then
            ORDER_LOAD_TABLE[i](CURRENT_ORDER_TABLE[i])
            CURRENT_ORDER_TABLE[i] = CURRENT_ORDER_TABLE[i] + 1
            if CURRENT_ORDER_TABLE[i] > ORDER_SIZE_TABLE[i] then 
                CURRENT_ORDER_TABLE[i] = 0
                LOAD_ONCE_TABLE[i] = true
                LOADING_FUNCTION_AMOUNT = LOADING_FUNCTION_AMOUNT -1
            end
            -- 每帧只执行一个switch
            break
        end
        -- loop_time = love.timer.getTime() - loop_time
        -- if loop_time > 0.01 then
        --     print(i,CURRENT_ORDER_TABLE[i]-1,loop_time)
        -- end
        i = i + 1
    end
end
function init_order_load_table()
    THREAD_TABLE = {}
    THREAD_AMOUNT = 0
    THREAD_ONCE_TABLE = {}
    ASSET_DATA = {}
    ORDER_LOAD_TABLE = {}
    CURRENT_ORDER_TABLE = {}
    ORDER_SIZE_TABLE = {}
	LOAD_ONCE_TABLE = {}
    LOADING_FUNCTION_AMOUNT = 0
	NEXT_UPDATE_BLOCK = nil
	NEXT_DRAW_BLOCK = nil
    NEXT_PRESET = nil
end
