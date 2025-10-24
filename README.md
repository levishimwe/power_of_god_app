## Power of God Through Words
This Flutter app that helps users find relevant Bible verses based on their current situation or emotion.

## Widget Demonstration
My project demonstrates the Flex and Wrap widgets in Flutter through a practical Bible verses application.

## Wrap Widget
A Wrap widget displays situation tags (Fear, Faith, Peace, etc.) that automatically flow to multiple lines when space runs out.

# Three Key Properties of Wrap:

  1.spacing: 12.0 - Controls horizontal gap between tags in the same row (12 pixels between each tag)
  2.runSpacing: 12.0 - Controls vertical gap between rows of tags (12 pixels between each row)
  3.alignment: WrapAlignment.center - Centers tags within each row for a balanced appearance

## Flex Widget
A Flex widget structures the layout of screens, arranging components in a flexible vertical layout.

# Three Key Properties Demonstrated:

  1.direction: Axis.vertical - Stacks children from top to bottom (could be horizontal for side-by-side)
  2.mainAxisAlignment: MainAxisAlignment.start - Aligns content to the top of the screen
  3.crossAxisAlignment: CrossAxisAlignment.stretch - Stretches children to fill the full screen width

## Features
1.Search Functionality - Find situations by typing keywords
2. Life Situations - Fear, Faith, Wisdom, Peace, Troubles, Joy, Strength, and Hope
3. 24 Bible Verses - Three relevant verses for each situation

## Three Screens:

 1.Home: Search and browse situation tags
 2.Verses List: View all verses for selected situation
 3.Verse Detail: Read complete verse text

## Screenshots:
# Home Screen
<img width="322" height="644" alt="Screenshot from 2025-10-24 15-11-07" src="https://github.com/user-attachments/assets/fa2fc3c3-b334-47c3-9afe-be1448495ac0" />

# Verses List Screen
<img width="322" height="644" alt="Screenshot from 2025-10-24 15-11-28" src="https://github.com/user-attachments/assets/dc4131bf-4600-40bd-9cbd-6305aa6bd12f" />

# Verse Detail Screen

<img width="322" height="644" alt="Screenshot from 2025-10-24 15-11-54" src="https://github.com/user-attachments/assets/070a47e4-edb1-4846-8aca-aea9d831db48" />

## How to Run
 # Requirements:
 .Flutter SDK (3.0 or higher)
 .Dart SDK (3.0 or higher)
 .Android Studio / VS Code with Flutter extensions
 .An emulator or physical device

1. Clone the repository
   git clone 

   cd power_of_god_ap
2.Install dependencies
 flutter pub get
3. Run the app
   flutter run
## Project Structure

lib/
├── main.dart              # Entry point and main app logic
    ├── PowerOfGodApp      # Root widget (MaterialApp)
    ├── HomeScreen         # Search and situation tags
    (Wrap )
    ├── VersesScreen       # Verses list (Flex )
    └── VerseDetailScreen  # Full verse reading view

## Code Highlights
 # Wrap Widget Implementation (HomeScreen)

 Wrap(
  spacing: 12.0,              // Horizontal gap between tags
  runSpacing: 12.0,           // Vertical gap between rows
  alignment: WrapAlignment.center,  // Center tags in each row
  children: filteredSituations.map((situation) {
    return _buildSituationChip(context, situation);
  }).toList(),
)

 # Flex Widget Implementation (VersesScreen)

  body: Flex(
        direction: Axis.vertical,
        children: [
          // Search Section
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue[50],
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            
## Technologies Used

 1.Flutter - UI framework
 2.Dart - Programming language
 3.Material Design - Design system

## Learning Outcomes

 .Understanding Flex widget for precise layout control
 .Using Wrap widget for dynamic, flowing content
 .Managing state with StatefulWidget
 .Implementing navigation between screens
 .Creating reusable widget components
 .Organizing data with nested Maps

## Future Enhancements

 .Add more Bible verses and situations according to the what users want
 .Implement favorites/bookmarking features
 .Add verse sharing functionality
 .Support multiple Bible translations
 . Add Search within verse text 
 .Add feed back and bible experience stories features
 .Add prayer and worship songs under of every chapter and verses

## Author
.Levis Ishimwe 

GitHub: @levishimwe
Email: i.levis@alustudent.com

## Acknowledgments

1.Bible verses from the English Standard Version (ESV)
2.Flutter documentation for widget references
3.Material Design guidelines for UI patterns

License
This project is created for educational purposes as part of a Flutter course assignment.

Note: This application was made to demonstrate how Flutter's Flex and Wrap widgets function. The implementation emphasizes using these layout widgets in a realistic application context in a real-world setting.

