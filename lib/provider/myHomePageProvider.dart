import 'package:datatable_jsonparsingdemo/model/myData.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class MyHomePageProvider extends ChangeNotifier {
  MyData data;

  Future getData(context) async {
    // Bạn có thể gọi một API để lấy dữ liệu, sau khi chúng tôi có dữ liệu từ API hoặc bất kỳ luồng nào khác .... Phần sau sẽ giống như vậy.   //We forgot  about  one more import part... lest do that firt
    // Chúng tôi cần quyền truy cập BuildContext để tải chuỗi này và bạn không nên lưu trữ ngữ cảnh này trong bất kỳ biến nào tại đây// trong trình thông báo thay đổi ..
    var response = await DefaultAssetBundle.of(context).loadString('assets/raw/myJson.json');
    // bây giờ chúng ta có phản hồi dưới dạng Chuỗi từ json cục bộ hoặc và yêu cầu API ...
    var mJson = json.decode(response);
   // bây giờ chúng ta có một json ...
    this.data = MyData.fromJson(mJson);
    this.notifyListeners(); // for callback to view
  }
}
