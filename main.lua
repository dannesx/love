function love.load()
    love.window.setMode(800, 600)
    love.window.setTitle("Pong")

    paddle1 = { x = 50, y = 250, width = 20, height = 100}
    paddle2 = { x = 730, y = 250, width = 20, height = 100}
    ball = { x = 400, y = 300, size = 20, dx = 5, dy = 5}
end

function love.update(dt)
    if love.keyboard.isDown("w") then
        paddle1.y = paddle1.y - 5
    elseif love.keyboard.isDown("s") then
        paddle1.y = paddle1.y + 5
    end

    if love.keyboard.isDown("up") then
        paddle2.y = paddle2.y - 5
    elseif love.keyboard.isDown("down") then
        paddle2.y = paddle2.y + 5
    end

    if ball.y < 0 or ball.y + ball.size > 600 then
        ball.dy = -ball.dy
    end

    ball.x = ball.x + ball.dx
    ball.y = ball.y + ball.dy

    if ball.x < paddle1.x + paddle1.width and ball.y + ball.size > paddle1.y and ball.y < paddle1.y + paddle1.height then
        ball.dx = -ball.dx
    end

    if ball.x + ball.size > paddle2.x and ball.y + ball.size > paddle2.y and ball.y < paddle2.y + paddle2.height then
        ball.dx = -ball.dx
    end
end

function love.draw()
    love.graphics.print("Hello, Pong!", 400, 300)
    love.graphics.rectangle("fill", paddle1.x, paddle1.y, paddle1.width, paddle1.height)
    love.graphics.rectangle("fill", paddle2.x, paddle2.y, paddle2.width, paddle2.height)
    love.graphics.circle("fill", ball.x, ball.y, ball.size)
end
