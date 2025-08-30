import SwiftGodot
import SwiftGodotBuilder

struct GameView: GView {
  var ballShape = RectangleShape2D()

  init() {
    ballShape.size = Vector2(x: 8, y: 8)
  }

  var body: some GView {
    Node2D$("Game") {
      Sprite2D$("Separator")
        .texture("separator.png")
        .position(Vector2(x: 320, y: 200))

      GNode<PongBall>("Ball") {
        Sprite2D$("BallTexture")
          .texture("ball.png")

        CollisionShape2D$("BallCollision")
          .shape(ballShape)
      }
      .position(Vector2(x: 160, y: 100))

      Wall()
        .position(Vector2(x: 0, y: 200))

      Wall()
        .position(Vector2(x: 630, y: 200))

      FloorCeiling(bounceDirection: 1)
        .position(Vector2(x: 320, y: -10))

      FloorCeiling(bounceDirection: -1)
        .position(Vector2(x: 320, y: 410))

      Paddle("Left")
        .modulate(Color(r: 0, g: 1, b: 1, a: 1))
        .position(Vector2(x: 70, y: 192))

      Paddle("Right")
        .modulate(Color(r: 1, g: 0, b: 1, a: 1))
        .position(Vector2(x: 580, y: 192))

      Camera2D$("Camera")
        .offset(Vector2(x: 320, y: 200))
    }
  }
}






