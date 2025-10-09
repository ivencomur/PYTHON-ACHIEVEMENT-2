# Exercise 2.4 — Django Views & Templates

**Course:** CareerFoundry · Python for Web Developers
**Student:** Ivan Cortes
**Date:** October 2025

## 🎯 Overview
This exercise focuses on the "V" (View) and "T" (Template) of Django's MVT architecture. The goal is to replace Django's default welcome page with a custom, styled homepage. This involves creating a view function to handle logic, an HTML template to define the structure, and the URL routing to connect them.

## 📚 Learning Objectives
-   Understand the role of Views and Templates and how they interact in the MVT pattern.
-   Create a **Function-Based View (FBV)** that prepares and passes context data.
-   Write an HTML template using **Django Template Language (DTL)** to display dynamic data.
-   Configure **URL routing** at both the app and project levels using `path()` and `include()`.
-   Trace the full request-response cycle in a Django application.

## 🛠️ New Instructions for Screenshots & Commits

A **dual-repository commit process** is required: application code is committed to the `recipe-app` repository, while course deliverables (screenshots, journals, READMEs) are committed to the `PYTHON-ACHIEVEMENT-2` repository.

### Screenshot Guide
1.  **One Screenshot Required**: After successfully running the development server, navigate to `http://127.0.0.1:8000/`.
2.  Take a single screenshot of the custom, styled welcome page you created.
3.  Save the file as `welcome.jpg` inside the `PYTHON-ACHIEVEMENT-2/Exercise 2.4/screenshots/` directory.

### Commit & Push Workflow

**Step A: Commit Application Code to `recipe-app`**
```bash
# 1. Navigate to your Django project directory
cd /path/to/your/recipe-app

# 2. Stage all the new and modified files
git add sales/views.py sales/urls.py sales/templates/recipe_project/urls.py .

# 3. Commit the changes with a descriptive message
git commit -m "feat: Implement home page view and template for Exercise 2.4"

# 4. Push the commit to your remote repository
git push origin main
Step B: Commit Deliverables to PYTHON-ACHIEVEMENT-2

Bash

# 1. Navigate to your course deliverables repository
cd /path/to/your/PYTHON-ACHIEVEMENT-2

# 2. Stage your screenshot, this README, and the learning journal
git add "Exercise 2.4/screenshots/welcome.jpg" "Exercise 2.4/README.md" "Exercise 2.4/LEARNING_JOURNAL_2.4.html"

# 3. Commit the deliverables
git commit -m "docs: Add screenshot, README, and journal for Exercise 2.4"

# 4. Push the commit to the appropriate branch
git push origin <your-branch-name>
🤖 AI Assistance Declaration
To navigate the challenges of a self-paced learning environment—particularly with limited mentor availability and occasionally outdated course materials—I leveraged multiple resources to maintain progress. This included using AI as a supplementary learning tool to help understand Django's concepts, clarify workflows, and troubleshoot version-specific issues. This approach allowed me to focus on understanding core concepts while efficiently resolving technical hurdles. All code was written and tested hands-on, and AI assistance was used to explain why errors occurred and what Django was doing behind the scenes.