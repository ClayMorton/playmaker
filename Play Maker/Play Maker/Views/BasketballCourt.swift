import SwiftUI

struct BasketballCourtView: View {
    @Binding var courtObjects: [CourtObject]
    var geometry: GeometryProxy
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
                .frame(width: geometry.size.width, height: geometry.size.height)
            
            // Render all court objects
            ForEach(courtObjects) { object in
                if object.type == .x {
                    Text("X")
                        .position(object.position)
                } else if object.type == .o {
                    Text("O")
                        .position(object.position)
                } else if object.type == .line, let direction = object.lineDirection {
                    Path { path in
                        path.move(to: object.position)
                        path.addLine(to: CGPoint(x: object.position.x + direction.x, y: object.position.y + direction.y))
                    }
                    .stroke(Color.white, lineWidth: 2)
                }
            }
        }
    }
}
