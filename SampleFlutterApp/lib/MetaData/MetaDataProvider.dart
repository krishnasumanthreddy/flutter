import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:emfa/MetaData/MetaDataModel.dart';
import 'package:http/http.dart' as http;

class MetadataProvider
{
  Client client = Client();

  Future<Metadata> fetchMetadataFromApi() async
  {
    print("entered planet fetch");
    // final responce = await client.
    //       get("http://www.mocky.io/v2/5d66266334000083abf44a2b");

        //172.27.8.241
  // set up POST request arguments
  //String url = 'http://10.28.202.69/a/WebService.svc/Login';
  String url = 'http://172.27.8.241/a/WebService.svc/Login';
  
  Map<String, String> headers = {"Content-type": "application/json"};
  Map<String, String> body = {
      'AuthenticationToken': 'hlsAur4gFJ05vKEBF2edFSffMQLamGQfMjWmWBoSsd2aTN1NYOqJ0wDL5YM/pxxRkSDgmmJUpzS8G5fxhq0qLOB8j7YD3jyiBIDDHdP1AloYNU8A9Kchx/qyQVff3KFu84wYa3i52ncdCR1KA5hiETNrKp4LfXF00IKpVxspxaRngvtByHIzqMYRv4CKv4FS9qg+6xYGOP9At962HK6IUnIyNBW+OAZZQDGLMMdbnp2bgzrg/2VLGE1ApVwJz+HSINfVepEMHa+ByVuV1fvo5GUOc2+Cdo1mxVaPGkIiqL/VBt0wfOfysCSCXlm5tqrJIVZGq/+y/xHx3ljaAoxcyZXDa21AJjnn0UeceunbWhTl7ZIOkTprmpt5nvUeHhjlKS8UvvoO4xQ6TgtYNFMmYnnJD70JLByENS0UlYA6pdM=',
      'ClientVersion': '1.1.1.1'
    };
    
 String jsonString = json.encode(body); 
// http.post(url, body: jsonString).then((http.Response response) {
//     final int statusCode = response.statusCode;
 
//     if (statusCode < 200 || statusCode > 400 || json == null) {
//       throw new Exception("Error while fetching data");
//     }
    
//   });

   
    // var getResp = await http.get(url, headers: headers, body: jsonString);
  //String json = '{"AuthenticationToken": "hlsAur4gFJ05vKEBF2edFSffMQLamGQfMjWmWBoSsd2aTN1NYOqJ0wDL5YM/pxxRkSDgmmJUpzS8G5fxhq0qLOB8j7YD3jyiBIDDHdP1AloYNU8A9Kchx/qyQVff3KFu84wYa3i52ncdCR1KA5hiETNrKp4LfXF00IKpVxspxaRngvtByHIzqMYRv4CKv4FS9qg+6xYGOP9At962HK6IUnIyNBW+OAZZQDGLMMdbnp2bgzrg/2VLGE1ApVwJz+HSINfVepEMHa+ByVuV1fvo5GUOc2+Cdo1mxVaPGkIiqL/VBt0wfOfysCSCXlm5tqrJIVZGq/+y/xHx3ljaAoxcyZXDa21AJjnn0UeceunbWhTl7ZIOkTprmpt5nvUeHhjlKS8UvvoO4xQ6TgtYNFMmYnnJD70JLByENS0UlYA6pdM=","ClientVersion": "1.1.1.1"}' ;
   var responce =await http.post(url, headers: headers, body: jsonString);
   //Post.fromJson(json.decode(resp.body));
    //print(resp);


    print(responce.body.toString());
    if (responce.statusCode == 200)
    {
      return Metadata.fromJson(json.decode(responce.body));
    }
    else
    {
      throw Exception('Failed to load post');
    }
  }
}