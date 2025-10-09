# Exercise 2.2 — Django Project Set Up

**Course:** CareerFoundry · Python for Web Developers  
**Student:** Ivan Cortes

## Overview
This exercise creates a Django project (practice: Bookstore; task: Recipe app), clarifies **project vs app**, and covers running **migrations**, starting the **dev server**, and creating a **superuser** for the admin.

## Learning Objectives
- Describe Django project structure and generated files.
- Distinguish **projects** (settings/URL/db) vs **apps** (modular features).
- Create and run a project locally.
- Create a **superuser** and log into **/admin**.

## Prerequisites
- Python 3.9+ (or your installed 3.x)
- A virtual environment (created in this folder)
- Django installed inside the venv

## Commands (Windows · Git Bash)
```bash
# Create working folder, venv, activate
mkdir -p "A2_Recipe_App"
cd "A2_Recipe_App"
python -m venv a2-ve-recipeapp
source a2-ve-recipeapp/Scripts/activate

# Install Django (match screenshots if needed: ==3.2.4)
python -m pip install --upgrade pip
pip install "Django>=5"

# Start project
django-admin startproject recipe_project

# BEFORE rename (screenshot)
ls -la
ls -la recipe_project
ls -la recipe_project/recipe_project   # manage.py + package files
# Save: proj_contents_before_renaming.jpg

# Rename outer project folder to src
mv recipe_project src

# AFTER rename (screenshot)
ls -la
ls -la src
ls -la src/recipe_project
# Save: proj_contents_after_renaming.jpg

# Migrations
cd src
python manage.py migrate
# Save: 04_migrations_ok.png

# Run server
python manage.py runserver
# Visit http://127.0.0.1:8000/ → success page
# Save: 05_runserver_success.jpg
# Ctrl+C to stop

# Create superuser and log into /admin
python manage.py createsuperuser
python manage.py runserver
# Visit http://127.0.0.1:8000/admin/ and log in
# Save: admin-dashboard.jpg

# (Optional) Create your first app (books)
python manage.py startapp books
# Save: 06_books_app_created.png
