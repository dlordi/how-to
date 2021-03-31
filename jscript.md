# JScript

## Accesso a datasource ODBC tramite oggetti COM

```js
var conn = new ActiveXObject('ADODB.Connection');
conn.Open('nome_connessione_odbc');

var recordSet = new ActiveXObject('ADODB.RecordSet');
recordSet.Open("select campo from tabella where campo like 'a%'", conn);

recordSet.MoveFirst();
while (!recordSet.EOF) {
  var campo = recordSet.Fields.Item('campo').Value;
  recordSet.MoveNext();
}

recordSet.Close();
conn.Close();
```
