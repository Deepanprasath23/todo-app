
# ✅ Todo Task Manager (Flutter)

A simple and efficient Flutter application to manage daily tasks with **local login** and **user-specific task storage** using `SharedPreferences`. Designed to be lightweight, offline-friendly, and perfect for hackathons or quick prototyping.

---

## 🚀 Features

- 🔐 Local email-password authentication (stored securely on device)
- 👤 User-specific task list (based on email)
- ➕ Add tasks with title & description
- ✅ Mark tasks as completed
- 🗑️ Delete tasks
- 🔄 Refresh to reload saved tasks
- 🧠 Ready to be upgraded to Firebase/Google login later

---

## 🛠 Tech Stack

- **Flutter** (UI framework)
- **Provider** (state management)
- **Shared Preferences** (local data storage)

---

## 📱 Screens (Add screenshots if needed)

- **Login Screen** – Accepts email & password
- **Home Screen** – Task dashboard with Add, Complete, Delete
- **Add Task Screen** – Form to input task details

---

## 📂 Folder Structure

```
lib/
│
├── main.dart                  # App entry point
├── app.dart                   # Main widget and routing
│
├── models/
│   └── task_model.dart        # Task model
│
├── providers/
│   └── task_provider.dart     # Business logic for tasks
│
├── services/
│   └── local_storage_service.dart  # Read/write tasks per user
│
├── screens/
│   ├── login_screen.dart      # Login UI
│   ├── home_screen.dart       # Task list UI
│   └── task_form_screen.dart  # Add new task UI
│
└── widgets/
    └── task_tile.dart         # Task UI component
```

---

## 🧪 How Local Login Works

- On **first login**, the app stores email & password using `SharedPreferences`
- On **subsequent logins**, entered credentials are verified locally
- **Tasks** are saved using a key like `tasks_user@gmail.com` for user-specific storage

---

## ✅ Getting Started

1. Clone the repo  
   ```bash
   git clone <your-repo-url>
   cd todo
   ```

2. Get dependencies  
   ```bash
   flutter pub get
   ```

3. Run the app  
   ```bash
   flutter run
   ```

---

## 📌 Requirements

- Flutter SDK
- Android Studio or VSCode
- Emulator or Physical Device (Android/iOS)

---

## 🔮 Next Steps (Optional Enhancements)

- Integrate **Google Sign-In** via Firebase
- Cloud backup with Firebase Firestore
- Dark mode and theme switcher
- User registration & password reset

---

## 👨‍💻 Author

Built  by **Deepan** for a mobile app hackathon.

---

## 📜 License

This project is licensed under the MIT License.
