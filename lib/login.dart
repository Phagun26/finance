import 'package:finance/home.dart';
import 'package:finance/signup.dart';
import 'package:flutter/material.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('Welcome', style: TextStyle(
          color: Colors.grey[900],
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text(
                'Login into your Account',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,

              ),
              textAlign: TextAlign.center,

            ),
            SizedBox(height: 30,),

            Text('Username', style: TextStyle(
                fontSize: 22
            ),),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),


                child: Container(
                  width: 300,
                  height: 70,
                  child: TextField(
                    decoration:  InputDecoration(
                      hintText: 'Enter your Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 20,),

            Text('Password', style: TextStyle(
                fontSize: 22
            ),),
            SizedBox(height: 10,),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),


                child: Container(
                  width: 300,
                  height: 70,
                  child: TextField(
                    obscureText: true,
                    decoration:  InputDecoration(
                      hintText: 'Enter your Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 30,),
            Container(
              height: 60,
              width: 250,
              padding: EdgeInsets.only(left:100),
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homescreen()));   }

    ),

    ),
            SizedBox(height: 30,),
            InkWell(
              onTap: ()
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signup()));
              },
              child: Text('New Account? Sign up',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
              ),
            )
    ]
    )
    ),
    );
  }
}
