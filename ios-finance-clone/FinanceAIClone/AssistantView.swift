import SwiftUI

struct AssistantView: View {
    @State private var prompt = ""
    private let messages = [
        "Your operating account is 12% above monthly average.",
        "Would you like me to schedule a transfer to payroll?"
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("ICBC Assistant")
                .font(.title3.bold())
                .foregroundStyle(.white)

            ForEach(messages, id: \.self) { message in
                Text(message)
                    .foregroundStyle(.white)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white.opacity(0.05), in: RoundedRectangle(cornerRadius: 12))
            }

            HStack {
                TextField("Ask assistant...", text: $prompt)
                    .textFieldStyle(.plain)
                    .foregroundStyle(.white)
                Image(systemName: "arrow.up.circle.fill")
                    .foregroundStyle(AppTheme.alert)
                    .font(.title2)
            }
            .padding(12)
            .background(Color.white.opacity(0.05), in: RoundedRectangle(cornerRadius: 12))

            Spacer()
        }
        .padding(20)
        .background(AppTheme.background)
    }
}
