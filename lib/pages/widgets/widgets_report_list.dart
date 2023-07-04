import 'package:api_integration/Api/getApi.dart';
import 'package:flutter/material.dart';

import '../../Models/usermodel.dart';

class WidgetReportList extends StatefulWidget {
  @override
  _WidgetReportListState createState() => _WidgetReportListState();
}

class _WidgetReportListState extends State<WidgetReportList> {
  getApi? apiService;

  @override
  void initState() {
    super.initState();
    apiService =  getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              "User List",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _fetchData()
        ],
      ),
    );
  }

  Widget _fetchData() {
    return FutureBuilder<DataModel>(
      future: getApi.getUsers(),
      builder: (BuildContext context, AsyncSnapshot<DataModel> snapshot) {
        if (snapshot.hasData) {
          return _buildDataTable(snapshot.data!);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildDataTable(DataModel dataModel) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text(
            "Name",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            "Email",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
      sortColumnIndex: 1,
      rows: dataModel.data!
          .map(
            (data) => DataRow(
              cells: <DataCell>[
                DataCell(Row(
                  children: [
                    Image.network(
                      data.avatar!,
                      width: 30,
                      height: 30,
                    ),
                  
                      
                      Text(
                        data.firstName! + " " + data.lastName!,
                        style: TextStyle(fontSize: 13),
                      ),
                    
                  ],
                )),
                DataCell(
                  Text(
                    data.email!,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}