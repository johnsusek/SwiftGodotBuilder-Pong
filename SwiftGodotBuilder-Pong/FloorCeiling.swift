//
//  FloorCeiling.swift
//
//  Created by John Susek on 8/29/25.
//

import SwiftGodot
import SwiftGodotBuilder

func FloorCeiling(bounceDirection: Int) -> GNode<Area2D> {
  let floorShape = RectangleShape2D()
  floorShape.size = Vector2(x: 640, y: 32)

  return
    Area2D$("FloorCeiling") {
      CollisionShape2D$("FloorCeilingCollision").shape(floorShape)
    }
    .on(\.areaEntered) { _, area in
      if let area = area as? PongBall {
        area.direction = (area.direction + Vector2(x: 0, y: Float(bounceDirection))).normalized()
      }
    }
}
