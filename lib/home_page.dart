import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'

                ),
                SizedBox(height: 50),

                Text("jogue e se divirta sei la não pensei nessa parte ainda",
                style: TextStyle(color: Colors.white)
                
                ),
              Spacer(flex: 3),
              ],
            ),
          )
        ],
      )
    )
  );
}
}





//child: Text("jogue e se divirta sei la não pensei nessa parte ainda",
  //style: TextStyle(color: Colors.white),
//Image.asset('assets/logo.png')
//padding: const EdgeInsets.only(top: 50),
