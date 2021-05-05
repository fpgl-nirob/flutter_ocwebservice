# ocwebservice

 Flutter API calling package 
## Getting Started
# Add Package into your project

## Basic api response structure 
```json
//Suppose a URL(http://www.mysimple.com/api/sayhello) return bellow response.
  {
    "success": true,
    "message": "request successful",
    "data": {
              "email": "me@webapi.com",
              "name": "JOWEL"
            }
  }
// This is basic structure for API response, data can be a list or dictionary.   
```
## Code Example

First create a model class 
 ```dart
        class SimpleModel {
            String name;
            String email;
    
            SimpleModel({this.name,this.email});
    
            //Create Factory method for make instance from Dic
            factory SimpleModel.fromJson(Map<String,dynamic> dic) {
                return SimpleModel(name: dic['name', email: dic['email']]);
            }
        }
```
Next, create APIResponse class . For that every api response class need to extends OCAPIResponse<M> class where M is Model class 
```dart
      //when data is a List of Dictionary/map
      class SimpleAPIResponse extends OCAPIResponse<List<SimpleModel>> {
        @override
          List<SimpleModel> convertDataToModel(data) {
           // here data is now a list of map
            List<SimpleModel> simpleModelList = List<SimpleModel>();
            List<dynamic> dataList = data;
           // so, let's cast it & loop through the map 
           // convert the map into SimpleModel object & Add into list
            dataList.forEach((element){
              simpleModelList.add(SimpleModel.fromJson(data));
            });
           
            return simpleModelList; // 
          }
      }

      //when data is a Dictionary/map
      class SimpleAPIResponse extends OCAPIResponse<SimpleModel> {
        @override
          SimpleModel convertDataToModel(data) {
            // create model instance from data and return model instance
            return SimpleModel.fromJson(data); // in api response , data is Dictionary. 
            // It can be a list also 
          }
      } 
```  
Now let's create an API EndPoint for (http://www.mysimple.com/api/sayhello) url. Here,
'http://www.mysimple.com/api/' this is base api url 
'sayhello' is path
A standard structure of EndPoint be path, requestType, body params if post request, headers
Let's see How can we make a SayHelloEndPoint by extends OCEndPoint class 
```dart
 OCEndPoint sayHelloEndPoint = OCEndPoint(path: "sayhello",requestType: OCRequestType.POST,needAuth: false);
//It has few more parameters, Please check OCEndPoint class
``` 


