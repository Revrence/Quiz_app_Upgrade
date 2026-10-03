import 'package:flutter/material.dart';

final List<String> pastResults = []; // List to store past results

void addResult(String result){
  // Add the result to the list of past results
  pastResults.add(result);
}


class PastResultsScreen extends StatelessWidget {

 const PastResultsScreen({
     super.key,
     required this.mainMenu,
     });

  final void Function() mainMenu;
  
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
          
          children: [
            
            const SizedBox(height: 30,),
            const Text(
              'Past Results',
              style: TextStyle(
                color: Color.fromARGB(255, 216, 186, 239),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50,),
      
            SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(pastResults.join('\n'),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 216, 186, 239),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ), // Display past results as a single string
                    ],
                  ),
                ),
              ),
          
      
            TextButton.icon(
              onPressed: mainMenu,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              
              icon: const Icon(Icons.home),
              label: const Text('Main Menu'),
            ),
            
        ],
        ),
    );
  }
}