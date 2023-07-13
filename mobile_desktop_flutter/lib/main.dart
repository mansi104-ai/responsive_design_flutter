import 'package:flutter/material.dart';

void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget{
  const SignUpApp();

 

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes:{
        '/':(context) => const SignUpScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      } ,
    );
  }
}


class SignUpScreen extends StatelessWidget{
  const SignUpScreen();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[1000],
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Text('Welcome!', style: Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}


class SignUpForm extends StatefulWidget{
  const SignUpForm();

  @override 
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>{
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController  = TextEditingController();
  final _usernameTextController  = TextEditingController();

  double _formProgress = 0;
void _showWelcomeScreen() {
  Navigator.of(context).pushNamed('/welcome');
  };

  @override


  Widget build(BuildContext context){
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Text('Sign Up', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: const InputDecoration(hintText: 'First Name')
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: const InputDecoration(hintText: 'Last Name'),

              ),
            ),
          
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(hintText: 'User Name'),
              ),
            ),

          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                (Set <MaterialState> states){
                  return states.contains(MaterialState.disabled)
                      ? null 
                      : Colors.blue;

                }),
             ),
            onPressed: _showWelcomeScreen,
            child: const Text('Sign Up'),
            ),


        ],

      ) ,
    );
  }

}



