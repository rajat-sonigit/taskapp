import 'package:get/get.dart';
import 'package:taskmanger/widgets/service.dart';

class DataControllers extends GetxController {
  DataService service = DataService();
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  bool _isLoading = false;
  Future<void> getData() async {
    Response response = await service.getData();
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got data");
      update();
    } else {
      print("we dont get data");
    }
  }
}
