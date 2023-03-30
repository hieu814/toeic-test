import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/models.dart';
import '../../utils/constant.dart';
import '../../widgets/widgets.dart';

class Vocabulary extends StatelessWidget {
  const Vocabulary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GroupVocabularies vocabularies =
        Get.arguments ?? GroupVocabularies(vocabularies: []);
    List<Vocabularies> vocabulary = vocabularies.vocabularies ?? [];
    return Scaffold(
        appBar: AppBar(
          title: Text(vocabularies.title ?? ""),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: vocabulary.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ListTile(
                  leading: const FlutterLogo(),
                  title: Text(vocabulary[index].getWord()),
                ),
                onTap: () async {
                  Get.to(VocabularyDetail(
                    index: index,
                    vocabulary: vocabularies,
                  ));
                },
              );
            },
          ),
        ));
  }
}

class VocabularyDetail extends StatefulWidget {
  final GroupVocabularies vocabulary;
  final int index;
  const VocabularyDetail({
    Key? key,
    required this.vocabulary,
    required this.index,
  }) : super(key: key);

  @override
  State<VocabularyDetail> createState() => _VocabularyDetailState();
}

class _VocabularyDetailState extends State<VocabularyDetail> {
  int currentIndex = 0;
  Vocabularies currentVocabulary = Vocabularies();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    currentVocabulary = widget.vocabulary.vocabularies![currentIndex];
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    currentVocabulary.word ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                Text(
                  currentVocabulary.type ?? "",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          MyAudioPlayer(
            width: 50,
            height: 50,
            audioData: currentVocabulary.audio,
            isVocabulary: true,
          )
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget textSection = Padding(
      padding: const EdgeInsets.all(32),
      child: HtmlText(text: currentVocabulary.description ?? ""),
    );
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vocabulary.title ?? ""),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(20)),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: FlipCard(
                  key: cardKey,
                  flipOnTouch: false,
                  fill: Fill
                      .fillBack, // Fill the back side of the card to make in the same size as the front.
                  direction: FlipDirection.HORIZONTAL, // default
                  front: Card(
                    child: Column(children: [
                      MyImage(
                        image: currentVocabulary.image,
                      ),
                      titleSection,
                    ]),
                  ),
                  back: Card(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            currentVocabulary.word ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                        ),
                        Text(
                          '(${currentVocabulary.type ?? ""})',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            currentVocabulary.translate ?? "",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                        textSection,
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    int index = currentIndex - 1;
                    if (index >= 0) {
                      setState(() {
                        currentIndex = index;
                      });
                    }
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    cardKey.currentState!.toggleCard();
                  },
                  child: const Text('Flip'),
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    int index = currentIndex + 1;
                    if (index < widget.vocabulary.vocabularies!.length) {
                      setState(() {
                        currentIndex = index;
                      });
                    }
                  },
                  child: const Text('Next'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    // onPrimary: Colors.black87,
    // primary: Colors.grey[300],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  Column _buildButtonColumn(
      Color color, IconData icon, String label, Function() onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    offset: Offset(2.0, 2.0))
              ]),
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
