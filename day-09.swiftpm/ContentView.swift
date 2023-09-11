import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Text("width: \(geometry.size.width)")
                    Text("height: \(geometry.size.width)")
                    Text("minX: \(geometry.frame(in: .named("me")).minX)")
                    Text("minY: \(geometry.frame(in: .named("me")).minY)")
                }
                .border(.orange)
            }
            .border(.pink)

            VStack(spacing: 0) {
                Text("Hello There!")
                MyRectangle()
            }
            .frame(width: 150, height: 100)

            // Ref: https://swiftui-lab.com/geometryreader-to-the-rescue/
            HStack {
                Text("SwiftUI")
                    .foregroundStyle(.black)
                    .font(.title)
                    .padding(15)
                    .background(RoundedCorners(color: .green, tr: 30, bl: 30).opacity(0.5))

                Text("Lab")
                    .foregroundStyle(.black)
                    .font(.title)
                    .padding(15)
                    .background(RoundedCorners(color: .blue, tl: 30, br: 30).opacity(0.5))
            }
            .padding(20)
            .border(.gray)
            .shadow(radius: 3)
        }
        .border(.gray)
    }
}

struct MyRectangle: View {
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .path(
                    in: CGRect(
                        x: geometry.size.width + 5,
                        y: 0,
                        width: geometry.size.width / 2.0,
                        height: geometry.size.height / 2.0
                    )
                )
                .fill(.blue)
        }
    }
}

struct RoundedCorners: View {
    var color: Color = .black
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height

                let tl = min(min(tl, h / 2), w / 2)
                let tr = min(min(tr, h / 2), w / 2)
                let bl = min(min(bl, h / 2), w / 2)
                let br = min(min(br, h / 2), w / 2)

                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            }
            .fill(color)
        }
    }
}

#Preview {
    ContentView()
}
