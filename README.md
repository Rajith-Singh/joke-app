# Joke App 😂

**Index Number**: YOUR_INDEX_NUMBER  
**Name**: YOUR_NAME  

A vibrant and interactive Joke App built using Flutter. This app provides a fun way to discover jokes while allowing users to customize their preferences for language, categories, and content restrictions. The app supports offline mode with caching, ensuring uninterrupted laughter even without an internet connection!

---

## 🌟 Features

### 1. **Jokes Filtering**
- **Categories**: Choose from multiple joke categories such as Programming, Dark, Pun, Christmas, etc.
- **Languages**: Filter jokes by supported languages (English, German, French, Spanish, Czech).
- **Restrictions**: Blacklist content like NSFW, sexist, political, or religious jokes.

### 2. **Search**
- Search jokes containing specific keywords or phrases.

### 3. **Offline Mode**
- Caches jokes locally using `shared_preferences`.
- Displays cached jokes when offline.
- Displays a user-friendly popup indicating offline mode.

### 4. **Error Handling**
- Provides meaningful error messages for API failures or when no jokes match the filters.

### 5. **Dynamic UI**
- Fun, engaging, and interactive UI/UX with vibrant colors, emojis, and animations.
- Each joke is attractively displayed with proper numbering.

### 6. **Customizable Flow**
- Select language → Choose category → Apply restrictions → View jokes.
- Search and filter jokes dynamically on the jokes screen.

---

## 📖 Usage

1. **Loader Screen**: Shows a playful loader with the app's name.
2. **Welcome Screen**: Brief description and a "Get Started" button.
3. **Language Selection**: Select from supported languages with flag icons.
4. **Category Selection**: Choose one or more joke categories with emoji-based cards.
5. **Restriction Selection**: Blacklist specific content with toggle switches.
6. **Joke Display Screen**:
   - View 5 jokes at a time.
   - Search jokes using the search bar.
   - Offline mode displays cached jokes.

---

## 🛠️ Technologies Used
**Flutter: Framework for building the app.**
**Shared Preferences: Local caching for offline mode.**
**HTTP: To make API calls for fetching jokes.**

## 📚 API Documentation

The app uses the JokeAPI to fetch jokes dynamically.

**Endpoints**
**1. Fetch jokes in a specific language:**

https://v2.jokeapi.dev/joke/Any?lang=de

**2. Apply content restrictions:**

https://v2.jokeapi.dev/joke/Any?lang=de&blacklistFlags=sexist


## 👩‍💻 Author
**Name: Tharusha Rajith Singh**
**Index: 214201L**

## Have fun using the Joke App! 🎉