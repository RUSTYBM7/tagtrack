import SwiftUI

struct AssistantView: View {
    @State private var prompt = ""

    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Text("AI Finance Assistant")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                Spacer()
            }

            ScrollView {
                VStack(spacing: 10) {
                    ForEach(SampleData.messages) { message in
                        HStack {
                            if message.role == .assistant {
                                messageBubble(message.text, role: .assistant)
                                Spacer(minLength: 50)
                            } else {
                                Spacer(minLength: 50)
                                messageBubble(message.text, role: .user)
                            }
                        }
                    }
                }
            }

            HStack(spacing: 8) {
                TextField("Ask about your finances...", text: $prompt)
                    .textFieldStyle(.plain)
                    .foregroundStyle(.white)
                    .padding(12)
                    .background(Color.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 12))

                Button {
                    prompt = ""
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.mint)
                }
            }
        }
        .padding()
        .background(Color.black)
    }

    private func messageBubble(_ text: String, role: ChatMessage.Role) -> some View {
        Text(text)
            .foregroundStyle(.white)
            .padding(12)
            .background(
                role == .assistant
                ? Color.white.opacity(0.08)
                : Color.mint.opacity(0.25),
                in: RoundedRectangle(cornerRadius: 12)
            )
    }
}
