import SwiftGodot
import SwiftGodotBuilder

func Wall() -> GNode<Area2D> {
  let wallShape = RectangleShape2D()
  wallShape.size = Vector2(x: 32, y: 640)

  return
    Area2D$("Wall") {
      CollisionShape2D$("WallCollision").shape(wallShape)
    }
    .on(\.areaEntered) { _, area in
      if let area = area as? PongBall {
        area.reset()
      }
    }
}
