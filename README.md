
# 🏪 Storekeeper App

A clean and simple **Flutter inventory management app** that helps users manage product inventory locally.  
It supports full **CRUD (Create, Read, Update, Delete)** operations using **SQLite** and integrates a **native camera/gallery feature** for product images.  

---

##  Features

-  Add, view, edit, and delete products  
-  Capture or upload product images directly within the app  
-  Local SQLite database (Sqflite) — no internet required  
-  Reactive state management using Provider  
-  Clean, modern UI with Light & Dark theme support  
-  Fully responsive layout

---

##  Tech Stack

| **Frontend** | Flutter (Dart) |
| **Local Database** | SQLite using Sqflite & Path Provider |
| **State Management** | Provider |
| **Image Capture** | Image Picker (Camera + Gallery) |
| **Architecture** | MVVM-style (Model-View-ViewModel) |

---

##  Demo Video
[Watch the walkthrough on Google Drive](https://drive.google.com/file/d/1O76ouBtaQcZkw6euZLBUI_5vlCWZdBVY/view?usp=sharing)

---

## Download APK

[Download Storekeeper App (Release APK)](https://github.com/Wakilspace/strore_keeper_app/releases/download/v1.0.0/app-release.apk)

---

## Setup Instructions

Follow these steps to run the app locally:

```bash
#  Clone the repository
git clone https://github.com/wakilspace/storekeeper_app.git
cd storekeeper_app

#  Install dependencies
flutter pub get

# Run the app
flutter run
