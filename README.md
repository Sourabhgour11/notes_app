# 📝 Flutter Notes App (Interview Task)

A simple yet elegant **Notes App** built with **Flutter + GetX**.  
It supports **local storage (Hive)**, **note management (add, edit, delete, view)**, **dark mode toggle**, and **sync with a dummy API** (`jsonplaceholder.typicode.com/posts`).

---

## ✨ Features

- 📋 **Home Screen**:
    - List all saved notes (title + description preview).
    - Search notes with a search bar.
    - Floating Action Button (+) to add new note.
    - Empty state message when no notes available.

- 📝 **Add Note Screen**:
    - Enter **title** and **description**.
    - Save locally using **Hive database**.

- 🔎 **Note Detail Screen**:
    - View full note with title, description, and created date.
    - Options to **edit** or **delete** the note.

- 🌙 **Dark Mode Toggle**:
    - Switch between light/dark themes, preference is saved locally.

- 🔐 **Login Screen (Fake Auth)**:
    - Basic login with username/password stored in SharedPreferences.

- ⭐ **Extra Features (Optional)**:
    - Pin/Favorite notes to keep them on top.
    - Sign Up / Register screen.



