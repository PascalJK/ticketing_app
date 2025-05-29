# ticketing_app (Ticket App)

A minimal ticketing system built with Flutter and GetX, supporting ticket creation, listing with sorting by priority or age.

## Features
- Create tickets with a description and priority via a bottom-sheet-popup.
- List tickets with sorting options: Priority or Age.
- Responsive UI with a custom theme (blue and amber color scheme).
- Computed ticket age based on `date_opened`.
- State management with GetX for reactive updates.

## Prerequisites
- **Flutter**: Version 3.0.0 or higher (stable channel).
- **Dart**: Included with Flutter.
- **Dependencies**: See `pubspec.yaml` for details.
- **Tools**: 
  - Android Emulator/iOS Simulator or physical device for mobile.
  - Web browser for web deployment.

## Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone <your-repo-url>
   cd client-ticket-app
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Enable Web Support** (if targeting web):
   ```bash
   flutter config --enable-web
   ```

## Running the App
### Option 1: Mobile (CLI)
1. Ensure an emulator or device is connected:
   ```bash
   flutter devices
   ```
2. Run the app:
   ```bash
   flutter run
   ```
3. Select the target device/emulator when prompted.

### Option 2: Web (Local Server)
1. Build the web version:
   ```bash
   flutter build web
   ```

## Project Structure
- `lib/main.dart`: Entry point with `MaterialApp` and theme setup.
- `lib/add_ticket_bottom_sheet.dart`: Bottom sheet for creating tickets.
- `lib/drop_down_widget.dart`: Dropdown for sorting tickets.
- `lib/utils/app_themes.dart`: Custom theme with color scheme.
- `pubspec.yaml`: Dependencies (flutter, get, shortid, dropdown_button2).

## Usage
1. **Add Ticket**: Click the floating action button to open the bottom sheet. Enter a description and select a priority (Low, Medium, High).
2. **Sort Tickets**: Use the dropdown to sort by priority or age.
3. **View Tickets**: Tickets are displayed in a listview.
3. **IsClosed**: Tap on a Ticket item to mark it as closed or open.

## Notes
- The app uses GetX for state management and `shortid` for generating short ticket IDs.
- The theme is defined in `app_themes.dart` for consistent styling.
- Sorting is reactive and persists when new tickets are added.