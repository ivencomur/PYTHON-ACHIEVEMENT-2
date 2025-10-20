# Recipe App – Django Web Application

_Achievement 2 • CareerFoundry – Python for Web Developers_

**Student:** Ivan Cortes
**Repository:** `recipe-app` (Django-based Recipe Management System)
**Current Exercise:** 2.7 - Django Forms & Data Visualization
**Last Updated:** October 19, 2025

---

## Table of Contents
1. [Overview](#overview)
2. [Learning Objectives](#learning-objectives)
3. [Environment & Specs](#environment--specs)
4. [Project Structure](#project-structure)
5. [Installation & Setup (Windows + Git Bash)](#installation--setup-windows--git-bash)
6. [Running the App](#running-the-app)
7. [Authentication & Access Control](#authentication--access-control)
8. [Data Models](#data-models)
9. [Testing](#testing)
10. [Development Workflow](#development-workflow)
11. [Known Issues & TODOs](#known-issues--todos)
12. [Future Enhancements](#future-enhancements)
13. [Resources](#resources)
14. [Deliverables](#deliverables)
15. [Technical Notes](#technical-notes)
16. [Author & Links](#author--links)
17. [AI Assistance Note](#ai-assistance-note)
18. [Screenshots List](#screenshots-list)

---

## Overview
This Django web application evolves the command‑line Recipe App from **Achievement 1** into a full web application following Django’s **MVT** (Model–View–Template) architecture. This project serves as the practical implementation for Achievement 2 of the CareerFoundry Python for Web Developers course.

**Current scope (Exercise 2.7):**
- Project with multiple Django apps (`recipes`, `sales`, and examples like `books`).
- **Recipe Management:** Core functionality allowing display of recipes with ingredients managed via a Many‑to‑Many `through` model (`RecipeIngredient`). Includes image uploads (`ImageField`) handled via Django's media file system.
- **User Authentication:** Secure login/logout system implemented using Django's built-in auth framework. Recipe list and detail views are protected, requiring users to log in.
- **Search & Filtering:** A new search page (`/recipes/search/`) allows users to filter recipes by name, ingredients (comma-separated, OR logic), maximum cooking time, and difficulty level using a Django Form (`RecipeSearchForm`).
- **Data Visualization:** Integrated charting capabilities using `pandas` and `matplotlib` to generate dynamic visualizations (bar, pie, line charts) based on the filtered search results directly within the search page.
- **Database & Admin:** Uses SQLite for development, managed via Django's ORM and migrations. All relevant models are registered in the Django Admin interface for easy data management.
- **Testing:** Includes unit tests for models, URLs, forms, and views to ensure functionality and prevent regressions.

---

## Learning Objectives
By the end of Achievement 2, key objectives include:
- Implementing Django’s **MVT** pattern effectively.
- Designing and migrating database models with relationships (**ForeignKey**, **ManyToManyField**, `through`).
- Configuring and handling static and **media files** (specifically image uploads).
- Building both **Function‑Based Views (FBV)** and **Class‑Based Views (CBV)** (`ListView`, `DetailView`).
- Implementing user **authentication** and view protection (`LoginRequiredMixin`, `@login_required`).
- Mastering **URL routing** including namespacing and dynamic URL generation (`{% url %}`, `reverse()`).
- Creating and processing **Django Forms** for user input validation and handling.
- Integrating external Python libraries (**Pandas**, **Matplotlib**) for **data visualization** within Django views.
- Writing comprehensive **tests** for various application components.

---

## Environment & Specs
- **Python:** 3.13.5 (Note: Course materials may reference 3.8.x/3.9.x; this project uses a more recent version). Use a virtual environment (`.venv`).
- **Django:** 5.2.7
- **Database:** SQLite (development default)
- **Key Libraries:** `Pillow` (for images), `pandas`, `matplotlib` (for charts)
- **OS/Shell:** Developed on Windows using Git Bash
- **IDE:** VS Code
- **Version Control:** Git / GitHub

> **Important:** Always activate your virtual environment (`source .venv/Scripts/activate`) before running commands. Ensure dependencies match `requirements.txt`.

---

## Project Structure
```text
recipe-app/
├── .venv/                   # Virtual environment files (ignored by git)
├── recipe_project/          # Django project configuration directory
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py          # Main project settings (DB, apps, media, auth URL)
│   ├── urls.py              # Project-level URL routing (admin, includes apps)
│   ├── views.py             # Project-level views (e.g., login, logout)
│   └── wsgi.py
│
├── recipes/                 # The core Recipe application
│   ├── __init__.py
│   ├── admin.py             # Admin interface customization for recipes
│   ├── apps.py
│   ├── forms.py             # NEW: Contains RecipeSearchForm
│   ├── migrations/          # Database migration files (e.g., adding difficulty)
│   │   └── ...
│   ├── models.py            # Ingredient, Recipe, RecipeIngredient models (updated)
│   ├── templates/recipes/   # Templates specific to the recipes app
│   │   ├── base.html        # NEW/OPTIONAL: Base template for recipes app
│   │   ├── recipes_detail.html
│   │   ├── recipes_list.html
│   │   └── search.html      # NEW: Template for search form and results/charts
│   ├── tests/               # NEW: Directory for test modules
│   │   ├── __init__.py
│   │   ├── test_forms.py    # NEW: Tests for RecipeSearchForm
│   │   └── test_views.py    # NEW: Tests for recipe_search view
│   ├── urls.py              # URL routing for the recipes app (list, detail, search)
│   └── views.py             # Views for recipes (ListView, DetailView, search view, chart helper)
│
├── sales/                   # App responsible for the homepage
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── migrations/
│   ├── models.py
│   ├── templates/sales/
│   │   └── recipes_home.html # Homepage template
│   ├── tests.py
│   ├── urls.py              # URL routing for the homepage
│   └── views.py             # View for the homepage
│
├── templates/               # Project-level templates directory
│   └── auth/                # Templates for authentication
│       ├── login.html
│       └── logout_success.html
│
├── media/                   # Directory where user-uploaded images are stored
│   └── recipes/             # Subdirectory for recipe images
│       └── ...
│
├── books/                   # Example app (Bookstore domain)
├── customers/               # Example app
├── salespersons/            # Example app
│
├── .gitignore               # Specifies intentionally untracked files
├── db.sqlite3               # Development database file
├── manage.py                # Django's command-line utility
├── README.md                # This file
└── requirements.txt         # Project dependencies (incl. Django, Pillow, pandas, matplotlib)

# LEARNING_JOURNAL/        # Directory for learning journal HTML files (sibling to recipe-app/ or inside?)
#   ├── LEARNING_JOURNAL_2.7_(14).html # New journal entry
#   └── ...

# PYTHON-ACHIEVEMENT-2/     # Separate repo for screenshots? Needs clarification.
#   └── Exercise 2.7/screenshots/
#       └── ...              # Screenshots for Ex 2.7
(Structure updated for Exercise 2.7 additions. Assumes LEARNING_JOURNAL and screenshot folders might be structured slightly differently based on your repo setup.)

Installation & Setup (Windows + Git Bash)
1) Clone the repository
Bash

git clone [https://github.com/ivencomur/recipe-app.git](https://github.com/ivencomur/recipe-app.git)
cd recipe-app
2) Create & activate a virtual environment
Bash

# Ensure you are in the recipe-app directory
python -m venv .venv
source .venv/Scripts/activate
(Your prompt should now start with (.venv))

3) Install dependencies
Bash

# Upgrade pip first (good practice)
python -m pip install --upgrade pip
# Install all required packages
pip install -r requirements.txt
(Make sure pandas and matplotlib have been added to your requirements.txt file)

4) Apply migrations
Bash

# This creates/updates your database schema based on models.py changes
python manage.py migrate
5) Create a superuser (for Admin access)
Bash

python manage.py createsuperuser
(Follow the prompts to set username, email (optional), and password)

6) Run the development server
Bash

python manage.py runserver
(The server will typically start at )

Running the App
Homepage: Visit http://127.0.0.1:8000/. You'll see options to log in or view recipes (if logged in).

Login: Access the login page via the homepage link or directly at http://127.0.0.1:8000/login/. Use your superuser credentials.

Recipe List: http://127.0.0.1:8000/recipes/ (Requires login). Shows all recipes with images.

Recipe Detail: Click on a recipe name from the list (e.g., http://127.0.0.1:8000/recipes/1/) (Requires login). Shows details and ingredients.

Recipe Search: http://127.0.0.1:8000/recipes/search/ (Requires login). Use the form to filter recipes and optionally generate charts.

Admin Interface: http://127.0.0.1:8000/admin/. Log in with your superuser credentials to manage recipes, ingredients, users, etc.

Authentication & Access Control
Authentication is handled by Django's built-in system (django.contrib.auth).

Project-level views (recipe_project/views.py) manage the /login/ and /logout/ URLs. Templates are in templates/auth/.

Recipe-related views (RecipeListView, RecipeDetailView, recipe_search) are protected.

CBVs use LoginRequiredMixin.

FBVs use the @login_required decorator.

Unauthenticated users attempting to access protected pages are redirected to the login page (defined by LOGIN_URL = '/login/' in settings.py).

Templates use {% if user.is_authenticated %} to conditionally show content (e.g., Logout button vs. Login button).

Data Models
(Primary models for Exercise 2.7)

recipes.Recipe
name: CharField (max 120)

description: TextField (optional)

cook_time_minutes: PositiveIntegerField (min value 1)

pic: ImageField (uploads to media/recipes/, defaults to no_picture.jpg)

ingredients: ManyToManyField to Ingredient via RecipeIngredient

difficulty: CharField (max 10, choices=["Easy", "Medium", "Hard"], default="Medium") - Added in Ex 2.7

created_at: DateTimeField (auto-populated on creation)

get_absolute_url(): Method returning the URL for the recipe's detail page.

recipes.Ingredient
name: CharField (max 120, unique)

recipes.RecipeIngredient (Through Model)
recipe: ForeignKey to Recipe (CASCADE delete)

ingredient: ForeignKey to Ingredient (CASCADE delete)

quantity: FloatField (min value 0.0)

unit: CharField (max 32, optional)

unique_together = ("recipe", "ingredient"): Prevents adding the same ingredient twice to one recipe.

(Other example models like Book, Customer, Salesperson exist but are not the focus of Ex 2.7)

Testing
Tests are organized within app directories (e.g., recipes/tests/). For Exercise 2.7, specific test modules are created (recipes/tests/test_forms.py, recipes/tests/test_views.py).

Run all tests for the project: python manage.py test

Run tests for a specific app: python manage.py test recipes

Run tests within specific modules: python manage.py test recipes.tests.test_forms

Coverage for Exercise 2.7 includes:

RecipeSearchForm: Field presence, validation rules (required, min/max values), valid empty/partial submissions.

recipe_search View: Authentication requirement (redirect if not logged in), GET request response, POST request handling (filtering logic for name, ingredients, time, difficulty), context variables (recipes, chart), "Show All" functionality.

Development Workflow
Ensure virtual environment is active.

Create a feature branch (e.g., git checkout -b feature/ex2.7-search-charts).

Implement changes (models, forms, views, templates, URLs, tests).

Run migrations if models change (makemigrations, migrate).

Run the development server (runserver) and test manually in the browser.

Run automated tests (python manage.py test).

Commit changes frequently with clear messages (git add ., git commit -m "...").

Push the branch to GitHub (git push origin feature/ex2.7-search-charts).

(Optional) Open a Pull Request for review.

Merge back into main after completion.

Known Issues & TODOs
(Reflects status at the start of Exercise 2.7)

[x] Implement recipe list/detail views (Ex 2.5)

[x] Create HTML templates for UI (Ex 2.4, 2.5)

[x] Add URL routing for all apps (Ex 2.4, 2.5)

[x] Implement recipe image uploads (Ex 2.5)

[x] Add User Authentication (Login/Logout) (Ex 2.6)

[x] Protect Recipe Views (Ex 2.6)

[x] Add difficulty field to Recipe model (Ex 2.7 - Phase 1)

[ ] In Progress (Ex 2.7): Create RecipeSearchForm (recipes/forms.py)

[ ] In Progress (Ex 2.7): Implement recipe_search view with filtering logic (recipes/views.py)

[ ] In Progress (Ex 2.7): Integrate pandas and matplotlib for chart generation.

[ ] In Progress (Ex 2.7): Create search template (recipes/templates/recipes/search.html).

[ ] In Progress (Ex 2.7): Add URL pattern for search view.

[ ] In Progress (Ex 2.7): Write tests for search form and view.

[ ] Implement recipe creation/editing via forms (Future Exercise)

Future Enhancements
User-specific recipes (associating recipes with the logged-in user).

Recipe ratings or comments.

More advanced search/filtering options (e.g., by category, cuisine type).

Ingredient management (adding/editing ingredients globally).

Deployment to a live server (e.g., Heroku, Render).

Resources
Django Documentation: https://docs.djangoproject.com/en/stable/ (Adjust version if needed)

Pandas Documentation: https://pandas.pydata.org/docs/

Matplotlib Documentation: https://matplotlib.org/stable/contents.html

CareerFoundry Course Materials: Achievement 2, Exercises 2.1 - 2.8.

Deliverables
Fully functional Django project source code in the recipe-app repository.

Updated Recipe model including the difficulty field.

Working search page (/recipes/search/) with form, filtering logic, results table, and conditional chart display.

Implementation using RecipeSearchForm, recipe_search view, and search.html template.

Integration of pandas and matplotlib for chart generation.

Passing unit tests for forms and views related to Exercise 2.7.

Updated README.md (this file) and LEARNING_JOURNAL_2.7_(14).html.

Screenshots documenting the user flow and test results, saved in the designated location (e.g., PYTHON-ACHIEVEMENT-2 repo).

Technical Notes
Ensure pandas and matplotlib are added to your requirements.txt to make the environment reproducible.

Matplotlib is configured to use the Agg backend (matplotlib.use("Agg")) in views.py. This is crucial for running Matplotlib in a web server environment without a graphical display.

Charts are generated as PNG images, encoded in base64, and embedded directly into the HTML <img> tag using a data URI (src="data:image/png;base64,{{ chart }}").

The ingredient search uses Q objects to create an OR query across multiple comma-separated terms.

Author & Links
Author: Ivan Cortes

Portfolio: ivan-cortes-portfolio-v1.onrender.com

LinkedIn: Ivan Cortes Murcia

GitHub: @ivencomur

Twitter: @IVENCOMUR

AI Assistance Note
AI assistance is used as a supplementary tool for troubleshooting, concept clarification (especially regarding Django conventions, form handling, and library integration like Pandas/Matplotlib), adapting potentially outdated course materials to current library versions, and refining documentation (like this README and learning journals). All core logic, coding, testing, and debugging are performed hands-on by the student.

Screenshots List
(Required for Exercise 2.7, to be stored in the PYTHON-ACHIEVEMENT-2 repository or similar location)

2.7_search_form_empty.png: The search page loaded successfully, showing the empty form.

2.7_search_results_table.png: The search page after submitting criteria, showing filtered results in the table.

2.7_chart_difficulty_bar.png: The search page displaying the generated bar chart for difficulty distribution.

2.7_chart_time_pie.png: The search page displaying the generated pie chart for cooking time distribution.

2.7_chart_growth_line.png: The search page displaying the generated line chart for recipe growth over time.