import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Harish Auction',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Harish Auction',style: TextStyle(fontSize: 25),)
      ),
      ),
      body:

      Center(
       child: new SizedBox(
          width: 200.0,
          height: 100.0,
        child: RaisedButton(

          child: Text('Cricket Auction',style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
          color: Color(0xff0091EA),
          textColor: Colors.white,
          splashColor: Colors.grey,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Details()),

            );
          },
        ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(

      title: appTitle,

      home: Scaffold(

         appBar: AppBar(

          title: Center(
             child:Text('User Deatils'),
          )
         ),

        body: MyCustomForm(),

      ),

    );

  }

}


class MyCustomForm extends StatefulWidget {

  @override

  MyCustomFormState createState() {

    return MyCustomFormState();

  }

}

class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey we created above

    return SingleChildScrollView(

      child: Form(

        key: _formKey,

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Padding(

              padding:

              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 19.0),

              child: Column(

                children: [



                  TextFormField(

                    decoration: InputDecoration(

                        hintText: "First Name", labelText: "First Name"),

                    validator: (value) {

                      if (value.isEmpty) {

                        return 'Please enter some text';

                      }

                    },

                  ),

                  TextFormField(

                    decoration: InputDecoration(

                        hintText: "Last Name", labelText: "Last Name"),

                    validator: (value) {

                      if (value.isEmpty) {

                        return 'Please enter some text';

                      }

                    },

                  ),

                  TextFormField(

                    decoration: InputDecoration(

                        hintText: "Phone Number", labelText: "Phone Number"),

                    validator: (value) {

                      if (value.isEmpty) {

                        return 'Please enter some text';

                      } else if (!isNumeric(value)) {

                        return 'Please enter a valid Phone number';

                      }

                    },

                  ),

                  TextFormField(

                    decoration: InputDecoration(

                        hintText: "Address", labelText: "Address"),

                    maxLines: 4,

                    validator: (value) {

                      if (value.isEmpty) {

                        return 'Please enter some text';

                      }

                    },

                  ),

                  Padding(

                    padding: const EdgeInsets.symmetric(

                        horizontal: 10.0, vertical: 16.0),

                    child: RaisedButton(
                      child: Text('Submit',style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                      color: Color(0xff0091EA),
                      textColor: Colors.white,
                      splashColor: Colors.grey,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {

                        // Validate will return true if the form is valid, or false if

                        // the form is invalid.

                        if (_formKey.currentState.validate()) {

                          // If the form is valid, we want to show a Snackbar

                          Scaffold.of(context)

                              .showSnackBar(SnackBar(

                            content: Text('Processing Data'),

                          ))

                              .closed

                              .then((SnackBarClosedReason reason) {

                            _opennewpage();

                          });

                        }

                      },

                    ),

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

  void _opennewpage() {

    Navigator.of(context).push(

      new MaterialPageRoute(

        builder: (BuildContext context) {

          Map<String, bool> values = {
            'Manish Pandey': false,
            'Prithvi Shaw': false,
            'Shikhar Dhawan': false,
            'Shreyas Iyer': false,
            'Shubman Gill': false,
            'Virat Kohli (C)': false,
            'MS Dhoni': false,
            'Hardik Pandya': false,
            'Ravindra Jadeja': false,
            'Jasprit Bumrah': false,
            'Navdeep Saini': false,
            'Darren Bravo': false,
            'Evin Lewis': false,
            'Sunil Ambris': false,
            'Shimron Hetmyer': false,
            'Carlos Brathwaite': false,
            'Chris Gayle': false,
            'Fabian Allen': false,
            'Jason Holder': false,
            'Shai Hope': false,
            'Kemar Roach': false,
            'Oshane Thomas': false,

          };
          return new Scaffold(
            appBar: new AppBar(title: new Text('Players List')),
            body: Container(
            child:new ListView(
              children: values.keys.map((String key) {
                return new CheckboxListTile(
                  title: new Text(key),
                  value: values[key],
                  onChanged: (bool value) {
                    setState(() {
                      values[key] = value;
                    });
                  },
                );

              }).toList(),
            ),

          ),

          );
        },

      ),

    );

  }

}


bool isNumeric(String s) {

  try {

    return double.parse(s) != null;

  } catch (e) {

    return false;

  }

}