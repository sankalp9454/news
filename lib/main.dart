import 'package:flutter/material.dart';

void main() {
  runApp(const PRNewsGamesApp());
}

class PRNewsGamesApp extends StatelessWidget {
  const PRNewsGamesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PR News & Games',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF123D2B),
          primary: const Color(0xFF123D2B),
          secondary: const Color(0xFFD5A642),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F6F4),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF123D2B),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int selectedIndex = 0;

  static const pages = <Widget>[
    HomePage(),
    NewsPage(),
    GamesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'होम',
          ),
          NavigationDestination(
            icon: Icon(Icons.newspaper_outlined),
            selectedIcon: Icon(Icons.newspaper),
            label: 'न्यूज़',
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_esports_outlined),
            selectedIcon: Icon(Icons.sports_esports),
            label: 'गेम्स',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'प्रोफाइल',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PR NEWS INDIA',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
        actions: [
          IconButton(
            tooltip: 'सूचनाएं',
            onPressed: () => _showMessage(context, 'सूचनाएं जल्द उपलब्ध होंगी।'),
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF123D2B),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('सटीक खबर, सबसे पहले',
                    style: TextStyle(color: Color(0xFFD5A642), fontSize: 14)),
                SizedBox(height: 8),
                Text('PR News & Games',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('न्यूज़ भी, मनोरंजन भी — एक ही ऐप में।',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const SectionHeading(title: 'मुख्य सेक्शन'),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: FeatureTile(
                  icon: Icons.newspaper,
                  title: 'ताज़ा खबरें',
                  subtitle: 'देश और प्रदेश',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: FeatureTile(
                  icon: Icons.sports_esports,
                  title: 'गेम्स',
                  subtitle: 'खेलें और आनंद लें',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SectionHeading(title: 'आज की प्रमुख खबरें'),
          const SizedBox(height: 10),
          const NewsCard(
            category: 'PR NEWS INDIA',
            title: 'आपके शहर और जिले की खबरें जल्द यहां दिखाई देंगी।',
            time: 'अपडेट जल्द',
          ),
          const SizedBox(height: 20),
          const SectionHeading(title: 'गेम ज़ोन'),
          const SizedBox(height: 10),
          const NewsCard(
            category: 'GAMES',
            title: 'नए और मनोरंजक गेम्स का सेक्शन तैयार किया जा रहा है।',
            time: 'जल्द आ रहा है',
          ),
        ],
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'ताज़ा खबरें',
      icon: Icons.newspaper,
      message: 'PR News India की खबरें यहां API से दिखाई जाएंगी।',
    );
  }
}

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'गेम ज़ोन',
      icon: Icons.sports_esports,
      message: 'गेम्स और यूज़र स्कोर का सेक्शन यहां विकसित होगा।',
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'मेरा अकाउंट',
      icon: Icons.account_circle,
      message: 'लॉगिन, रजिस्ट्रेशन और सब्सक्रिप्शन यहां जोड़े जाएंगे।',
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String message;

  const SimplePage({
    super.key,
    required this.title,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 58, color: const Color(0xFF123D2B)),
              const SizedBox(height: 16),
              Text(message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  const SectionHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold));
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E8E5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: const Color(0xFF123D2B)),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: const TextStyle(color: Colors.black54, fontSize: 12)),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String category;
  final String title;
  final String time;

  const NewsCard({
    super.key,
    required this.category,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category,
                style: const TextStyle(
                    color: Color(0xFF98701D),
                    fontWeight: FontWeight.bold,
                    fontSize: 11)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 8),
            Text(time,
                style: const TextStyle(color: Colors.black45, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

void _showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
