import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeInOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[600],
      body: Stack(fit: StackFit.expand, children: [
        new Image(
          image: new AssetImage('assets/coffee.jpg'),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                    child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 35)),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null) {
                            return 'Enter Email';
                          }
                          return null;
                        },
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Enter Password"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                        controller: passwordController,
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      MaterialButton(
                        height: 40,
                        minWidth: 150,
                        onPressed: () => {
                          if (!emailController.text.isEmpty &&
                              !passwordController.text.isEmpty)
                            {
                              print(
                                  'email: ${emailController.text}\n password: ${passwordController.text}')
                            }
                          else
                            {},
                        },
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: Text(
                          "Login",
                        ),
                        splashColor: Colors.redAccent,
                      )
                    ],
                  ),
                )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
