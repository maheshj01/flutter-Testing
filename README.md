# Flutter Testing using BDD

A Sample Flutter project showing Bloc Architecture and BDD Testing using Gherkins plugin.


 - Clone the project
 - Run ```flutter pub get```
 - Run the tests using ```dart test_driver/test_config.dart```

<img src="https://user-images.githubusercontent.com/31410839/62053001-52e08480-b234-11e9-8a8f-ae3a8d702795.gif">
<img src="https://user-images.githubusercontent.com/31410839/62713547-8c767400-ba1a-11e9-8138-f78bc5124719.gif">


### Medium :https://medium.com/@maheshmnj/testing-your-flutter-app-f08ebc54beb9

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Flutter Folder Structure
<h4>
📁 android<br>
📁 build<br>
📁 ios<br>
📁 <b>assets</b><br>
 > > 📁 fonts<br>
 >  >  > 📑 Raleway-Regular.ttf<br>
 >  >  > 📑 Raleway-Italic.ttf<br>
 > > 📁 <b>images</b><br>
 >  >  > 🖼️ image1.jpg<br> 
 >  >  > 🖼️ image2.jpg<br> 
 > > 📁 <b>icons</b> <br>
 >  >  > 🖼️ cloudicon.png<br>
 >  >  > 🖼️ thumbsupicon.png<br> 
📁 <b>lib</b><br>
 > 📁 <b>bloc</b><br>
 > > 📑 home_page_bloc.dart<br>
 > > 📑 login_page_bloc.dart<br> 
 > 📁 <b>services</b><br>
  > > 📁 sqflite<br>
  > > 📁 api_manager<br>
 > 📁 <b>pages</b><br>
 > > 📑 home_page.dart<br>
 > > 📑 login_page.dart<br> 
 > 📁 <b>models</b><br>
 > > 📑 user_model.dart<br>
 > > 📑 sample_model.dart<br>
 > 📁 <b>widgets</b><br>
 >  > 📑 circular_button_widget.dart<br>
 >  > 📑 common_widget.dart<br>
 > 📁 <b>test</b><br>
 >  > 📑 homepagewidget.dart<br>
 >  > 📑 custombuttonwidget.dart<br>
 > 📁 <b>test_driver</b><br>
 >  > 📁 features <br>  
 >  >  > 📑 login.feature<br>
 >  >  > 📑 home.feature<br>
 >  > 📁 steps <br>  
 >  >  > 📑 loginstep.dart<br>
 >  > 📑 test_config.dart<br> 
 > 📁 <b>const</b> <br>
 > > 📑 color_const.dart<br>
 > > 📑 string_const.dart<br>    
 🐳 <b>docker</b><br>
 📑 <b>jenkins</b><br>
 📑 <b> pubspec.yaml<br>
 📑 <b> Readme.md </h4>
  
  --------------------------------------------------------------# Summary #-------------------------------------------------------------


 ## 📁 BLOC
 we use this folder to manage the state of our widgets across screens. each file in the bloc folder should correspond to a specific page data must flow through pages-->bloc-->services-->models-->pages(ui)

 ## 📁 Services
   - 📁 Sqflite 
       - this folder will contain all the database related stuff CRUD irrespective of the type of database
       
   - 📁 api_manager
       - here we do all the api requests and http calls.

## 📁 Pages 
 - this folder contains all the frontend pages of your application 

## 📁 widgets
 - In this folder we write the custom widgets,that we have to reuse in mutiple pages

## 📁 models
 - here you write all your pojo/model classes to pass the data objects across screens 

## 📁 test (TDD)
 - this folder is by default created by flutter sdk when we create a new project here we do the widget testing  
## 📁 test_driver (BDD)
  >  > 📁 steps <br>
 - here we have to write the steps to implement the feature files 
  >  > 📁 features    
 - this file contains the features in the gherkins language for the bdd 

## 📁 const
 - this folder contains some string and color files to use them at mutiple places inorder to keep the code clean and have some meaningful strings and colors in the code.

  
