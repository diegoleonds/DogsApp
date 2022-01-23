import 'package:dogs_app/data/service/service.dart';
import 'package:flutter/material.dart';

class SubBreedDetailsArguments {
  final String subBreedName;
  final String breedName;

  SubBreedDetailsArguments(this.subBreedName, this.breedName);
}

class SubBreedDetails extends StatefulWidget {
  final SubBreedDetailsArguments arguments;
  const SubBreedDetails({Key? key, required this.arguments}) : super(key: key);

  static const routeName = '/subBreedDetails';

  @override
  createState() => _SubBreedDetailsState();
}

class _SubBreedDetailsState extends State<SubBreedDetails> {
  late Future<String> futureBreedImgUrl;

  @override
  void initState() {
    super.initState();
    var args = widget.arguments;
    futureBreedImgUrl = Service.getSubBreedImgUrl(args.breedName, args.subBreedName);
  }

  @override
  Widget build(BuildContext context) {
    var subBreedName = widget.arguments.subBreedName;
    return Scaffold(
        appBar: AppBar(
          title: Text(subBreedName),
        ),
        body: Center(
          child: FutureBuilder<String>(
              future: futureBreedImgUrl,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Image.network(snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
        ));
  }
}
