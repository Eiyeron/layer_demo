-- Image loading

local frames = {}
for i=0,20 do
    table.insert(frames, string.format("castle/out%d.png",i))
end

local scale = 8

-- Creating the batch

castle_image = love.graphics.newArrayImage(frames)
castle_image:setFilter("nearest")
local castle_batch = love.graphics.newSpriteBatch(castle_image, 20*scale)
for i=0,20 do
    for j=0,scale-1 do
        castle_batch:addLayer(1, 0, 0)
    end
end

function get_angle()
    return love.mouse.getX() / love.window.getMode() + 0.5
end

function love.keypressed(key)
    if key == "f" then
        castle_image:setFilter(castle_image:getFilter() == "nearest" and "linear" or "nearest")
    end
end

function love.update(dt)

    -- Updating the batch's angle according to the mouse's position

    local a = get_angle()
    local a_tau = a * math.pi * 2
    local cx, cy = castle_image:getWidth()/2, castle_image:getHeight()/2
    for i=0,castle_batch:getCount()-1 do
        local fr = math.floor(i/scale)+1
        local v = 1 - math.abs(0.5 - i/castle_batch:getCount())
        castle_batch:setColor(v, v, v, 1)
        castle_batch:setLayer(i+1, fr, 0, 0 - i, a_tau, scale,scale, cx, cy)
    end
end

function love.draw()
    love.graphics.clear()

    local a =get_angle()
    local a_tau = a * math.pi * 2

    local ox, oy = 400,100
    local cx, cy = 400, 500
    local dx, dy = cx - ox, cy - oy
    local cpx = math.cos(a_tau) * dx - math.sin(a_tau) * dy + ox
    local cpy = math.sin(a_tau) * dx + math.cos(a_tau) * dy + oy

    love.graphics.circle("fill", ox, oy, 10)

    love.graphics.draw(castle_batch, cpx, cpy)

    love.graphics.print(love.timer.getFPS(), 0,0)
end