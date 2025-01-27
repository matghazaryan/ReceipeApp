### RecipeApp

RecipeApp is a simple and elegant app that demonstrates clean architecture, modularity, and robust error handling for various data scenarios. It fetches recipe data from the network and provides a clean and intuitive interface to showcase its features. The project prioritizes clean code, dependency injection, and MVVM architecture with full unit testing support.



### 🎥 Summary

RecipeApp allows users to fetch and view recipes with three distinct options:
	•	List: Fetches and displays a list of recipes.
	•	Malformed: Handles malformed data gracefully.
	•	Empty: Demonstrates how the app manages an empty dataset.

Demo Video:


https://github.com/user-attachments/assets/5b254b92-4ee4-496b-b7f0-ea7c6eff7e7a




### 📚 Focus Areas

Key Features:
1. **Modularity:**
   - The project is divided into distinct modules to promote reusability and maintainability.
   - NetworkingKit: Handles network requests using URLSession.
   - DesignSystemKit: Contains shared UI components (e.g., buttons, cards) used across the project.
   - RecipeListKit: Handles all recipe-related features, including Recipe List and Recipe Details views.
2. **Architecture**
   - Clean Architecture: Ensures separation of concerns across different layers:
   - Data Layer: Handles data fetching (network/local) and data transfer objects (DTO).
   - Domain Layer: Contains business logic (use cases).
   - DI Layer: Implements manual dependency injection to decouple dependencies.
   - Presentation layer along with MVVM (Model-View-ViewModel): Provides a reactive data flow between the ViewModel and UI.

3. **Concurrency**
  - Uses Swift’s native async/await for improved readability and performance when handling asynchronous tasks.

4. **Error Handling:**
   - Handles scenarios like no internet connection, malformed JSON, and empty responses gracefully.

5. **Native APIs:**
	- The project is built entirely with native Swift and iOS APIs, avoiding third-party dependencies.



### ⏱ Time Spent
  4-5 Hours Total



### ⚖️ Trade-offs and Decisions
	
 Design vs. Architecture:
 - Focused more on the architecture, modularity, and clean code rather than professional-level design.
 - The app uses basic but functional UI components.
 - No Offline Support.
 - The app only works with an active internet connection. 
	


### 🛠 Weakest Part of the Project

The project’s size makes it difficult to highlight significant weaknesses. However:
- Navigation: Swift’s Navigation system can create additional complexity for managing nested and dynamic navigation scenarios.
- Offline Support: Offline functionality could be added in the future.



### 📋 Additional Information
	
 Device Compatibility:
 - Supports iPhone and iPad in portrait mode only. 
	
 Unit Testing:
 - Covers data and domain layers.

### 🧩 Project Structure
<img width="894" alt="image" src="https://github.com/user-attachments/assets/adb6f231-403e-4716-9f77-18414a0e7a29" />

