<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Snake Game</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #111;
      color: #eee;
      text-align: center;
      margin: 0;
      padding: 20px;
    }
    h1 {
      color: #7fff00;
    }
    canvas {
      background: #222;
      border: 2px solid #7fff00;
      display: block;
      margin: 20px auto;
    }
  </style>
</head>
<body>
  <h1>🐍 Snake Game</h1>
  <canvas id="gameCanvas" width="400" height="400"></canvas>
  <p>Use arrow keys to move. Don’t hit the walls or yourself!</p>

  <script>
    const canvas = document.getElementById("gameCanvas");
    const ctx = canvas.getContext("2d");

    const box = 20;
    let snake = [{ x: 9 * box, y: 10 * box }];
    let direction;
    let food = {
      x: Math.floor(Math.random() * 20) * box,
      y: Math.floor(Math.random() * 20) * box
    };
    let score = 0;

    document.addEventListener("keydown", directionControl);

    function directionControl(e) {
      if (e.key === "ArrowLeft" && direction !== "RIGHT") direction = "LEFT";
      else if (e.key === "ArrowUp" && direction !== "DOWN") direction = "UP";
      else if (e.key === "ArrowRight" && direction !== "LEFT") direction = "RIGHT";
      else if (e.key === "ArrowDown" && direction !== "UP") direction = "DOWN";
    }

    function collision(head, array) {
      for (let segment of array) {
        if (head.x === segment.x && head.y === segment.y) return true;
      }
      return false;
    }

    function draw() {
      ctx.fillStyle = "#111";
      ctx.fillRect(0, 0, 400, 400);

      for (let i = 0; i < snake.length; i++) {
        ctx.fillStyle = i === 0 ? "#7fff00" : "#32cd32";
        ctx.fillRect(snake[i].x, snake[i].y, box, box);
      }

      ctx.fillStyle = "#ff4500";
      ctx.fillRect(food.x, food.y, box, box);

      let snakeX = snake[0].x;
      let snakeY = snake[0].y;

      if (direction === "LEFT") snakeX -= box;
      if (direction === "UP") snakeY -= box;
      if (direction === "RIGHT") snakeX += box;
      if (direction === "DOWN") snakeY += box;

      if (snakeX === food.x && snakeY === foo

