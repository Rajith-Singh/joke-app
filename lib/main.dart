import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.orange,
      ),
      home: const LoaderScreen(),
    );
  }
}

// Loader Screen
class LoaderScreen extends StatefulWidget {
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "😂 Joke App 😂",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

// Welcome Screen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to Joke App",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Enjoy fun and laughter!",
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 20),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LanguageSelectionScreen()),
                  );
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Language Selection Screen
class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Language"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            _buildLanguageTile(context, "English", "🇬🇧", "en"),
            _buildLanguageTile(context, "German", "🇩🇪", "de"),
            _buildLanguageTile(context, "French", "🇫🇷", "fr"),
            _buildLanguageTile(context, "Spanish", "🇪🇸", "es"),
            _buildLanguageTile(context, "Czech", "🇨🇿", "cs"),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile(
      BuildContext context, String name, String emoji, String langCode) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategorySelectionScreen(language: langCode),
          ),
        );
      },
      child: Card(
        color: Colors.orange[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Category Selection Screen
class CategorySelectionScreen extends StatelessWidget {
  final String language;

  const CategorySelectionScreen({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"name": "Any", "emoji": "😂"},
      {"name": "Programming", "emoji": "💻"},
      {"name": "Misc", "emoji": "🎲"},
      {"name": "Dark", "emoji": "🌑"},
      {"name": "Pun", "emoji": "🤡"},
      {"name": "Christmas", "emoji": "🎄"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Category"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestrictionSelectionScreen(
                      language: language,
                      category: category['name']!,
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.orange[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        category['emoji']!,
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        category['name']!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Restriction Selection Screen
class RestrictionSelectionScreen extends StatefulWidget {
  final String language;
  final String category;

  const RestrictionSelectionScreen(
      {Key? key, required this.language, required this.category})
      : super(key: key);

  @override
  State<RestrictionSelectionScreen> createState() =>
      _RestrictionSelectionScreenState();
}

class _RestrictionSelectionScreenState
    extends State<RestrictionSelectionScreen> {
  final List<String> restrictions = ["NSFW", "Sexist", "Political", "Religious"];
  final Set<String> selectedRestrictions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Restrictions"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: restrictions.length,
              itemBuilder: (context, index) {
                final restriction = restrictions[index];
                return CheckboxListTile(
                  title: Text(restriction),
                  value: selectedRestrictions.contains(restriction),
                  onChanged: (selected) {
                    setState(() {
                      if (selected == true) {
                        selectedRestrictions.add(restriction);
                      } else {
                        selectedRestrictions.remove(restriction);
                      }
                    });
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JokeDisplayScreen(
                    language: widget.language,
                    category: widget.category,
                    restrictions: selectedRestrictions.toList(),
                  ),
                ),
              );
            },
            child: const Text("Fetch Jokes"),
          ),
        ],
      ),
    );
  }
}

// Joke Display Screen
class JokeDisplayScreen extends StatefulWidget {
  final String language;
  final String category;
  final List<String> restrictions;

  const JokeDisplayScreen(
      {Key? key, required this.language, required this.category, required this.restrictions})
      : super(key: key);

  @override
  State<JokeDisplayScreen> createState() => _JokeDisplayScreenState();
}

class _JokeDisplayScreenState extends State<JokeDisplayScreen> {
  final TextEditingController searchController = TextEditingController();
  List<String> jokes = [];
  List<String> filteredJokes = [];
  bool isLoading = true;
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }

  Future<void> fetchJokes() async {
    if (!await hasNetworkConnection()) {
      await loadCachedJokes();
      return;
    }

    final restrictionQuery = widget.restrictions.isNotEmpty
        ? "&blacklistFlags=${widget.restrictions.join(",")}"
        : "";
    final url =
        "https://v2.jokeapi.dev/joke/${widget.category}?lang=${widget.language}$restrictionQuery&amount=5";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<String> fetchedJokes = List<String>.from(data['jokes'].map((joke) {
          return joke['type'] == 'single'
              ? joke['joke']
              : "${joke['setup']} - ${joke['delivery']}";
        }));

        await cacheJokes(fetchedJokes);

        setState(() {
          jokes = fetchedJokes;
          filteredJokes = fetchedJokes;
        });
      } else {
        throw Exception("Failed to load jokes");
      }
    } catch (e) {
      await loadCachedJokes();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> cacheJokes(List<String> jokes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('cached_jokes', jokes);
  }

  Future<void> loadCachedJokes() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedJokes = prefs.getStringList('cached_jokes') ?? [];

    setState(() {
      jokes = cachedJokes;
      filteredJokes = cachedJokes;
      isOffline = true;
    });

    if (cachedJokes.isEmpty) {
      showErrorDialog("You are offline and no jokes are cached.");
    } else {
      showErrorDialog("You are offline. Displaying cached jokes.");
    }
  }

  Future<bool> hasNetworkConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Notice"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void filterJokes(String query) {
    setState(() {
      filteredJokes = jokes
          .where((joke) => joke.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Jokes"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: filterJokes,
              decoration: InputDecoration(
                hintText: "Search jokes...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : jokes.isEmpty
                  ? const Center(
                      child: Text("No jokes available."),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: filteredJokes.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Text("${index + 1}"),
                              ),
                              title: Text(filteredJokes[index]),
                            ),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
