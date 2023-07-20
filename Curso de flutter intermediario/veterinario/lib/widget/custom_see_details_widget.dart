import 'package:flutter/material.dart';

class CustomSeeDetailsWidget extends StatelessWidget {
  const CustomSeeDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF818AF9),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/image/cat_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 65,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0, // MediaQuery.of(context).size.height * 0.01,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        style: TextStyle(
                          color: Color(0XFFDEE1FE),
                          fontSize: 14,
                          fontFamily: 'Manrope',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Your ',
                          ),
                          TextSpan(
                            text: 'Catrine',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' will get \nvaccination',
                          ),
                          TextSpan(
                            text: ' tomorrow \nat 07.00 am!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      MediaQuery.of(context).size.height * 0.025,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: const Text(
                        'See details',
                        style: TextStyle(
                          color: Color.fromARGB(255, 245, 242, 242),
                          fontSize: 12,
                          fontFamily: 'Manrope',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
