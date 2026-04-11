# XCLOUDMULTIXPRO iOS UI Clone (SwiftUI)

This folder contains an improved SwiftUI implementation inspired by the provided Behance concept and branded for:
- `XCLOUDMULTIXPRO`
- `XCLOUDMULTIXPRO INTEGRATION AND EFFICIENCY INITIATIVE`

Reference design:
https://www.behance.net/gallery/234235215/AI-Finance-Assistant-Finance-App-UIUX-Design

## What's improved in this revision

- Shared design tokens via `Theme.swift` for consistent styling.
- Reusable UI components via `Components.swift`.
- Richer dashboard with insight chips and quick action tiles.
- Analytics screen with weekly bars + insight cards.
- Assistant screen now supports local send interaction and message state.
- Cards/Profile screens expanded from placeholders to richer sections.
- App naming centralized in `AppIdentity.swift`.

## Folder layout

- `AppIdentity.swift` – product naming constants
- `FinanceAICloneApp.swift` – app entry point
- `RootTabView.swift` – app navigation shell
- `Theme.swift` – colors/gradients/theme primitives
- `Components.swift` – reusable card/chip/tile components
- `Models.swift` – sample models + mock data
- `DashboardView.swift`, `AnalyticsView.swift`, `AssistantView.swift`, `CardWalletView.swift`, `ProfileView.swift`

## Run

1. Create a new iOS App project in Xcode (SwiftUI lifecycle).
2. Replace generated Swift files with files from `FinanceAIClone/`.
3. Build and run on iOS 17+ simulator.

> Note: This is still UI-first and mock-data-driven (no real backend/API yet).
