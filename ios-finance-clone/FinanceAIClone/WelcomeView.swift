import SwiftUI

struct WelcomeView: View {
    let onContinue: () -> Void

    var body: some View {
        ZStack(alignment: .bottom) {
            WebContentView(url: BrandAssetURLs.welcomeAnimationGIF)
                .ignoresSafeArea()

            LinearGradient(
                colors: [Color.clear, Color.black.opacity(0.9)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 14) {
                AsyncImage(url: BrandAssetURLs.vrLogoImage) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 145)
                .clipShape(RoundedRectangle(cornerRadius: 16))

                Text(AppIdentity.shortName)
                    .font(.title.bold())
                    .foregroundStyle(.white)

                Text(AppIdentity.longName)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white.opacity(0.8))

                Button(action: onContinue) {
                    Text("Enter App")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(AppTheme.accent)
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
            .padding()
        }
    }
}
