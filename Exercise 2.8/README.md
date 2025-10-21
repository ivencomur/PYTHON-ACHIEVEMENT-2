# Recipe App – Django Web Application

_Achievement 2 • CareerFoundry – Python for Web Developers_

**Student:** Ivan Cortes
**Repository:** `recipe-app` (Django-based Recipe Management System)

**Current Exercise:** 2.8 - Deployment (In Progress)
**Phase 1 Milestone:** ✅ About Me Page & Global Styling Complete

**Last Updated:** October 21, 2025

---

## Table of Contents
1. [Overview](#overview)
2. [Learning Objectives](#learning-objectives)
3. [Environment & Specs](#environment--specs)
4. [Project Structure](#project-structure)
5. [Installation & Setup (Windows + Git Bash)](#installation--setup-windows--git-bash)
6. [Running the App](#running-the-app)
7. [Deployment Guide (Exercise 2.8)](#deployment-guide-exercise-28)
8. [Authentication & Access Control](#authentication--access-control)
9. [Data Models](#data-models)
10. [Testing](#testing)
11. [Development Workflow](#development-workflow)
12. [Known Issues & TODOs](#known-issues--todos)
13. [Future Enhancements](#future-enhancements)
14. [Resources](#resources)
15. [Deliverables](#deliverables)
16. [Technical Notes](#technical-notes)
17. [Author & Links](#author--links)
18. [AI Assistance Note](#ai-assistance-note)
19. [Screenshots List](#screenshots-list)

---

## Overview
This Django web application evolves the command‑line Recipe App from **Achievement 1** into a full web application following Django's **MVT** (Model–View–Template) architecture. This project serves as the practical implementation for Achievement 2 of the CareerFoundry Python for Web Developers course.

**Current scope (Completion of Exercise 2.7 + Phase 1 + Exercise 2.8 In Progress):**
- Project with multiple Django apps (`recipes`, `sales`, `books`, etc.).
- Recipe Management: Display of recipes with images and ingredients (via Many‑to‑Many `through` model). Media file handling configured.
- User Authentication: Secure login/logout using Django's auth system. Recipe list, detail, and search views are protected.
- Search & Filtering: A functional search page (`/recipes/search/`) allows filtering recipes by name, ingredients (OR logic), max cooking time, and difficulty via `RecipeSearchForm`.
- Data Visualization: Dynamic generation and embedding of charts (bar, pie, line) based on search results using `pandas` and `matplotlib`.
- Database & Admin: SQLite database managed via ORM and migrations. Models registered in Django Admin.
- Testing: Unit tests cover models, URLs, forms (Ex 2.7), and views (Ex 2.7).
- About Me Page: Professional About Me page (`/about/`) with consistent global styling matching LEARNING_JOURNAL design (Phase 1).
- Deployment Ready: Production-grade configuration with environment variables, static file handling via WhiteNoise, and PaaS deployment support (Exercise 2.8).

---

## Learning Objectives
By the end of Achievement 2, key objectives include:
- Implementing Django's MVT pattern.
- Designing and migrating database models with relationships.
- Configuring and handling static and media files.
- Building FBVs and CBVs (`ListView`, `DetailView`).
- Implementing user authentication and view protection.
- Mastering URL routing including namespacing and dynamic URLs.
- Creating and processing Django Forms.
- Integrating data visualization libraries.
- Writing comprehensive tests for various components.
- Maintaining consistent styling and professional presentation across multiple pages.
- Configuring Django applications for production deployment.
- Deploying to Platform-as-a-Service (PaaS) providers.

---

## Environment & Specs
- **Python:** 3.13.5 (Virtual environment `.venv`)
- **Django:** 5.2.7
- **Database:** SQLite (development) / PostgreSQL (production-ready)
- **Key Libraries:** `Pillow`, `pandas`, `matplotlib`, `gunicorn`, `whitenoise`, `python-decouple`
- **OS/Shell:** Windows / Git Bash
- **IDE:** VS Code
- **Version Control:** Git / GitHub
- **Deployment:** PaaS-ready (Render, Heroku compatible)

> Activate virtual environment: `source .venv/Scripts/activate`

---

## Project Structure
```text
recipe-app/
├── .venv/
├── recipe_project/
│   ├── settings.py
│   ├── urls.py
│   └── views.py (auth)
│
├── recipes/
│   ├── migrations/
│   ├── templates/recipes/ (list, detail, search)
│   ├── tests/ (incl. test_forms.py, test_views.py)
│   ├── admin.py
│   ├── forms.py (RecipeSearchForm)
│   ├── models.py (Recipe incl. difficulty)
│   ├── urls.py (incl. search)
│   └── views.py (ListView, DetailView, recipe_search, generate_recipe_chart)
│
├── sales/ (homepage)
│   └── ...
│
├── templates/ (project-level auth & pages)
│   ├── auth/
│   └── about_me.html
│
├── static/ (CSS, JS, images - collected via collectstatic)
│
├── media/ (user uploads)
│
├── books/, customers/, salespersons/ (example apps)
│
├── .env (environment variables - NOT committed)
├── .gitignore
├── db.sqlite3
├── manage.py
├── README.md
├── requirements.txt (incl. pandas, matplotlib, gunicorn, whitenoise, python-decouple)
├── Procfile (Heroku/Render deployment config)
└── runtime.txt (Python version specification)

# LEARNING_JOURNAL/ (Sibling directory)
#   ├── LEARNING_JOURNAL_2.1_(8).html through LEARNING_JOURNAL_2.7_(14).html
#   └── ...

# PYTHON-ACHIEVEMENT-2/ (Separate repo)
#   └── Exercise 2.7/screenshots/
#       └── ...
```

## Installation & Setup (Windows + Git Bash)
```bash
git clone https://github.com/ivencomur/recipe-app.git && cd recipe-app

python -m venv .venv

source .venv/Scripts/activate

pip install -r requirements.txt

python manage.py migrate

python manage.py createsuperuser

python manage.py runserver
```

## Running the App
- **Homepage:** http://127.0.0.1:8000/
- **About Me:** http://127.0.0.1:8000/about/
- **Login:** http://127.0.0.1:8000/login/
- **Recipe List:** http://127.0.0.1:8000/recipes/ (Login required)
- **Recipe Detail:** e.g., http://127.0.0.1:8000/recipes/1/ (Login required)
- **Recipe Search:** http://127.0.0.1:8000/recipes/search/ (Login required)
- **Admin:** http://127.0.0.1:8000/admin/

## Deployment Guide (Exercise 2.8)

### Production Configuration

**1. Environment Variables (.env file)**
```
DEBUG=False
SECRET_KEY=your-secret-key-here
ALLOWED_HOSTS=yourdomain.com,www.yourdomain.com
DATABASE_URL=postgres://user:password@localhost:5432/recipe_app_db
```

**2. Settings.py Updates for Production**
```python
# Use environment variables
from decouple import config

DEBUG = config('DEBUG', default=False, cast=bool)
SECRET_KEY = config('SECRET_KEY')
ALLOWED_HOSTS = config('ALLOWED_HOSTS', default='localhost').split(',')

# Static files configuration
STATIC_ROOT = BASE_DIR / 'staticfiles'
STATIC_URL = '/static/'
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

# CORS and security headers
SECURE_SSL_REDIRECT = not DEBUG
SESSION_COOKIE_SECURE = not DEBUG
CSRF_COOKIE_SECURE = not DEBUG
```

**3. Static Files Collection**
```bash
python manage.py collectstatic --noinput
```

**4. Deployment to Render**
- Create `Procfile`:
```
  web: gunicorn recipe_project.wsgi
  release: python manage.py migrate
```
- Create `runtime.txt`:
```
  python-3.13.5
```
- Connect GitHub repository to Render
- Set environment variables in Render dashboard
- Deploy with automatic GitHub integration

**5. Database Migration**
```bash
python manage.py migrate --settings=recipe_project.settings
```

### Key Deployment Considerations
- Use environment variables for secrets (never hardcode)
- Enable HTTPS and secure cookies in production
- Configure allowed hosts correctly
- Use WhiteNoise for static file serving
- Set up proper logging and error monitoring
- Use PostgreSQL instead of SQLite for production
- Implement database backups and recovery procedures

---

## Authentication & Access Control
Uses django.contrib.auth.

Project-level views handle /login/, /logout/.

RecipeListView, RecipeDetailView, recipe_search are protected (LoginRequiredMixin or @login_required).

LOGIN_URL = '/login/' redirects unauthenticated users.

Templates use user.is_authenticated for conditional display.

## Data Models
(Primary models)

Recipe: Includes name, description, cook_time_minutes, pic, ingredients (M2M via RecipeIngredient), difficulty, created_at.

Ingredient: Includes name (unique).

RecipeIngredient: Links Recipe and Ingredient with quantity and unit. unique_together constraint.

## Testing
Run with: python manage.py test recipes (or python manage.py test recipes.tests)

Covers models (validation, relationships, get_absolute_url), forms (Ex 2.7), and views (auth, filtering, context - Ex 2.7).

## Development Workflow
(Standard Git flow: branch -> code -> test -> commit -> push -> merge)

## Known Issues & TODOs

[x] Implement recipe list/detail views (Ex 2.5)

[x] Create HTML templates for UI (Ex 2.4, 2.5, 2.7)

[x] Add URL routing for all apps (Ex 2.4, 2.5, 2.6, 2.7)

[x] Implement recipe image uploads (Ex 2.5)

[x] Add User Authentication & Protect Views (Ex 2.6)

[x] Add difficulty field to Recipe model (Ex 2.7)

[x] Create RecipeSearchForm (Ex 2.7)

[x] Implement recipe_search view with filtering (Ex 2.7)

[x] Integrate data visualization charts (Ex 2.7)

[x] Write tests for search form and view (Ex 2.7)

[x] Create About Me page with consistent styling (Phase 1)

[ ] To Do (Ex 2.8): Configure for deployment (settings, static files).

[ ] To Do (Ex 2.8): Deploy application to a PaaS (e.g., Render).

[ ] Implement recipe creation/editing via forms (Future Exercise).

## Future Enhancements
- User recipe creation/editing via Forms
- Personalized recipe collections per user
- Data analysis enhancements (more chart types, filtering options)
- Advanced filtering and sorting
- Mobile app integration
- Social sharing features

## Resources
- [Django Documentation](https://docs.djangoproject.com/)
- [Django REST Framework](https://www.django-rest-framework.org/)
- [Render Deployment Guide](https://render.com/docs)
- [WhiteNoise Documentation](http://whitenoise.evans.io/)
- [Pandas Documentation](https://pandas.pydata.org/docs/)
- [Matplotlib Documentation](https://matplotlib.org/stable/contents.html)

## Deliverables

Completed Django project source code for Exercises 2.1 - 2.7 + Phase 1.

Functional search page with filtering and dynamic chart generation.

Professional About Me page with consistent global styling.

Passing unit tests for models, URLs, forms, and views.

Production-ready deployment configuration.

Updated README.md and LEARNING_JOURNAL entries.

Required screenshots documenting functionality and testing.

## Technical Notes

pandas and matplotlib added to requirements.txt.

Matplotlib uses 'Agg' backend in views.py.

Charts embedded via base64 data URIs.

Ingredient search uses Q objects for OR logic.

About Me page styling matches LEARNING_JOURNAL design standards for consistency.

Gunicorn configured as production WSGI server.

WhiteNoise handles static file compression and serving.

Environment variables managed via python-decouple for security.

## Author & Links

**Ivan Cortes**
- Portfolio: https://ivan-cortes-portfolio-v1.onrender.com/
- LinkedIn: https://www.linkedin.com/in/ivan-cortes-murcia-22053953/
- Twitter: https://x.com/IVENCOMUR
- GitHub: https://github.com/ivencomur

## AI Assistance Note

AI assistance was instrumental in this project for:
- Integration of Pandas and Matplotlib with Django
- Matplotlib Agg backend configuration
- Base64 image encoding for chart embedding
- Q object usage for complex database queries
- Django Forms best practices
- Production deployment configuration
- Environment variable management with python-decouple
- Static file configuration with WhiteNoise

All code was written and tested hands-on by the developer. AI served as a technical reference and debugging aid throughout the project lifecycle.

## Screenshots List
(Required screenshots per exercise, stored in PYTHON-ACHIEVEMENT-2 repo)

Exercise 2.1: Project setup and initial structure

Exercise 2.2: Django project and app creation

Exercise 2.3: Database models and admin interface

Exercise 2.4: Views and templates rendering

Exercise 2.5: Image uploads and media files

Exercise 2.6: User authentication and login flow

Exercise 2.7: Search form, results table, bar chart, pie chart, line chart, passing tests

Exercise 2.8: Deployment configuration and live URL verification

    Phase 1: About Me page with professional styling