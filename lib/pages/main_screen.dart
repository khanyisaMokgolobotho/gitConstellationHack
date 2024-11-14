import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData(
        primaryColor: Color.fromRGBO(30, 4, 86, 1), // Purple color
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge:
              TextStyle(color: Colors.black), // bodyLarge instead of bodyText1
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => MainScreen(),
        '/login': (context) => LoginPage(),
        '/report': (context) => ReportIssuePage(),
        '/chat': (context) => CommunityChatPage(),
        '/track': (context) =>
            TrackIssuePage(), // Add route for Track Issue Progress
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromRGBO(30, 4, 86, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please log in to continue',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username or Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username or email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // For now, just navigate to the main screen
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(3, 31, 189, 1),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
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
              'City of Johannesburg',
              style: TextStyle(fontSize: 14),
            ),
            Text('Region One', style: TextStyle(fontSize: 14)),
            SizedBox(height: 10),
            Text(
              '60% Expected rain\nTemperature 23°C',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              'Good Afternoon, 16:00',
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
                itemCount:
                    6, // Increased item count to 6 (including Track Issue)
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromARGB(255, 5, 20, 83), // Purple color
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
                      } else if (index == 2) {
                        Navigator.pushNamed(
                            context, '/track'); // Track issue progress
                      }
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
                                          : index == 4
                                              ? Icons.business
                                              : Icons
                                                  .track_changes, // Icon for Track Issue
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
                                          : index == 4
                                              ? 'E-government'
                                              : 'Track Issue Progress', // Text for Track Issue
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

// Page for Tracking Issue Progress
class TrackIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Issue Progress'),
      ),
      body: Center(
        child: Text('Track your issue progress here!'),
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
