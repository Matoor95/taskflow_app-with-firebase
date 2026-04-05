import 'package:flutter/material.dart';
import 'package:taskflow_app/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // etat du form
  final _formKey=GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passwordController =TextEditingController();
  final _authService=AuthService();
  bool _loading=false;

  @override
  // dispose permet de liberer de la memoire et les resources 
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future <void> _login () async{
    //pour empêcher l'exécution d'une action (comme l'envoi d'un formulaire) si les données saisies par l'utilisateur sont invalides. 
    if(!_formKey.currentState!.validate()) return;
    setState(()=> _loading=true);
    final error = await _authService.login(
      email: _emailController.text,
       password: _passwordController.text
       );
       // si ce widget n'est plus affichea l'ecran 
       // arrete tout et n'exxecute pas la suite 
       if(!mounted) return ;
       setState(() {
         _loading=false;
       });
       // error existe
       if(error !=null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error), backgroundColor: Colors.red)


        );

       }
       // si succes , StreamBuilder dans main  redirige auto

  }

  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}