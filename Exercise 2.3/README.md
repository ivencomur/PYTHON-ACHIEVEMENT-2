# Exercise 2.3 — Django Models: Building the Recipe App Database

**Course:** CareerFoundry · Python for Web Developers  
**Student:** Ivan Cortes  
**Exercise:** 2.3 — Django Models

## Overview

Exercise 2.3 represents the critical transition from theoretical project setup to concrete database architecture. This exercise focused on implementing the "M" in Django's MVT (Model-View-Template) architecture by designing and building the data models for the Recipe application.

The process involved translating abstract requirements into a structured database schema, creating Django models that represent recipes and their ingredients, establishing relationships between entities, and using Django's ORM to generate the actual database tables. A significant component was also writing automated tests to validate model behavior and using Django's admin interface for initial data population.

## Learning Objectives

- **Database Design:** Translate application requirements into a logical database schema
- **Django Models:** Define models as Python classes with appropriate field types and constraints
- **Relationships:** Implement many-to-many relationships using intermediate models
- **Migrations:** Use Django's migration system to create and modify database schema
- **Testing:** Write unit tests to verify model functionality and constraints
- **Admin Interface:** Register and customize models in Django admin for data management

## Database Architecture

### Schema Design

The Recipe app database consists of three interconnected models:

#### 1. Ingredient Model
A simple model storing unique ingredient names. The `unique=True` constraint prevents duplicate entries.

**Fields:**
- `name` (CharField, max_length=120, unique=True)

**Purpose:** Maintains a master list of all ingredients used across recipes.

#### 2. Recipe Model
The core model containing recipe information and metadata.

**Fields:**
- `name` (CharField, max_length=120) — Recipe name
- `description` (TextField, blank=True) — Optional recipe description
- `cook_time_minutes` (PositiveIntegerField, MinValueValidator(1)) — Cooking time
- `created_at` (DateTimeField, auto_now_add=True) — Timestamp
- `ingredients` (ManyToManyField through RecipeIngredient) — Related ingredients

**Purpose:** Stores recipe details and links to ingredients through the intermediate model.

#### 3. RecipeIngredient Model (Junction Table)
Implements the many-to-many relationship between recipes and ingredients while storing additional context about each relationship.

**Fields:**
- `recipe` (ForeignKey to Recipe)
- `ingredient` (ForeignKey to Ingredient)
- `quantity` (FloatField, MinValueValidator(0.0))
- `unit` (CharField, max_length=32, blank=True) — e.g., "cups", "grams"

**Constraints:**
- `unique_together = ('recipe', 'ingredient')` — Prevents duplicate ingredient entries per recipe

**Purpose:** Allows storing quantity and unit information for each ingredient within a recipe.

### Why This Design?

**Many-to-Many Through Model:**
- Recipes can have multiple ingredients
- Ingredients can be used in multiple recipes
- The through model (RecipeIngredient) stores the quantity/unit relationship
- This is more flexible than Django's default many-to-many implementation

**Data Integrity:**
- `unique=True` on Ingredient.name prevents duplicates
- `unique_together` prevents adding the same ingredient twice to a recipe
- `MinValueValidator` ensures cooking times are positive
- `blank=True` allows optional fields without making them nullable

## Implementation Process

### 1. App Creation
```bash
# Created the recipes app
python manage.py startapp recipes

# Registered in settings.py INSTALLED_APPS
'recipes',
```

### 2. Model Definition
Defined all three models in `recipes/models.py` with:
- Appropriate field types
- Validation constraints
- Ordering (alphabetical by name)
- String representations (`__str__` methods)

### 3. Admin Registration
Registered models in `recipes/admin.py` with:
- List display configurations
- Search capabilities
- TabularInline for RecipeIngredient (allows adding ingredients directly within recipe creation)

### 4. Database Migration
```bash
# Generated migration file
python manage.py makemigrations recipes

# Applied migration to database
python manage.py migrate
```

Django created the `0001_initial.py` migration file, defining:
- All three tables with appropriate field types
- Foreign key relationships
- Unique constraints
- Indexes

### 5. Testing
Wrote comprehensive tests in `recipes/tests.py` covering:
- Model string representations
- Ordering functionality
- Validation constraints (MinValueValidator)
- Unique constraints (unique_together)
- Many-to-many relationships through the junction model

```bash
# Ran all tests
python manage.py test recipes -v 2
```

All tests passed, validating model behavior.

### 6. Data Population
Used Django admin to populate the database:
- Added multiple ingredients (Flour, Sugar, Eggs, etc.)
- Created complete recipes with ingredients using the inline form
- Verified relationships and constraints

## Key Files

### Models (`recipes/models.py`)
Contains the three model definitions with field validations and custom methods.

### Admin (`recipes/admin.py`)
Configures Django admin interface with:
- Model registration
- List display settings
- Search fields
- TabularInline for RecipeIngredient

### Tests (`recipes/tests.py`)
Comprehensive test suite covering:
- Field validations
- Constraint enforcement
- Relationship integrity
- String representations

### Migrations (`recipes/migrations/0001_initial.py`)
Auto-generated migration file that creates:
- Ingredient table
- Recipe table  
- RecipeIngredient junction table with constraints

## Commands Reference

```bash
# In src directory

# Create new app
python manage.py startapp recipes

# Generate migration after model changes
python manage.py makemigrations recipes

# Apply migrations to database
python manage.py migrate

# Run tests with verbose output
python manage.py test recipes -v 2

# Start development server
python manage.py runserver
```

## Screenshots & Deliverables

### Code Implementation
- `13_Recipe_blueprint.png` — Database schema diagram
- `14_Project_Structure.jpg` — Annotated project structure showing recipes app

### Migration Process
- `01_run-migrations.png` — Successful makemigrations and migrate execution
- `02_Server running.png` — Development server confirmation

### Admin Interface
- `03_Admin running.png` — Django admin with Recipes section
- `04_Ingredients_Added.png` — Multiple ingredients added
- `05_Adding_Recipe_Ingredients.png` — Inline ingredient form within recipe
- `06_More_recipe_Ingredients.png` — Another recipe with ingredients
- `12_Added_User.png` — Non-superuser creation

### Testing & Validation
- `10_test_recipes_run_report.png` — All tests passing
- `11_Error_Expected_Adding_Existing_Ingredient.png` — Unique constraint validation

### Troubleshooting
- `07_Server_run_terminal_output.png` — Terminal log during data entry
- `08_Error_Evidence_1.png` — ImportError from inactive virtual environment

## Challenges & Solutions

### 1. Virtual Environment Activation
**Problem:** Received `ImportError: Couldn't import Django` when running commands.

**Solution:** Activated virtual environment with `source ../venv/Scripts/activate` (adjusting path as needed). This error reinforced the importance of working within the correct environment.

### 2. Model Registration
**Problem:** After creating models and running migrations, the Recipes section didn't appear in admin.

**Solution:** Had forgotten `admin.site.register()` calls in `admin.py`. Added registration for all three models.

### 3. Understanding Through Models
**Problem:** Initially unclear why a separate RecipeIngredient model was needed instead of Django's default ManyToManyField.

**Solution:** Realized the through model allows storing additional data (quantity, unit) about the relationship itself, not just which recipes contain which ingredients.

## Key Concepts Mastered

### Django Models
- Defining models as Python classes inheriting from `models.Model`
- Using appropriate field types (CharField, TextField, PositiveIntegerField, etc.)
- Implementing validators (MinValueValidator) for data integrity
- Understanding field options (unique, blank, default, auto_now_add)

### Relationships
- Many-to-many relationships with through models
- Foreign key relationships
- Using `related_name` for reverse queries
- The `unique_together` meta option

### Migrations
- Two-step process: makemigrations (create plan) then migrate (execute plan)
- Migration files provide version control for database schema
- Reviewing generated migration files before applying

### Django Admin
- Model registration for admin interface access
- Customizing admin with list_display, search_fields, list_filter
- Using TabularInline for improved data entry workflow
- Admin provides immediate CRUD interface without writing views

### Testing
- Writing model tests using Django's TestCase
- Testing field constraints and validations
- Verifying relationship integrity
- Using IntegrityError and ValidationError in tests

## What I Learned

1. **Planning is Critical:** The database blueprint phase prevented issues later. Changes to models after building views/templates would be much more complex.

2. **Django ORM is Powerful:** Models automatically handle database operations without writing SQL. The abstraction is intuitive once you understand the mapping.

3. **Through Models Add Flexibility:** While they add complexity, through models enable storing relationship metadata that would be impossible with default many-to-many fields.

4. **Testing Early Saves Time:** Writing tests after creating models (before views) catches constraint issues immediately when they're easiest to fix.

5. **Admin is Rapid Development:** Django admin provides instant data management without writing CRUD views, perfect for prototyping and internal tools.

## Next Steps

With the data models established:
1. Create views to display recipes to users
2. Build templates for user-facing pages
3. Implement search and filter functionality
4. Add user authentication
5. Create forms for recipe submission

The "M" of MVT is complete. Exercise 2.4 will focus on Views and Templates to create the user interface.

## Repository Structure

```
Exercise 2.3/
├── README.md (this file)
├── LEARNING_JOURNAL_2.3_(10).html
├── 13_Recipe_blueprint.png
├── 14_Project_Structure.jpg
├── 01_run-migrations.png
├── 02_Server running.png
├── 03_Admin running.png
├── 04_Ingredients_Added.png
├── 05_Adding_Recipe_Ingredients.png
├── 06_More_recipe_Ingredients.png
├── 07_Server_run_terminal_output.png
├── 08_Error_Evidence_1.png
├── 10_test_recipes_run_report.png
├── 11_Error_Expected_Adding_Existing_Ingredient.png
└── 12_Added_User.png

src/
├── manage.py
├── recipe_project/
│   ├── settings.py (recipes app registered)
│   └── ...
└── recipes/
    ├── models.py (Ingredient, Recipe, RecipeIngredient)
    ├── admin.py (Model registration with inline)
    ├── tests.py (Model test suite)
    └── migrations/
        └── 0001_initial.py
```

---

**Status:** Exercise 2.3 Complete ✓  
**Achievement 2 Progress:** Models implemented, ready for Views & Templates  
**GitHub:** [Recipe App Repository](https://github.com/ivencomur/recipe-app)