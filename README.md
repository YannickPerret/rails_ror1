# ROR : Application de Gestion Scolaire

Cette application de gestion scolaire permet de gérer les élèves, les classes, les semestres, les matières et les notes des élèves pour chaque matière et semestre.

## Installation

1. Assurez-vous d'avoir Ruby installé sur votre système. Vous pouvez le télécharger depuis [https://www.ruby-lang.org/](https://www.ruby-lang.org/).

2. Clonez ce dépôt sur votre machine locale :

    ```bash
    git clone https://github.com/votre-utilisateur/votre-projet.git ROR-Yannick
    ```

3. Accédez au répertoire de l'application :

    ```bash
    cd ROR-Yannick
    ```

4. Installez les dépendances en exécutant la commande suivante :

    ```bash
    bundle install
    ```
ou si vous avez des problèmes avec les droits d'accès :
  ```bash
    sudo bundle install
  ```

5. Créez la base de données et exécutez les migrations :

    ```bash
    rails db:create
    rails db:migrate
    ```

6. (Facultatif) Vous pouvez également exécuter les graines pour créer des données d'exemple :

    ```bash
    rails db:seed
    ```

## Utilisation

### Création d'un Élève

1. Connectez-vous à l'application en utilisant vos informations d'identification.

2. Accédez à la section "Student" dans le menu principal.

3. Cliquez sur le bouton "New Student".

4. Remplissez les informations requises telles que le Firstname, Lastname, e-mail, etc.

5. Cliquez sur le bouton "Create student" pour enregistrer l'élève.

### Création d'une Classe

1. Accédez à la section "School Class" dans le menu principal.

2. Cliquez sur le bouton "new School Class".

3. Entrez les détails de la classe tels que le name

4. Cliquez sur le bouton "Create school Class" pour enregistrer la classe.

### Création d'un Semestre

1. Accédez à la section "Semesters" dans le menu principal.

2. Cliquez sur le bouton "New Semester".

3. Saisissez les détails du semestre tels que le name, year, etc.

4. Cliquez sur le bouton "Create Semester" pour enregistrer le semestre.

### Ajout de Matières

1. Accédez à la section "Subjects" dans le menu principal.

2. Cliquez sur le bouton "New Subjects".

3. Entrez les détails de la matière tels que le name, etc.

4. Cliquez sur le bouton "Create Subjects" pour enregistrer la matière.

### Attribution de Notes à un Élève

1. Accédez à la section "Élèves" dans le menu principal.

2. Sélectionnez l'élève auquel vous souhaitez attribuer des notes.

3. Vous verrez une liste des matières et des semestres disponibles pour cet élève.

4. Cliquez sur le bouton "Ajouter Note" à côté de la matière et du semestre appropriés.

5. Saisissez la note pour cet élève dans le formulaire qui apparaît.

6. Cliquez sur le bouton "Enregistrer" pour attribuer la note à l'élève.

---

## Modèle Conceptuel de Données (MCD) avec Formes Normales

Le Modèle Conceptuel de Données (MCD) est une représentation visuelle des entités, des attributs et des relations entre les données dans un système. Les formes normales sont des règles de conception de base de données qui garantissent la cohérence et la normalisation des données pour éviter les anomalies et les redondances.

### Entités Principales :

1. **User (Utilisateur) :** Représente les utilisateurs du système, y compris les élèves, les professeurs et les superviseurs. Cette entité contient des informations telles que le prénom, le nom, l'e-mail et le type d'utilisateur.

2. **Subject (Matière) :** Représente les matières enseignées dans le système. Chaque matière a un nom et peut être enseignée par plusieurs professeurs.

3. **Grade (Note) :** Représente les notes attribuées aux élèves pour une matière donnée. Chaque note est associée à un élève, une matière, un semestre et une valeur de note.

4. **Semester (Semestre) :** Représente les différents semestres académiques dans lesquels les notes sont attribuées. Chaque semestre a une année et peut être associé à plusieurs matières.

### Relations :

1. **User - Grade (1:N) :** Un utilisateur (élève) peut avoir plusieurs notes.

2. **User - Subject (N:M) :** Un utilisateur (professeur) peut enseigner plusieurs matières, et une matière peut être enseignée par plusieurs utilisateurs (professeurs).

3. **Subject - Grade (1:N) :** Une matière peut avoir plusieurs notes, chaque note étant associée à une matière spécifique.

4. **Semester - Subject (N:M) :** Un semestre peut inclure plusieurs matières, et une matière peut être enseignée au cours de plusieurs semestres.

### Formes Normales :

Les formes normales sont des règles de conception qui garantissent l'organisation efficace et la normalisation des données. Voici comment le MCD satisfait les formes normales :

- **1NF (Première Forme Normale) :** Toutes les valeurs dans les tables sont atomiques, c'est-à-dire qu'elles ne sont pas subdivisées en parties plus petites.

- **2NF (Deuxième Forme Normale) :** Toutes les dépendances fonctionnelles sont résolues, et chaque attribut non clé est entièrement fonctionnellement dépendant de la clé primaire.

- **3NF (Troisième Forme Normale) :** Il n'y a pas de dépendance transitive entre les attributs non clés, et chaque attribut non clé est directement dépendant de la clé primaire.

---

## Procédure pour la Création des Modèles de Données (Scaffold)

Vous pouvez utiliser les commandes de génération de rails pour créer rapidement les modèles de données nécessaires à votre application. Voici les commandes pour générer chaque modèle :

```bash
rails generate scaffold User type:string lastname:string firstname:string email:string password_digest:string address:string phone:string npa:integer city:string country:string, state:string
rails generate scaffold SchoolClass name:string
rails generate scaffold Subject name:string archived:boolean
rails generate scaffold Grade value:float student:references subject:references semester:references
rails generate scaffold Semester name:string year:integer
rails

 generate scaffold ClassStudent student:references school_class:references semester:references
rails generate scaffold TeacherSubject teacher:references subject:references
rails generate scaffold ClassSubjectSemester school_class:references subject:references semester:references
```
