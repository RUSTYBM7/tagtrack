import SwiftUI

struct AssistantView: View {
    @State private var prompt = ""
    @State private var messages = SampleData.starterMessages

    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Text("\(AppIdentity.shortName) Assistant")
                    .font(.title3.bold())
                    .foregroundStyle(AppTheme.primaryText)
                Spacer()
                TagChip(title: "Online", icon: "bolt.fill")
            }

            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(messages) { message in
                            messageRow(message)
                                .id(message.id)
                        }
                    }
                }
                .onChange(of: messages.count) { _, _ in
                    if let lastId = messages.last?.id {
                        withAnimation {
                            proxy.scrollTo(lastId, anchor: .bottom)
                        }
                    }
                }
            }

            HStack(spacing: 8) {
                TextField("Ask about your finances...", text: $prompt)
                    .textFieldStyle(.plain)
                    .foregroundStyle(AppTheme.primaryText)
                    .padding(12)
                    .background(AppTheme.surface, in: RoundedRectangle(cornerRadius: 12))

                Button(action: sendPrompt) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(AppTheme.accent)
                }
                .disabled(prompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding()
        .background(AppTheme.background)
    }

    private func messageRow(_ message: ChatMessage) -> some View {
        HStack {
            if message.role == .assistant {
                bubble(message.text, role: .assistant)
                Spacer(minLength: 40)
            } else {
                Spacer(minLength: 40)
                bubble(message.text, role: .user)
            }
        }
    }

    private func bubble(_ text: String, role: ChatMessage.Role) -> some View {
        Text(text)
            .foregroundStyle(AppTheme.primaryText)
            .padding(12)
            .background(
                role == .assistant ? AppTheme.surface : AppTheme.accent.opacity(0.26),
                in: RoundedRectangle(cornerRadius: 12)
            )
    }

    private func sendPrompt() {
        let cleaned = prompt.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !cleaned.isEmpty else { return }

        messages.append(.init(role: .user, text: cleaned))
        prompt = ""

        let response = "Try the 50/30/20 rule this week: keep needs under 50%, wants under 30%, and save 20%."
        messages.append(.init(role: .assistant, text: response))
    }
}
