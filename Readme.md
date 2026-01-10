# 📘 MediBook – Automated Test Suite (Robot Framework + Selenium)

Ce dépôt contient la suite de tests automatisés du projet **MediBook**, développée avec :

- **Robot Framework**
- **SeleniumLibrary**
- **Page Object Model (POM)**
- **GitHub Actions** pour l’intégration continue

Les tests couvrent les fonctionnalités principales de l’application :

- Inscription patient
- Recherche de praticiens
- Prise de rendez-vous

---

## Architecture

medibook/
│
├── TESTS/
│   ├── E2E_tests/
│   │   ├── 01_registration.robot        # Suite de tests inscription
│   │   ├── 02_search.robot              # Suite de tests recherche
│   │   ├── 03_appointment.robot         # Suite de tests rdv
│   │   │
│   │   ├── Resources/                   # Etapes Given/When/Then
│   │   │   ├── registration_steps.robot
│   │   │   ├── search_steps.robot
│   │   │   └── appointment_steps.robot
│   │   │
│   │   ├── results/                     # Rapports et Logs Robot Framework
│   │       ├── 01_result/
│   │       ├── 02_result/
│   │       └── 03_result/
│   │
│   └── Resources/
│       └── POM/                         # Page Object Model
│           ├── common_page.resource
│           ├── registration_page.resource
│           ├── search_page.resource
│           ├── appointment_page.resource
│           ├── connexion_page.resource
│           └── home_page.resource
│
├── requirements.txt                      # Dépendances Python
│
└── .github/
└── workflows/
└── robot-tests.yml               # Pipeline GitHub Actions

## Installer les dépendances
```bash
pip install -r requirements.txt
```

## Exécuter les tests en local

Depuis la racine du projet :
Exécuter un test spécifique
```sh
robot tests/E2E_tests/01_registration.robot
```
Exécuter toutes les suites
```sh
robot tests/E2E_tests/
```
Visonner les rapports dans :
```sh
tests/E2E_tests/results/
```

## Intégration CI/CD
Le workflow se trouve dans le fichier suivant :
```sh
.github/workflows/robot-tests.yml
```
Il s'exécute à chaque push sur main ou chaque pull request