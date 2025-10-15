# Recipe App - Django Web Application

## 📚 Python for Web Developers - Achievement 2

**Student:** Ivan Cortes
**Course:** CareerFoundry - Python for Web Developers
**Repository:** Django-based Recipe Management System

---

## 🎯 Project Overview

This Django web application is the evolution of the command-line Recipe App from Achievement 1. It demonstrates the transition from a CLI to a full web-based application using Django's Model-View-Template (MVT) architecture.

### Current Features (Exercise 2.5)
- ✅ **Models & Data:** Robust database schema for recipes, ingredients, and their relationships.
- ✅ **Image Uploads:** Media file handling configured to allow image uploads for each recipe via the admin.
- ✅ **Views & Templates:** Dynamic, styled web pages to display a list of all recipes and detailed views for individual recipes.
- ✅ **URL Routing:** Modular URL configuration at both the project and app level.
- ✅ **Admin Interface:** Highly customized admin panel for easy data management.
- ✅ **Testing:** Unit tests to validate model behavior and URL routing.

---

## 📁 Project Structure

recipe-app/ ├── recipe_project/ # Main Django project folder ├── recipes/ # Recipe management app │ ├── migrations/ │ ├── templates/recipes/ # HTML templates for the app │ │ ├── recipes_list.html │ │ └── recipes_detail.html │ ├── management/ # (Optional) For custom commands │ ├── admin.py │ ├── models.py │ ├── tests.py │ ├── urls.py # App-specific URL routing │ └── views.py │ ├── media/ # Stores user-uploaded images │ ├── recipes/ │ └── no_picture.jpg │ ├── sales/ # App for the homepage │ ├── templates/sales/ │ │ └── recipes_home.html │ ├── admin.py │ ├── models.py │ ├── urls.py │ └── views.py │ ├── manage.py # Django management script ├── db.sqlite3 # SQLite database └── ... (other apps and files)


---

## 🛠️ Installation & Setup

(Setup instructions remain the same as your previous README)

---

## 🧪 Running Tests

### Run All Tests
```bash
python manage.py test
Run Tests for Recipes App
Bash

python manage.py test recipes
Test Coverage
✅ Model field validations and relationships.

✅ (New) get_absolute_url() method to ensure correct URL generation for detail pages.