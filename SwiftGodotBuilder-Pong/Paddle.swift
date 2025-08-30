import SwiftGodot
import SwiftGodotBuilder

func Paddle(_ name: String) -> GNode<PongPaddle> {
  let paddleShape = RectangleShape2D()
  paddleShape.size = Vector2(x: 8, y: 32)

  return
    GNode<PongPaddle>(name) {
      Sprite2D$().texture("paddle.png")
      CollisionShape2D$().shape(paddleShape)
    }
    .on(\.areaEntered) { paddle, area in
      guard let area = area as? PongBall else { return }
      area.direction = Vector2(x: Float(paddle._ball_dir), y: Float.random(in: -1 ... 1)).normalized()
    }
}
