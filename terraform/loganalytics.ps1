{
    "properties": {
        "schema": {
               "name": "dwilson_CL",
               "columns": [
        {
                                "name": "TimeGenerated",
                                "type": "DateTime"
                        }, 
                       {
                                "name": "RawData",
                                "type": "String"
                       }
              ]
        }
    }
 }
 '@
 Invoke-AzRestMethod -Path "/subscriptions/f70deb8c-0341-408c-bc49-bee8e476e697/resourcegroups/project3rg/providers/microsoft.operationalinsights/workspaces/loganalyticswrkspace01/
 tables/dwilson_CL?api-version=2021-12-01-preview" -Method PUT -payload 
 $tableParam