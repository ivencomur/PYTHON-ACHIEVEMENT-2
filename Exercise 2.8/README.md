# Recipe App – Django Web Application

_Achievement 2 • CareerFoundry – Python for Web Developers_

**Student:** Ivan Cortes
**Repository:** `recipe-app` (Django-based Recipe Management System)

**Status:** ✅ Achievement 2 Complete & Deployed!
**Live Site:** [`https://recipe-app-ivan-cortes-8d505e6123c3.herokuapp.com/`](https://recipe-app-ivan-cortes-8d505e6123c3.herokuapp.com/)

**Last Updated:** October 22, 2025

---

## Table of Contents
1.  [Overview](#overview)
2.  [Live Application](#live-application)
3.  [Learning Objectives](#learning-objectives)
4.  [Environment & Specs](#environment--specs)
5.  [Project Structure](#project-structure)
6.  [Installation & Setup (Local Development)](#installation--setup-local-development)
7.  [Running Locally](#running-locally)
8.  [Deployment Summary (Exercise 2.8)](#deployment-summary-exercise-28)
9.  [Authentication & Access Control](#authentication--access-control)
10. [Data Models](#data-models)
11. [Testing](#testing)
12. [Development Workflow](#development-workflow)
13. [Key Challenges & Solutions](#key-challenges--solutions)
14. [Future Enhancements](#future-enhancements)
15. [Resources](#resources)
16. [Deliverables](#deliverables)
17. [Technical Notes](#technical-notes)
18. [Author & Links](#author--links)
19. [AI Assistance Note](#ai-assistance-note)
20. [Screenshots (Evidence)](#screenshots-evidence)

---

## Overview
Hey there! This project is my journey through Achievement 2 of the CareerFoundry Python course. It started as a simple command-line Recipe App back in Achievement 1 and has now blossomed into a full-stack web application using Django's MVT (Model-View-Template) way of doing things. Building this felt like connecting all the dots – from designing databases and handling user logins to actually putting it online for the world to see (well, theoretically!).

**What it Does Now (End of Achievement 2):**
* **Organized Code:** Features are split into different Django apps like `recipes` (the main star) and `sales` (for the homepage).
* **Recipe Management:** Shows a list of recipes, lets you click to see details, and even includes a search page.
* **User Login/Logout:** Got a proper login system using Django's built-in tools. You need to be logged in to see the recipes!
* **Smart Search:** The search page (`/recipes/search/`) lets you filter by name, ingredients (even if you only list some), cooking time, and difficulty.
* **Cool Charts:** Based on your search results, the app can generate bar, pie, or line charts using `pandas` and `matplotlib` right on the webpage!
* **Database Power:** Uses PostgreSQL on Heroku (the live version) and SQLite on my local machine. Django's ORM handles all the database stuff smoothly.
* **Testing:** Wrote tests to make sure the models, forms, and views are working correctly.
* **Looks Decent!:** Added CSS for consistent styling across the pages, including a new "About Me" page.
* **It's Live!:** Deployed successfully to Heroku using professional tools like `Gunicorn` (web server), `WhiteNoise` (for CSS/JS), and environment variables (to keep secrets safe).
* **Real Data:** Managed to migrate my 22 local recipes over to the live Heroku database, even after hitting some tricky encoding problems.

---

## Live Application
Check out the deployed app here!

**[`https://recipe-app-ivan-cortes-8d505e6123c3.herokuapp.com/`](https://recipe-app-ivan-cortes-8d505e6123c3.herokuapp.com/)**

_(Remember, you'll need to log in to see most pages. The required mentor credentials are `mentorCF` / `Ment0r@CareerF0undry`)._

---

## Learning Objectives
Looking back, Achievement 2 covered a ton of ground. I feel like I really got a handle on:
* Using Django's **MVT pattern** – understanding how Models, Views, and Templates work together.
* Designing **database models** with different fields and relationships (that `ManyToManyField` through `RecipeIngredient` was a big one!).
* Getting **static files** (like CSS) and handling **media files** (like images) set up, including the headaches they cause in production!
* Writing both simple **Function-Based Views** (FBVs) and the more powerful **Class-Based Views** (CBVs) like `ListView` and `DetailView`.
* Implementing **user login/logout** and protecting pages so only logged-in users can see them (`LoginRequiredMixin` is magic!).
* Setting up **URLs** properly, using namespaces so apps don't clash, and creating dynamic links (like `/recipes/1/`).
* Building **Django Forms** to get user input for the search page.
* Pulling in external libraries like `pandas` and `matplotlib` to add **data visualization**.
* Writing **unit tests** to make sure things don't break when I make changes.
* Making the app look consistent with **CSS** and adding pages like "About Me".
* Figuring out all the settings and files needed for **production deployment** – `DEBUG=False`, environment variables, etc.
* Actually **deploying to Heroku** with a real PostgreSQL database.
* **Troubleshooting** like crazy when things inevitably went wrong during deployment (looking at you, encoding errors!).

---

## Environment & Specs
* **Python:** 3.13.5 (using `.venv`).
* **Django:** 5.2.7.
* **Database (Local):** SQLite.
* **Database (Production):** PostgreSQL (Heroku Add-on).
* **Key Libraries:** `Pillow`, `pandas`, `matplotlib`, `gunicorn`, `whitenoise`, `python-decouple`, `dj-database-url`, `psycopg2-binary`.
* **OS/Shell:** Windows / Git Bash.
* **IDE:** VS Code.
* **Version Control:** Git / GitHub.
* **Deployment Platform:** Heroku.

> Activate local virtual environment: `source .venv/Scripts/activate`

---

## Project Structure
```text
recipe-app/
├── .venv/                     # Virtual environment files (ignored by git)
├── recipe_project/            # Django project config stuff
│   ├── settings.py            # Main settings (reads from .env)
│   ├── urls.py                # Main URL router
│   ├── views.py               # Login/Logout/About views
│   ├── wsgi.py                # For Gunicorn
│   └── management/            # Custom commands folder
│       └── commands/
│           └── load_recipes_fixed.py # Script to fix data loading
│
├── recipes/                   # The main app for recipes!
│   ├── migrations/            # Database changes history (now in git!)
│   ├── templates/recipes/     # HTML pages for this app
│   │   ├── recipes_list.html
│   │   ├── recipes_detail.html
│   │   └── search.html
│   ├── tests/                 # Folder for test files
│   │   ├── test_forms.py      # Tests for the search form
│   │   └── tests_views.py     # Tests for the search view
│   ├── admin.py               # How models look in /admin/
│   ├── apps.py                # App config
│   ├── forms.py               # The RecipeSearchForm definition
│   ├── models.py              # Recipe, Ingredient, RecipeIngredient models
│   ├── tests.py               # Model tests
│   └── urls.py                # URLs just for the recipes app
│
├── sales/                     # Simple app for the homepage
│   ├── templates/sales/
│   │   └── recipes_home.html  # Homepage HTML
│   ├── urls.py                # Homepage URL
│   └── views.py               # Homepage view function
│
├── templates/                 # Project-wide templates
│   ├── auth/                  # Login/logout pages
│   │   ├── login.html
│   │   └── logout_success.html
│   └── about_me.html          # My About Me page
│
├── static/                    # CSS, JS, and placeholder image
│   ├── css/style.css
│   ├── js/app.js
│   └── img/no_picture.jpg
│
├── .gitignore                 # Tells git what to ignore (like .env!)
├── db.sqlite3                 # My local database (ignored by git)
├── index.html                 # Main project documentation page/hub
├── LEARNING_JOURNAL/          # All my learning journal HTML files
├── manage.py                  # Django's helper script
├── Procfile                   # Tells Heroku how to run the app
├── requirements.txt           # List of all Python packages needed
├── runtime.txt                # Tells Heroku which Python version
└── recipes_data_utf8.json     # The recipe data, fixed for UTF-8 import

# External Repository for Course Deliverables:
# PYTHON-ACHIEVEMENT-2/ (My separate repo for CareerFoundry)
#   └── Exercise 2.8/
#       └── screenshots/       # Contains test-report.jpg and others
Installation & Setup (Local Development)
Want to run this on your own machine? Here’s how:

Bash

# 1. Get the code
git clone [https://github.com/ivencomur/recipe-app.git](https://github.com/ivencomur/recipe-app.git)
cd recipe-app

# 2. Set up a virtual environment (important!)
# Make sure you're using Python 3.13 or similar
python -m venv .venv
source .venv/Scripts/activate  # Or the command for your shell

# 3. Install all the needed packages
pip install -r requirements.txt

# 4. Set up the local database (creates db.sqlite3)
python manage.py migrate

# 5. Create an admin user for yourself
python manage.py createsuperuser

# 6. (Optional but Recommended) Load the recipe data
#    Make sure recipes_data_utf8.json is present
python manage.py loaddata recipes_data_utf8.json
#    (If this fails due to encoding, use the manual admin add method)

# 7. Start the development server!
python manage.py runserver
Running Locally
Once set up, you can access the different parts of the app:

Homepage: http://127.0.0.1:8000/

About Me: http://127.0.0.1:8000/about/

Login: http://127.0.0.1:8000/login/

Recipe List: http://127.0.0.1:8000/recipes/ (Need to log in first!)

Recipe Detail: e.g., http://127.0.0.1:8000/recipes/1/ (Need to log in)

Recipe Search: http://127.0.0.1:8000/recipes/search/ (Need to log in)

Admin Area: http://127.0.0.1:8000/admin/ (Use your superuser login)

Deployment Summary (Exercise 2.8)
Getting this app live on Heroku was quite the adventure! Here’s the final setup:

Platform: Heroku

Web Server: Gunicorn (handles incoming web requests)

Static Files: WhiteNoise (serves CSS, JS efficiently)

Database: PostgreSQL (using Heroku's essential-0 paid add-on for persistence)

Configuration: All secrets (like SECRET_KEY, DATABASE_URL) are stored safely as Heroku Config Vars and read using python-decouple. DEBUG is correctly set to False.

Process: Heroku uses the Procfile to start Gunicorn (web process) and run database migrations (release process) automatically on deploy.

Python: Version specified in runtime.txt.

Data: 22 recipes successfully migrated from local SQLite using a custom script to handle tricky encoding issues.

Images: Currently using placeholder URLs (via.placeholder.com) as a workaround for Heroku's temporary filesystem.

Authentication & Access Control
Uses Django's standard django.contrib.auth system.

Login, logout, and logout success pages are handled by views in recipe_project/views.py.

The main recipe list, detail, and search pages are protected – you get redirected to /login/ if you're not logged in (LoginRequiredMixin / @login_required).

Templates check user.is_authenticated to show different buttons/links (e.g., Login vs Logout).

Data Models
(Defined in recipes/models.py)

Recipe: Stores the main info: name (text), description (longer text), cook_time_minutes (positive number), difficulty (choices: Easy, Medium, Hard), created_at (auto-timestamp), and pic (text field holding the placeholder URL).

Ingredient: Simple list of unique ingredient names.

RecipeIngredient: This is the important "join table" that connects Recipes and Ingredients. It stores the quantity and unit for each ingredient within a specific recipe. It ensures you can't add the same ingredient twice to one recipe (unique_together).

Testing
Wrote tests using Django's TestCase.

Model Tests (recipes/tests.py): Check things like making sure cook_time_minutes is positive, ingredients are unique within a recipe, and the get_absolute_url() method works.

Form Tests (recipes/tests/test_forms.py): Check that the RecipeSearchForm validates correctly (e.g., accepts empty fields, rejects invalid cooking times).

View Tests (recipes/tests/tests_views.py): Check that the search page requires login, handles GET and POST requests correctly, filters results properly based on different criteria (name, ingredients, time, difficulty), and includes chart data when requested.

Run tests locally using python manage.py test recipes. All tests pass! ✅ (See test-report.jpg screenshot).

Development Workflow
Followed a pretty standard Git workflow:

Work on a feature (e.g., adding search).

Test it locally (runserver, manage.py test).

Commit changes (git add ., git commit -m "Added search feature").

Push to GitHub (git push origin main).

During Exercise 2.8, added deployment: Push to Heroku (git push heroku main).

Test on the live Heroku site. Repeat if necessary!

Key Challenges & Solutions
This project, especially deployment, wasn't always smooth sailing! Main hurdles included:

Heroku Free Tier Gone: The course assumed a free database was available, but it wasn't. Had to switch to a paid Heroku PostgreSQL plan.

Encoding Hell: Migrating recipe data from my Windows SQLite (Latin-1) to Heroku's PostgreSQL (UTF-8) failed due to accented characters. Standard loaddata didn't work. Solution: Wrote a custom Python script using the Django ORM to read the data, fix the encoding, and load it directly.

Images Disappearing: Uploaded images vanished on Heroku because its filesystem isn't persistent. Solution: Changed the Recipe.pic model field to a CharField and updated all recipes to use an external placeholder image URL. A proper fix would involve cloud storage like S3.

Forgetting Dependencies: Deployment failed until psycopg2-binary (PostgreSQL driver) was added to requirements.txt.

Migrations Ignored: Realized migrations/ was in .gitignore, preventing schema updates from reaching Heroku. Solution: Removed it from .gitignore and committed the migration files.

(More details in LEARNING_JOURNAL_2.8_(15).html)

Future Enhancements
This app has a good foundation, but there's always more to add!

Real Image Hosting: Integrate AWS S3 or similar for actual recipe photos.

User Recipe Submissions: Add forms for users to create/edit their own recipes.

User Profiles/Collections: Let users save favorite recipes.

Ratings & Reviews: Allow users to rate recipes.

More Advanced Search: Add filtering by category, cuisine type, etc.

Refactor/Improve: Clean up the CSS, maybe use Bootstrap more effectively.

Resources
Django Documentation - The ultimate source!

Heroku Dev Center - Essential for deployment steps.

WhiteNoise Docs - Explained static file serving.

python-decouple Docs - For environment variables.

Pandas & Matplotlib Docs - For the charting part.

Deliverables
Live Website: https://recipe-app-ivan-cortes-8d505e6123c3.herokuapp.com/

GitHub Repository (recipe-app): This repository containing all source code, tests, and config files.

Exercise 2.8 Folder (PYTHON-ACHIEVEMENT-2 repo): Contains required screenshots, including test-report.jpg.

Learning Journals: Detailed journals for each exercise (like this one!) are included in the LEARNING_JOURNAL/ directory.

Technical Notes
Data migration required a custom script (load_recipes_fixed.py) due to encoding issues between local SQLite (Latin-1) and production PostgreSQL (UTF-8).

Image handling uses external placeholder URLs as a workaround for Heroku's ephemeral filesystem.

Uses python-decouple for managing settings via environment variables (essential for security).

Static files are served efficiently in production using WhiteNoise.

Gunicorn is the production WSGI server.

Procfile handles automatic database migrations on deployment (release command).

Author & Links
Ivan Cortes

Portfolio: https://ivan-cortes-portfolio-v1.onrender.com/

LinkedIn: https://www.linkedin.com/in/ivan-cortes-murcia-22053953/

Twitter: https://x.com/IVENCOMUR

GitHub: https://github.com/ivencomur

AI Assistance Note
Throughout Achievement 2, especially during the tricky deployment phase (Exercise 2.8), I used AI assistance as a technical resource. It was particularly helpful for:

Navigating undocumented changes in Heroku's services (like the deprecated free database).

Diagnosing and creating a solution for the complex data encoding problem during migration – something way outside the course material.

Understanding PaaS architectural constraints like the ephemeral filesystem and suggesting workarounds (placeholder images).

Providing correct, up-to-date configuration syntax for production tools (Gunicorn, WhiteNoise, dj-database-url, psycopg2).

Helping interpret obscure error messages from Heroku logs.

Think of it like having a senior dev available to consult when the official docs or course materials didn't cover a specific real-world problem. I still did all the coding, testing, debugging, and decision-making myself, but the AI provided crucial technical pointers that unblocked me multiple times, especially during the deployment phase. It definitely accelerated my learning by helping me solve problems I wouldn't have figured out quickly on my own.

Screenshots (Evidence)
(All screenshots are stored in the separate PYTHON-ACHIEVEMENT-2 repository, under the relevant Exercise folder, e.g., Exercise 2.8/screenshots/)

Key screenshots demonstrating completion include:

Local server running with recipes (01_Server_Running.jpg)

About Me page rendering correctly (02_About_Me_Created.png)

Passing tests output (03_Test_Run_Done.png saved as test-report.jpg)

Admin panel accessible on Heroku (04_Admin_Panel.png)

Heroku logs showing successful migrations (05_Migrations_Carried_On_Heroku.png)

Logout success page on Heroku (06_LOgout_Ok.png)

Login page functional on Heroku (07_Login_Functional.png)

Recipe list rendering on Heroku with placeholder images (08_Login_FUnctional_Image_Placeholder_Erratic.png)

(Plus screenshots from Exercises 2.1 through 2.7 documenting each stage)