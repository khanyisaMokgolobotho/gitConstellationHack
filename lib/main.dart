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
      initialRoute: '/login', // Start with login screen
      routes: {
        '/': (context) => MainScreen(),
        '/login': (context) => LoginPage(),
        '/report': (context) => ReportIssuePage(),
        '/chat': (context) => CommunityChatPage(),
        '/track': (context) => TrackIssuePage(),
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
      resizeToAvoidBottomInset: false, // Prevent resizing when keyboard pops up
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1E0456), // Light Purple
                  Color(0xFF1E3C89), // Dark Purple
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo or App Title
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),

                    // Username Field
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "Username or Email",
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.7)),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username or email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.7)),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40),

                    // Login Button
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // For now, just navigate to the main screen
                          Navigator.pushReplacementNamed(context, '/');
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF1E0456), // Purple color
                              Color(0xFF1E3C89), // Darker Purple
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Forgot Password
                    GestureDetector(
                      onTap: () {
                        // Implement forgot password functionality here
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
            Text('Eastgate', style: TextStyle(fontSize: 14)),
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
                        Navigator.pushNamed(context,
                            'https://x.com/search?q=%23wateroutage%20&src=typed_query&f=live');
                      } else if (index == 2) {
                        Navigator.pushNamed(context,
                            'https://www.tiktok.com/@newsnexussa/video/7436008196193504567?lang=en&q=wateroutage%20&t=1731589488095'); // Track issue progress
                      } else if (index == 3) {
                        Navigator.pushNamed(context,
                            'https://www.tiktok.com/@newsnexussa/video/7436008196193504567?lang=en&q=wateroutage%20&t=1731589488095'); // Track issue progress
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
