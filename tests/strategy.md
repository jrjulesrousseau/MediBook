# Stratégie d’automatisation des tests – MediBook (HealthTech Solutions)
 
## 1. Contexte & objectifs
HealthTech Solutions (45 personnes) livre trop vite pour une validation 100% manuelle.
Objectifs :
- Réduire le temps de validation d’une release de 5 jours → 1 jour
- Réduire les régressions prod ~10/mois → <2/mois
- Atteindre ~60% de couverture automatisée (ciblée sur les parcours critiques)
 
## 2. Périmètre de l’automatisation (quoi automatiser)
 
### 2.1 Types de tests
1) **Smoke tests**
**Environnements**      : CI/CD
**Déclenchement**       : Chaque Push & PR

Les smokes tests vont consister à valider le système pour vérifier qu'il fonctionne correctement et qu'il ne présente pas de dysfonctionnements qui pourraient entrainer une contamination de l'environnement. Ils sont donc les suivants :

- Lancement de l'application : du Front, de l'API et de la BDD
- Connexion OK
- Recherche praticien renvoie bien un/des résultat(s)
- Navigation vers les détails d'un praticien
 
2) **Tests de régressions**
**Environnement**       : CI/CD 
**Déclenchement**       : Chaque nuit & Chaque release

- Inscription (succès + email déjà utilisé)
- Login patient existant
- Recherche (avec résultat + sans résultat)
- Prise de rendez-vous + visibilité dans "Mes rendez-vous"
- Annulation rendez-vous (si feature)
- Contrôles de validation (champs obligatoires, messages d’erreur)
 
3) **E2E Bout-en-bout**
**Environnements**      : pré-prod & recette
**Déclenchement**       : Présentation au client & chaque nuit

Ces tests end-to-end permettront de garder une bonne confiance dans les fonctionnalités et les flux métier critiques
- Parcours patient complet : inscription → login → recherche → réservation → consultation rendez-vous
 
### 2.2 Critères d’automatisation d'un test

Propriétés d'un tes à automatiser en priorité :
- **Répétitif** | tests de régressions à chaque release
- **Critique**  | conversion, prise de RDV, connexions
- **Stable** | écran et règles peu changeantes
- **Déterministe** | résultat attendus prévisibles, données contrôlées
- **Chronophages** | gain de temps 
 
Proriétés d'un test à tester uniquement manuellement :
- **Instable** | Fonctionnalité souvent modifiée
- **Non-déterministe** | Cas comportant des dépendances externes et de l'aléa
- **Exploratoires** | Tests d'exploratoires, d'UX, d'accessibilité
- **Correctifs** | Correctifs d'anomalies mineures
 
### 2.3 Environnements cibles
- **DEV (local / branch)** : exécution rapide, smoke + régression ciblée
- **RECETTE (shared)** : régression complète (E2E) + validations intégration
- **PRE-PROD** : E2E complets avec données proches prod, release candidate

 
### 2.4 Outil utilisé
Outil recommandé : **Selenium RobotFramework**
- Usage fréquent dans les nouveaux projets
- Facilité d'utilisation et simplicité de la rédaction du code
- Rapports et Logs HTML & captures d'écrans lors d'un Fail
- Multi-navigateurs (Chrome, Firefox, Edge etc)
- Page Object Model facile à implémenter

Inconvénient : Plus de bas niveau & plus de granularité
 
 
## 3. Organisation & méthode
 
### 3.1 Agile : avantages / inconvénients pour l’automatisation

Déroulement :
- Sprint de 3 semaines
- 1 Itération Planning avant début du sprint
- 1 Itération Review à la fin du sprint
- 1 Daily tous les matins

Avantages :
- Retours rapides à chaque sprint -> amélioration continue
- Livraisons plus fréquentes
- “Definition of Done” peut inclure tests auto
Inconvénients :
- Si des US importantes sont releases et que l'UI change vite, alors il y a des 
risques que les tests soient plus fragiles
- Maintenance plus fréquente
- besoin d'une bonne communication entre developpeurs et testeurs sur les 
sélecteurs stables
 
### 3.2 Shift-left testing (intégration des tests au plus tôt)
- Tests unitaires Dev | déjà existants ou à renforcer
- Tests API rapides | contrats & erreurs
- E2E minimal sur PR | smoke tests
- Exécution régression
 
### 3.3 BDD Behavior Driven Development (Utilisation du format Gherkin)
But : langage commun PO/QA/Dev. Permet de faciliter la compréhension des tests par la MOA
- Les features `.feature` décrivent les parcours (sous forme Given/When/Then)
- Les tests .robot implémentent les étapes de parcours
Approche pragmatique :
- Gherkin pour spécifier et valider le besoin
- Implémentation RobotFramework en Page Object Model (POM) pour la stabilité
 
## 4. Stratégie de données de test
Problème : E2E fiables = données maîtrisées.
Approche :
- **Setup** : création de comptes/tests + praticiens de référence (via API ou SQL)
- **Teardown** : suppression des rendez-vous créés, nettoyage des comptes de test

 
## 5. Stratégie d’exécution CI/CD
Pipeline type :
1) install
2) start env (docker-compose)
3) wait health (front/api)
4) run tests
5) report (HTML + traces en artifact)
 
## 6. KPI et qualité
- Taux de réussite CI (flake rate)
- Temps d’exécution des tests
- Couverture fonctionnelle par parcours critique
- Nombre de bugs trouvés avant mise en prod
 
## 7. Plan de déploiement
Semaine 1 :
- Mise en place framework + CI + 3 scénarios demandés
Semaine 2–3 :
- Ajout smoke + régression (annulation, erreurs)
- Stabilisation sélecteurs + données
Semaine 4 :
- Ajout tests API / contract, exécution nightly
