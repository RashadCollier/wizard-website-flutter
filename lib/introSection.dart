import 'package:flutter/cupertino.dart';
import 'package:wizard_website/styles.dart';

class IntroSection extends StatefulWidget {
  const IntroSection({super.key});

  @override
  State<IntroSection> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<IntroSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Introduction",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Filmography",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Television",
                      style: ThemeText.descriptor,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rashad is a captivating and dedicated actor, renowned for his exceptional talent and unwavering commitment to the craft. With a passion for storytelling, professional training in the field of acting, and a profound understanding of facial/body awareness from years of modeling, Rashad has consistently delivered outstanding performances in a variety of mediums, from film and television to commercial and voice acting.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

// Filmography Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Oatly's/MiLB, Blue Cross Blue Shield, Lifesaver's, Coors Light, Street Fighter 6, and more.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

// Television Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "List of television series you've been a part of, including roles and airing years.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
