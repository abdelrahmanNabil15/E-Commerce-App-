import 'package:circular_check_box/circular_check_box.dart';
import 'package:e_commerce/view/auth/widgets/RadioModel.dart';
import 'package:e_commerce/view/auth/widgets/constance.dart';
import 'package:e_commerce/view/auth/widgets/custom_buttton.dart';
import 'package:e_commerce/view/auth/widgets/custom_text.dart';
import 'package:e_commerce/view/auth/widgets/custom_textForm.dart';
import 'package:flutter/material.dart';
import 'package:progress_timeline/progress_timeline.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

enum SingingCharacter { Standard, NextDay, Nominated }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final itemsList = List<String>.generate(6, (n) => "List item ${n}");
  List<Step> get _steps => <Step>[
        _lastQualificationStep(),
        Step(
          isActive: _currentStep == 1,
          state: _currentStep == 1 ? StepState.editing : StepState.indexed,
          title: const Text('Address'),
          content: _Address(),
        ),
        Step(
          state: _currentStep == 1 ? StepState.editing : StepState.indexed,
          title: const Text('Summer'),
          isActive: _currentStep == 2,
          content: Summary(),
        ),
      ];
  int _currentStep = 0;
  bool _isStepsCompleted = false;

  @override
  void initState() {
    super.initState();
    //_steps.add(_lastQualificationStep());
  }

  void onStepContinue() {
    _currentStep + 1 != _steps.length
        ? onStepTapped(_currentStep + 1)
        : setState(() => _isStepsCompleted = true);
    print(_currentStep);
  }

  void onStepTapped(int step) => setState(() => _currentStep = step);

  void onStepCancel() {
    if (_currentStep > 0) {
      onStepTapped(_currentStep - 1);
    }
  }

  void setSelectRadioButton(int value, int groupValue) {
    print('Radio Value: $value');
    print('GroupValue before setState: $groupValue');
    setState(() {
      _qualificationRadioGroupValue = value;
    });
    print('GroupValue after setState: $groupValue');
  }

  int _qualificationRadioGroupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            SizedBox(
              width: 115,
            ),
            customText(
              text: "Checkout",
              color: Colors.black,
              fontSize: 20,
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Stepper(
            steps: _steps,

            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepTapped: (step) => onStepTapped(step),
            onStepContinue: onStepContinue,
            onStepCancel: onStepCancel,
          ),
        ],
      ),
    );
  }

  Step _lastQualificationStep() {
    List<RadioModel> qualifitcationList = [
      RadioModel(
          superTitle: 'Standard Delivery',
          title: 'Order will be delivered between 3 - 5 business days',
          value: 0,
          groupValue: _qualificationRadioGroupValue),
      RadioModel(
          superTitle: 'Next Day Delivery',
          title:
              'Place your order before 6pm and your items will be delivered the next day',
          value: 1,
          groupValue: _qualificationRadioGroupValue),
      RadioModel(
          superTitle: 'Nominated Delivery',
          title:
              'Pick a particular date from the calendar and order will be delivered on selected date',
          value: 2,
          groupValue: _qualificationRadioGroupValue),
    ];
    return Step(
      title: Text("Delivery"),
      isActive: _currentStep == 0,
      state: _currentStep == 0 ? StepState.editing : StepState.indexed,
      content: Column(
        children: qualifitcationList
            .map(
              (qualification) => Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: customText(
                      text: qualification.superTitle,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(qualification.title),
                        padding: EdgeInsets.all(10),
                        height: 60,
                        width: 290,
                      ),
                      Radio(
                          value: qualification.value,
                          groupValue: _qualificationRadioGroupValue,
                          onChanged: (value) => setSelectRadioButton(
                              value, qualification.groupValue)),
                    ],
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _Address() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: primaryColor,
              ),
              customText(
                  text: 'Billing address is the same as delivery address')
            ],
          ),
          SizedBox(height: 20,),
          CustomTextForm(
            text: 'Street 1',
            hint: '21, Alex Davidson Avenue',
          ),
          SizedBox(height: 20,),
          CustomTextForm(
            text: 'Street 2',
            hint: 'Opposite Omegatron, Vicent Quarters',
          ),
          SizedBox(height: 20,),
          CustomTextForm(
            text: 'City',
            hint: 'Victoria Island',
          ),
          SizedBox(height: 20,),
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: <Widget>[
              Container(
                width:153,
              height: 70,
                child: CustomTextForm(
                  text: 'State',
                  hint: 'Lagos State',
                ),
              ),
              Container(
                width: 153,
                height: 70,

                child: CustomTextForm(
                  text: 'Country',
                  hint: 'Nigeria',
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget Summary(){
    return Container(
      child:Column(

        children: [
          SizedBox(
            height: 176,
            child: ListView.separated( scrollDirection: Axis.horizontal,
                itemCount: itemsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(

                        height: 120,
                        width: 120,
                        child: Image.network('https://icon-library.com/images/small-facebook-icon-for-website/small-facebook-icon-for-website-13.jpg'),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      customText(
                        text: 'Tag Heuer...'
                      ),
                      customText(
                        text: "5665"+
                            " \$",
                        color: primaryColor,
                        alignment: Alignment.bottomLeft,
                      ),
                    ],
                  );
                }, separatorBuilder: (context, index) => SizedBox(
        width: 10,
      ),),
          ),
          customText(
            text:'Shipping Address' ,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 286,
            height: 78,
            child: customText(
              text:'21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria' ,
              fontSize: 14,

            ),
          ),


        ],
      ) ,



    );






  }
}
