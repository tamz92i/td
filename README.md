Application de Suivi des Ventes

**Introduction:**
Cette application de suivi des ventes a été développée dans le cadre d'un projet visant à permettre à une entreprise de vente de suivre en temps réel les performances de ses commerciaux et de ses ventes. L'application offre plusieurs fonctionnalités pour gérer les ventes, afficher des statistiques et suivre les performances des commerciaux.

**Fonctionnalités:**
1. **Page de Connexion:**
   - L'utilisateur peut se connecter en saisissant un nom d'utilisateur et un mot de passe.
   - Pour des raisons de simplicité, aucune authentification réelle n'est effectuée, et l'utilisateur est redirigé vers la page principale après avoir appuyé sur le bouton de connexion.

2. **Page Principale:**
   - Affiche une liste des ventes enregistrées.
   - Permet d'ajouter une nouvelle vente en appuyant sur le bouton "Nouvelle Vente".
   - Un menu latéral permet d'accéder à d'autres fonctionnalités de l'application, telles que le classement des ventes et les statistiques.

3. **Page de Nouvelle Vente:**
   - Permet à l'utilisateur d'ajouter une nouvelle vente en saisissant le nom du vendeur, la vente réalisée, le prix et le statut de la vente.
   - Une fois la vente enregistrée, elle est ajoutée à la liste des ventes sur la page principale.

4. **Page de Classement des Ventes:**
   - Affiche un classement des ventes réalisées par chaque vendeur.
   - Les ventes sont triées par vendeur et affichent le montant de chaque vente.

5. **Page de Statistiques:**
   - Affiche des statistiques sur les performances des vendeurs.
   - Les statistiques incluent le nombre total de ventes réalisées par chaque vendeur.

**Technologies Utilisées:**
- **Flutter:** Utilisé pour le développement d'applications mobiles multiplateformes.
- **Dart:** Langage de programmation utilisé pour développer des applications Flutter.
- **Material Design:** Utilisé pour concevoir une interface utilisateur moderne et conviviale.
- **State Management:** Géré à l'aide du widget StatefulWidget pour maintenir l'état des ventes et des pages.
- **Navigation:** Gérée à l'aide de la classe Navigator pour naviguer entre les différentes pages de l'application.

**Remarque sur Firebase:**
En raison de contraintes techniques, Firebase n'a pas été intégré à cette application de démonstration. Les fonctionnalités telles que l'authentification utilisateur et le stockage des données en temps réel auraient pu être implémentées en utilisant Firebase si les circonstances le permettaient.

**Conclusion:**
Cette application de suivi des ventes offre une solution simple mais efficace pour suivre les performances des vendeurs et enregistrer les ventes en temps réel. Elle peut être étendue et améliorée avec l'intégration de fonctionnalités supplémentaires et l'utilisation de technologies telles que Firebase pour une expérience utilisateur plus complète et interactive.
