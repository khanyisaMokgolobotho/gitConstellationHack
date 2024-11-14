import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF5F4B8B), // Purple color
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black), // Use bodyLarge instead of bodyText1
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/report': (context) => ReportIssuePage(),
        '/chat': (context) => CommunityChatPage(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BUA_SECHABA'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thursday, November 14',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'City of Tshwane Municipality',
              style: TextStyle(fontSize: 14),
            ),
            Text('Region One', style: TextStyle(fontSize: 14)),
            SizedBox(height: 10),
            Text(
              '60% Expected rain\nTemperature 25°C',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              'Good Morning, 08:30',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            // Wrap GridView.builder with Expanded to make it take available space
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two buttons per row
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 5, // Adjust for your buttons
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5F4B8B), // Purple color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    onPressed: () {
                      // Navigate to the respective page
                      if (index == 0) {
                        Navigator.pushNamed(context, '/report');
                      } else if (index == 1) {
                        Navigator.pushNamed(context, '/chat');
                      }
                      // Add more conditions for other buttons here
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          index == 0
                              ? Icons.report
                              : index == 1
                                  ? Icons.chat
                                  : index == 2
                                      ? Icons.trending_up
                                      : index == 3
                                          ? Icons.tv
                                          : Icons.business,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          index == 0
                              ? 'Report an Issue'
                              : index == 1
                                  ? 'Community Chat'
                                  : index == 2
                                      ? 'Community Trends'
                                      : index == 3
                                          ? 'Community Updates'
                                          : 'E-government',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Issue'),
      ),
      body: Center(
        child: Text('Report Issue Page'),
      ),
    );
  }
}

class CommunityChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Chat'),
      ),
      body: Center(
        child: Text('Community Chat Page'),
      ),
    );
  }
}
