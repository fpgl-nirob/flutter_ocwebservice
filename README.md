# ocwebservice

 Flutter API calling package 
## Getting Started
#Add Package into your project

##Basic api response structure 
```json
  {
    "success": true,
    "message": "request successful",
    "data": {
              "email": "me@webapi.com",
              "name": "JOWEL"
            }
  }
```
##Code Example

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
      class SimpleAPIResponse extends OCAPIResponse<SimpleModel> {
        @override
          SimpleModel convertDataToModel(data) {
            // create model instance from data and return model instance
            
          }
      } 
```  



