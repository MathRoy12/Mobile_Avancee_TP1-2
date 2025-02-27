import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_avancee_tp1_2/services/http_service.dart';
import 'package:mobile_avancee_tp1_2/widgets/my_drawer.dart';

import '../dto/transfer.dart';
import '../generated/l10n.dart';
import 'home_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});

  final int id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  XFile? pickedImage;
  String imageURL = "";
  bool isFabEnable = true;
  bool imgBtnIsEnable = true;
  bool isSaving = false;

  int? percentageDone;

  getImage() async {
    imgBtnIsEnable = false;
    setState(() {});

    ImagePicker picker = ImagePicker();
    pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      String res = await saveImage(pickedImage!, widget.id);
      imageURL = 'http://10.0.2.2:8080/file/$res?width=325';
    }

    imgBtnIsEnable = true;
    setState(() {});
  }

  void save() async {
    isSaving = true;
    setState(() {});
    try {
      await saveProgress(widget.id, percentageDone!);
      navigateToHome();
    } on DioException {
      isSaving = false;
      setState(() {});
      showSnackBar(S.current.globalError);
    }
  }

  void navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  }

  Future<TaskDetailPhotoResponse> getDetail() async {
    try {
      return await getTaskDetail(widget.id);
    } on DioException {
      showSnackBar(S.current.taskNotFound);
      isFabEnable = false;
      imgBtnIsEnable = false;
      return TaskDetailPhotoResponse();
    }
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).detail),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<TaskDetailPhotoResponse>(
              future: getDetail(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TaskDetailPhotoResponse item = snapshot.data!;
          
                  percentageDone ??= item.percentageDone;
          
                  if (item.photoId > 0) {
                    imageURL = 'http://10.0.2.2:8080/file/${item.photoId}?width=325';
                  }
                  return buildBody(item, context);
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: !isSaving && isFabEnable ? save : null,
        child: const Icon(Icons.save),
      ),
    );
  }

  Container buildBody(TaskDetailPhotoResponse item, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.name,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
              "${S.of(context).deadline}: ${DateFormat(S.current.dateFormat).format(item.deadline)} (${item.percentageTimeSpent}%)"),
          const SizedBox(height: 20),
          Text(S.of(context).percentageDoneDetail),
          Slider(
              value: percentageDone!.toDouble(),
              max: 100,
              divisions: 100,
              label: '${percentageDone!}',
              onChanged: (value) {
                percentageDone = value.round();
                setState(() {});
              }),
          buildImageSection(),
          isSaving ? const LinearProgressIndicator() : const SizedBox(),
        ],
      ),
    );
  }

  Column buildImageSection() {
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: (imageURL == "")
              ? const Icon(
                  Icons.add,
                  color: Colors.grey,
                  size: 70,
                )
              : CachedNetworkImage(
                  imageUrl: imageURL,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
        ),
        MaterialButton(
          onPressed: imgBtnIsEnable ? getImage : null,
          color: Colors.blue,
          child: Text(
            S.of(context).selectImage,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
