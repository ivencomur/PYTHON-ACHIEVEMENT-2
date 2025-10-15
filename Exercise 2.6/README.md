Recipe App - Django Web Application

📚 Python for Web Developers - Achievement 2

Student: Ivan Cortes
Course: CareerFoundry - Python for Web Developers
Repository: Django-based Recipe Management System

🎯 Project Overview

This Django web application is the evolution of the command-line Recipe App from Achievement 1. It demonstrates the transition from a CLI to a full web-based application using Django's Model-View-Template (MVT) architecture.

Current Features (Exercise 2.6)

✅ Django project structure with multiple apps

✅ Recipe management with ingredients (Many-to-Many relationships)

✅ Image uploads for recipes with media file handling

✅ Dynamic, styled front-end pages for recipe lists and details

✅ (New) User authentication (Login/Logout) system

✅ (New) Protected views ensuring only logged-in users can access recipe content

✅ Book inventory system (from bookstore example)

✅ Sales tracking with customers and salespersons

✅ SQLite database with migrations

✅ Django admin interface configured

✅ Comprehensive model and URL testing

📁 Project Structure

recipe-app/
├── recipe_project/          # Main Django project folder
│   ├── settings.py
│   ├── urls.py
│   └── views.py             # (New) Project-level views (login/logout)
│
├── recipes/                 # Recipe management app
│   ├── migrations/
│   ├── templates/recipes/   # HTML templates for the app
│   │   ├── recipes_list.html
│   │   └── recipes_detail.html
│   ├── admin.py
│   ├── models.py
│   ├── tests.py
│   ├── urls.py              # App-specific URL routing
│   └── views.py             # (Updated) Views now protected
│
├── sales/                   # App for the homepage
│   ├── templates/sales/
│   │   └── recipes_home.html # (Updated) Conditional login/view button
│   ├── urls.py
│   └── views.py
│
├── templates/               # (New) Project-level templates
│   └── auth/
│       ├── login.html
│       └── logout_success.html
│
├── media/                   # Stores user-uploaded images
│
├── books/                   # (Example app)
├── customers/               # (Example app)
├── salespersons/            # (Example app)
│
├── manage.py                # Django management script
├── db.sqlite3               # SQLite database
├── requirements.txt         # Python dependencies
└── .gitignore               # Git ignore file


🛠️ Installation & Setup

Prerequisites

Python 3.8 or higher

pip (Python package manager)

Git

Step 1: Clone the Repository

git clone [https://github.com/ivencomur/recipe-app.git](https://github.com/ivencomur/recipe-app.git)
cd recipe-app


Step 2: Create Virtual Environment

# Windows (Git Bash)
python -m venv .venv
source .venv/Scripts/activate


Step 3: Install Dependencies

pip install -r requirements.txt


Step 4: Run Migrations

python manage.py migrate


Step 5: Create Superuser (for Admin Access)

python manage.py createsuperuser


Step 6: Run Development Server

python manage.py runserver


Visit: http://127.0.0.1:8000/ to see the homepage and http://127.0.0.1:8000/admin/ to log in to the admin panel.

📊 Data Models

Recipe App Models

Recipe Model

name: CharField (recipe name)

description: TextField (recipe instructions)

cook_time_minutes: PositiveIntegerField (cooking time)

pic: ImageField (recipe picture)

ingredients: ManyToManyField (through RecipeIngredient)

created_at: DateTimeField (auto-added)

Ingredient Model

name: CharField (unique ingredient name)

RecipeIngredient Model (Junction Table)

recipe: ForeignKey to Recipe

ingredient: ForeignKey to Ingredient

quantity: FloatField (amount needed)

unit: CharField (measurement unit)

Book Inventory Models

Book Model

name: CharField

author_name: CharField

price: FloatField (in USD)

genre: CharField with choices (Classic, Romantic, Comic, Fantasy, Horror, Educational)

book_type: CharField with choices (Hardcover, E-Book, Audiobook)

Customer & Sales Models

Customer: name and notes

Salesperson: username, name, and bio

🧪 Running Tests

Run All Tests

python manage.py test


Run Tests for Specific App

python manage.py test recipes


Test Coverage

✅ Model field validations

✅ Model string representations

✅ Default values

✅ Field constraints (max_length, validators)

✅ Unique constraints

✅ Many-to-Many relationships

✅ get_absolute_url() method for correct URL generation.

🎓 Learning Journey

Exercise 2.1 - Getting Started with Django

Researched Django's popularity and use cases

Set up development environment with virtual environment

Installed Django and verified installation

Learned MVT architecture vs MVC

Exercise 2.2 - Django Project Structure

Created Django project with django-admin startproject

Created multiple apps using python manage.py startapp

Designed database models with relationships

Configured Django admin interface

Wrote model tests for validation

Understood Django's file organization

Exercise 2.3 - Django Models

Implemented models.py for all apps.

Used the migration system (makemigrations, migrate).

Customized the Django admin for a better UI.

Exercise 2.4 - Django Views & Templates

Created a Function-Based View (FBV) and a template for the homepage.

Set up initial project and app URL routing.

Exercise 2.5 - Django MVT Revisited

Configured the project to handle user-uploaded images (media files).

Implemented Class-Based Views (ListView, DetailView).

Created dynamic templates to display database content.

Enabled clickable links between list and detail pages using get_absolute_url.

Exercise 2.6 - User Authentication (Current)

Implemented Login/Logout views using Django's built-in auth system.

Created project-level templates for login and logout confirmation.

Protected recipe list and detail views using LoginRequiredMixin.

Configured LOGIN_URL setting for automatic redirection.

Updated templates to show conditional login/logout links.

Upcoming Exercises

Exercise 2.7: Django Forms & User Input

Exercise 2.8: Deployment

💡 Key Django Concepts Applied

MVT Architecture

Models: Database structure definition using Django's ORM.

Views: Business logic implemented with Function-Based and Class-Based Views, now including authentication handling. (Updated)

Templates: HTML presentation with dynamic data, conditional logic (if user.is_authenticated), and project-level templates. (Updated)

Django Auth System (New)

AuthenticationForm, authenticate(), login(), logout()

LoginRequiredMixin for protecting Class-Based Views.

LOGIN_URL project setting for redirecting unauthenticated users.

user.is_authenticated context variable in templates for conditional rendering.

URL Routing (Updated)

A main project-level urls.py that manages includes for apps and defines global paths like authentication.

App-level urls.py files for organizing app-specific features.

The use of URL Naming (name=...) and reversing ({% url %}, redirect()) for maintainable code.

Django ORM

Model definitions with various field types (CharField, ImageField, etc.).

Model relationships (ForeignKey, ManyToManyField with a through table).

Migrations for managing database schema changes.

Django Admin

Automatic admin interface generation.

Model registration and customization (list_display, inlines).

🐛 Known Issues & TODOs

Current TODOs

[x] Implement views for recipe listing and details

[x] Create HTML templates for user interface

[x] Add URL routing for all apps

[x] Implement recipe image uploads

[x] Add User Authentication (Login/Logout)

[x] Protect Recipe Views

[ ] Implement recipe search functionality

[ ] Create forms for recipe creation/editing (Likely Exercise 2.7)

Future Enhancements

Recipe categories and tags

User favorites and ratings

Shopping list generation

Meal planning features

📚 Resources

Documentation

Django Official Documentation

Django Tutorial

Django Models Reference

Django Admin Documentation

Course Materials

CareerFoundry Python for Web Developers

Achievement 2 Exercise Materials

Course Repository

🤝 Contributing

This is a learning project for CareerFoundry's Python course. While it's primarily for educational purposes, feedback and suggestions are welcome!

Development Workflow

Create a feature branch from main.

Make changes and test locally.

Run tests to ensure nothing breaks.

Commit with descriptive messages.

Push and create a pull request.

📝 License

This project is part of CareerFoundry's educational curriculum and is for learning purposes.

👤 Author

Ivan Cortes

Portfolio: ivan-cortes-portfolio-v1.onrender.com

LinkedIn: Ivan Cortes Murcia

GitHub: @ivencomur

Twitter: @IVENCOMUR

🙏 Acknowledgments

CareerFoundry for the comprehensive curriculum

Django Software Foundation for the excellent framework

Python community for extensive documentation and support

📸 Screenshots

Screenshots for exercises are stored in the PYTHON-ACHIEVEMENT-2 repository. The latest screenshots for Exercise 2.6 document the login page, a protected recipe list view, a protected recipe detail view, and the logout confirmation page.

🔧 Technical Stack

Language: Python 3.13.5

Framework: Django 5.2.7

Database: SQLite (development)

Version Control: Git/GitHub

IDE: VS Code

Testing: Django's built-in TestCase

Last Updated: October 17, 2025
Course: CareerFoundry - Python for Web Developers
Achievement 2 - Web Development with Django