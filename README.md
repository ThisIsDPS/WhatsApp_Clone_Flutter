# Project Overview
This WhatsApp clone Flutter project aims to replicate core functionalities of WhatsApp, including chat, group creation, status updates, and contact selection. The project leverages various technologies and packages to achieve its features, using Flutter for the frontend, Firebase for backend services, and Riverpod for state management.

# Tech Stack

### Flutter
Primary Framework: Used to build the user interface with a single codebase for both iOS and Android. <br/>
Widgets: Utilizes Flutter widgets like Scaffold, AppBar, ListView, Column, Row, TextField, FloatingActionButton, etc., for UI construction. <br/>
State Management: Employs ConsumerWidget and ConsumerStatefulWidget for UI state management and rebuilding. <br/>

### Flutter Riverpod
State Management: Provides a robust way to manage state with providers such as groupControllerProvider, selectContactControllerProvider, and statusControllerProvider. <br/>
Providers: Uses Provider for exposing services and FutureProvider for asynchronously fetching data. <br/>

### Firebase
Firebase Authentication: Manages user authentication and session handling using FirebaseAuth. <br/>
Cloud Firestore: Stores user data, group details, and status updates using FirebaseFirestore. <br/>
Firebase Storage: Handles file uploads and storage, including profile pictures and status images through commonFirebaseStorageRepositoryProvider. <br/>

### Error Handling
Implements showSnackBar() function for displaying error messages and user feedback. <br/>

# Additional Packages:
cupertino_icons: Adds Cupertino icons for iOS style components. <br/>
flutter_launcher_icons: Customizes app icons for Android and iOS. <br/>
image_picker: Allows users to select images and videos from their device. <br/>
video_player: Handles video playback within the app. <br/>
cached_video_player: Caches videos to improve performance. <br/>
cached_network_image: Efficient image loading and caching. <br/>
emoji_picker_flutter: Integrates emoji support in chat. <br/>
enough_giphy_flutter: Adds GIF support in chat. <br/>
permission_handler: Manages permissions for file access and other operations. <br/>
path_provider: Provides access to the device's file system for storage. <br/>
audioplayers: Handles audio playback for voice messages. <br/>
flutter_sound: Provides audio recording capabilities. <br/>
swipe_to: Adds swipe-to-dismiss functionality. <br/>
flutter_lints: Encourages good coding practices with a set of recommended lints. <br/>

# Detailed Explanation of Each Feature

### 1. Authentication (Auth)
Purpose: Allows users to sign up, log in, and manage their authentication state. <br/>
Firebase Authentication: Utilizes firebase_auth to manage user sign-up, login, and session management. <br/>
Flutter Widgets: Uses Flutter widgets like TextField and ElevatedButton in UI screens for user input and actions. <br/>
State Management: Managed through Riverpod's authControllerProvider for handling authentication states and actions. <br/>

### 2. Chat
Purpose: Facilitates one-on-one and group messaging between users. <br/>
Cloud Firestore: Uses cloud_firestore to store and retrieve messages in real-time. <br/>
Flutter Widgets: Employs widgets like ListView for displaying messages, TextField for input, and SendButton for sending messages. <br/>
State Management: Managed using Riverpod's chatControllerProvider for handling chat operations and message states. <br/>

### 3. Group
Purpose: Allows users to create and manage groups for group chats. <br/>
Cloud Firestore: Uses cloud_firestore to store group information, including group members and messages. <br/>
Flutter Widgets: Utilizes widgets such as ListView for displaying group members and TextField for group name input. <br/>
State Management: Managed through Riverpod's groupControllerProvider for handling group creation and management. <br/>

### 4. Landing
Purpose: The initial screen that users see upon opening the app. <br/>
Flutter Widgets: Uses simple widgets like Scaffold and Text to display a welcome message and navigation options. <br/>
Navigation: Provides buttons for navigating to the login or signup screens. <br/>

### 5. Select Contacts
Purpose: Allows users to select contacts from their device for various operations, such as group creation or status visibility. <br/>
flutter_contacts: Uses flutter_contacts to access and fetch contacts from the device. <br/>
Flutter Widgets: Employs widgets like ListView for displaying contacts and InkWell for handling selection. <br/>

### 6. Status
Purpose: Enables users to upload and view status updates similar to WhatsApp’s status feature. <br/>
Firebase Storage: Uses firebase_storage to upload and store status images. <br/>
Cloud Firestore: Stores status information and retrieves it for display. <br/>
Story View: Uses story_view to display status updates in a story-like format. <br/>
Flutter Widgets: Employs widgets such as StoryView for displaying statuses and FloatingActionButton for uploading new statuses. <br/>
State Management: Managed through Riverpod's statusControllerProvider for handling status uploads and retrieval. <br/>

# Conclusion
The WhatsApp clone project utilizes Flutter for the frontend, Riverpod for state management, and Firebase for backend services. The project integrates various packages to enhance functionality, including contact access, media handling, and custom UI components. Each file plays a specific role in managing user interactions, data operations, and UI presentation, ensuring a comprehensive and feature-rich application.
