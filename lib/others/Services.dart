
import 'package:http/http.dart' as http;
import 'DataTokoh.dart';

class Services{

  static const String url='https://raw.githubusercontent.com/alvienadd/newalbumtwice/master/lib/models/datatokoh.json';

  static Future<List<DataTokoh>> getDataTokoh() async{
    try{
      final response=await http.get(url);
      if(200==response.statusCode){
        final List<DataTokoh> tokoh=DataTokohFromJson(response.body);
        return tokoh;
      }else{
        return List<DataTokoh>();
      }
    }catch(e){
      return List<DataTokoh>();
    }
  }
}