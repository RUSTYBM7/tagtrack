import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 70))
                .foregroundStyle(.mint)

            Text("Alex Morgan")
                .font(.title3.bold())
                .foregroundStyle(.white)

            Text("Premium Plan • AI Insights Enabled")
                .font(.subheadline)
                .foregroundStyle(.gray)

            Spacer()
        }
        .padding()
        .background(Color.black)
    }
}
