import SwiftUI
import PlaygroundSupport

struct BackgroudThreadsAndQueuesPlayground: View {
  @StateObject var vm = BackgroundThreadViewModel()
  var body: some View {
    Text("Hello, World!")
  }
}

PlaygroundPage.current.setLiveView(BackgroudThreadsAndQueuesPlayground())
