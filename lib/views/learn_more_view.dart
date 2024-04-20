import 'package:flutter/material.dart';

class LearnMore extends StatelessWidget {
  const LearnMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String learnMoreParagraph = '''
      Introducing our innovative and affordable solution designed to address the challenges faced by residential societies in India. Our comprehensive mobile application and camera system utilize cutting-edge image processing technology to seamlessly identify and monitor vehicles entering and exiting through the society's entry/exit gate. Unlike existing expensive solutions, our model caters specifically to the Indian market, offering an accessible and efficient means of enhancing security. The system distinguishes between resident and non-resident vehicles, sending instant notifications to vehicle owners and security personnel via a user-friendly mobile application. This solution not only tackles issues related to illegal parking and vehicle theft but also introduces features that elevate overall security, provide resident convenience, and offer valuable analytics for society management. Embrace the future of residential society security with our cost-effective and innovative approach. Learn more about the transformative impact our solution can bring to your community.
    ''';

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            learnMoreParagraph,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.5,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
