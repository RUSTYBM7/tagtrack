# Xcode Setup & Deployment Guide

## Enhanced AnalyticsView Features

The updated `AnalyticsView.swift` now includes:

### 📊 Features Added
- **Time Period Filtering**: Switch between Week, Month, and Year views
- **Summary Statistics**: Total spend, average spend, and peak spend cards
- **Data Export**: Export analytics as CSV, JSON, or PDF
- **Refresh Functionality**: Pull-to-refresh with animated spinner
- **Interactive Tooltips**: Hover over bars to see exact spending amounts
- **Enhanced Insights**: Clickable insight cards with actionable data

### 📋 New Components
- `StatCard`: Displays summary statistics in a compact format
- `ExportOptionsView`: Sheet-based export interface
- `TimePeriod` enum: Week/Month/Year filtering
- `tooltip()` modifier: Hover information display

### 📈 Extended Sample Data
- `monthlySpend`: 4-week monthly breakdown
- `yearlySpend`: 12-month yearly breakdown
- Additional financial insights

---

## Getting Started with Xcode

### Prerequisites
- macOS 12.0 or later
- Xcode 14.0 or later (recommend 15.0+)
- iOS 17.0 deployment target minimum

### Step 1: Create Xcode Project
```bash
# Clone the repository
git clone https://github.com/RUSTYBM7/tagtrack.git
cd tagtrack
git checkout ios

# Navigate to iOS app directory
cd ios-finance-clone
```

### Step 2: Create New iOS App Project
1. Open Xcode
2. **File → New → Project**
3. Select **iOS → App**
4. Configure:
   - Product Name: `FinanceAIClone`
   - Team: Your Apple Developer account (or "None" for testing)
   - Organization: `XCLOUDMULTIXPRO`
   - Language: **Swift**
   - Interface: **SwiftUI**
   - Storage: **None**
5. Save to: `ios-finance-clone/FinanceAIClone`

### Step 3: Copy Swift Files
```bash
# From repository root, copy all Swift files
cp ios-finance-clone/FinanceAIClone/*.swift \
   ~/path-to-xcode-project/FinanceAIClone/
```

Or manually in Xcode:
1. Right-click `FinanceAIClone` folder → **Add Files to FinanceAIClone**
2. Select all `.swift` files from `ios-finance-clone/FinanceAIClone/`
3. Ensure "Copy items if needed" is checked
4. Add to target: `FinanceAIClone`

### Step 4: Build & Run

#### On Simulator
```bash
# From Xcode menu
Product → Build (⌘B)
Product → Run (⌘R)
```

#### On Device
1. Connect iPhone/iPad via USB
2. Trust certificate on device when prompted
3. Select device from Xcode top menu
4. Press ▶ (Run button)

---

## File Structure

```
ios-finance-clone/
├── FinanceAIClone/
│   ├── FinanceAICloneApp.swift          # App entry point
│   ├── RootTabView.swift                # Tab navigation
│   ├── Theme.swift                      # Color scheme & design tokens
│   ├── Components.swift                 # Reusable UI components
│   ├── Models.swift                     # Data models & sample data
│   ├── AnalyticsView.swift              # ✨ Enhanced analytics (NEW)
│   ├── DashboardView.swift              # Home/Dashboard
│   ├── AssistantView.swift              # AI Chat interface
│   ├── CardWalletView.swift             # Payment cards
│   ├── ProfileView.swift                # User profile
│   └── AppIdentity.swift                # Branding constants
├── FinanceAIClone.xcodeproj/
│   └── project.pbxproj
└── README.md                            # Project documentation
```

---

## Customization Guide

### Update Branding
Edit `AppIdentity.swift`:
```swift
enum AppIdentity {
    static let shortName = "Your App Name"
    static let longName = "Your Full App Name Description"
}
```

### Modify Colors
Edit `Theme.swift`:
```swift
enum AppTheme {
    static let accent = Color(red: 102 / 255, green: 246 / 255, blue: 211 / 255)
    // Change RGB values to your brand colors
}
```

### Update Sample Data
Edit `Models.swift` `SampleData` enum to add real data sources.

---

## Troubleshooting

### Issue: "Module 'FinanceAIClone' not found"
**Solution**: 
1. Clean build: `⇧⌘K`
2. Delete derived data: `~/Library/Developer/Xcode/DerivedData`
3. Rebuild: `⌘B`

### Issue: "Simulator not available"
**Solution**:
1. Xcode → Settings → Platforms
2. Download iOS 17+ simulator
3. Window → Devices and Simulators → + to create simulator

### Issue: "Code signature invalid"
**Solution**:
1. Select project in Xcode navigator
2. Select target `FinanceAIClone`
3. Signing & Capabilities tab
4. Ensure Team is selected and provisioning profile is valid

### Issue: "Cannot run on device"
**Solution**:
1. Trust certificate: Settings → General → VPN & Device Management
2. Verify Apple ID in Xcode: Xcode → Settings → Accounts
3. Rebuild and try again

---

## App Store Distribution

### Prerequisites
- Apple Developer Program membership ($99/year)
- Mac with Xcode
- iPhone for testing

### Steps
1. **Create App ID**
   - Go to [Apple Developer](https://developer.apple.com)
   - Create Bundle ID: `com.xcloudmultixpro.financeaiclone`

2. **Configure in Xcode**
   - Select project → Signing & Capabilities
   - Set Team and Bundle ID

3. **Create Archive**
   ```
   Product → Archive
   ```

4. **Upload to App Store**
   - Organizer window opens after archive
   - Click "Distribute App"
   - Select "App Store Connect"
   - Follow prompts

---

## Performance Tips

- Use `.onReceive()` for background updates
- Leverage @StateObject for persistent view models
- Profile with Xcode Instruments: Xcode → Open Developer Tool → Instruments
- Test on physical device for accurate performance

---

## Resources

- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [Xcode Help](https://help.apple.com/xcode)
- [App Store Connect Help](https://help.apple.com/app-store-connect)
- [Design with SwiftUI](https://developer.apple.com/design/resources/)

---

**Last Updated**: 2026-04-11 12:21:13
**Status**: Ready for Xcode 15.0+