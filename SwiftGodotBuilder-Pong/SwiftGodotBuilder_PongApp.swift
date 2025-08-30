import SwiftGodot
import SwiftGodotKit
import SwiftUI

@main
struct SwiftGodotBuilder_PongApp: App {
  @State var app = GodotApp(packFile: "game.pck")

  let types = [PongPaddle.self, PongBall.self]

  var body: some Scene {
    Window("Pong", id: "pong") {
      GodotAppView()
        .environment(\.godotApp, app)
        .task {
          await bootstrap()
        }
    }
  }

  func bootstrap() async {
    guard let sceneTree = await waitForSceneTree(), let root = sceneTree.root else {
      print("Godot instance: timeout")
      return
    }

    types.forEach { register(type: $0) }

    actions.install()

    let realizedNode = GameView().makeNode()
    root.addChild(node: realizedNode)
  }

  func waitForSceneTree(_ tries: Int = 300, intervalNS: UInt64 = 200_000_000) async -> SceneTree? {
    for _ in 0..<tries {
      if app.instance != nil, let t = Engine.getMainLoop() as? SceneTree { return t }
      try? await Task.sleep(nanoseconds: intervalNS)
    }
    return nil
  }
}
