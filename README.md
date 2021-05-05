# ocwebservice

 Flutter API calling package 
## Getting Started
#Add Package into your project


##Code Example
 #Create a Model class first
        class SimpleModel {
            String name;
            String email;
    
            SimpleModel({this.name,this.email});
    
            //Create Factory method for make instance from Dic
            factory SimpleModel.fromJson(Map<String,dynamic> dic) {
                return SimpleModel(name: dic['name', email: dic['email']]);
            }
        }



