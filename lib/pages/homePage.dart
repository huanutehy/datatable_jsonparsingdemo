import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:datatable_jsonparsingdemo/provider/myHomePageProvider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Demo Data Table - Json parsing and provider Flutter'),
      ),
      body: ChangeNotifierProvider<MyHomePageProvider>(
        create: (context) => MyHomePageProvider(),
        child: Consumer<MyHomePageProvider>(
          builder: (context, provider, child) {
            // TODO :: Let's go create a json file firt....
            if (provider.data == null) {
              provider.getData(context);
              return Center(child: CircularProgressIndicator());
            }
            //khi chúng ta đã tải json .... hãy đặt dữ liệu int vào một widget bảng
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,

       // Tiện ích bảng dữ liệu ở dạng không cuộn được nên chúng ta phải bọc nó ở dạng xem cuộn khi chúng ta có tập dữ liệu lớn ..
              child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text('Verified'),
                      tooltip: 'represents if user is verified.'),
                  DataColumn(
                      label: Text('First Name'),
                      tooltip: 'represents first name of the user'),
                  DataColumn(
                      label: Text('Last Name'),
                      tooltip: 'represents last name of the user'),
                  DataColumn(
                      label: Text('Email'),
                      tooltip: 'represents email address of the user'),
                  DataColumn(
                      label: Text('Phone'),
                      tooltip: 'represents phone number of the user'),
                ],
                rows: provider.data.results
                    .map((data) =>
                // we return a DataRow every time
                DataRow(
                  // List<DataCell> cells is required in every row
                    cells: [
                      DataCell((data.verified)
                          ? Icon(
                        Icons.verified_user,
                        color: Colors.green,
                      )
                          : Icon(Icons.cancel, color: Colors.red)),
                      // I want to display a green color icon when user is verified and red when unverified
                      DataCell(Text(data.firstName)),
                      DataCell(Text(data.lastName)),
                      DataCell(Text(data.email)),
                      DataCell(Text(data.phone)),
                    ]))
                    .toList(),
              ),
            )
            ,
            );
          },
        ),
      ),
    );
  }
}
