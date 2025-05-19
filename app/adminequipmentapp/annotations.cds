using AdminService as service from '../../srv/AdminService';

annotate service.Equipments with @(
    UI.LineItem:[{
    $Type : 'UI.DataField',
    Label :  'Name',
    Value : name, 
    },
    {
      $Type : 'UI.DataField',
    Label :  'Type',
    Value : type.name
    },
     {
      $Type : 'UI.DataField',
    Label :  'Manufacturing',
    Value :  manufacturing
    },
     {
      $Type : 'UI.DataField',
    Label :  'Description',
    Value :  description
    },
    {
      $Type : 'UI.DataField',
    Label :  'Status',
    Value : status_EquipmentCode,
        Criticality : status.colorCode,
    }
    
    ],
    UI.SelectionFields : [
        type_code,
        status.EquipmentCode,
    ],
    UI.DataPoint #status_EquipmentCode : {
        $Type : 'UI.DataPointType',
        Value : status_EquipmentCode,
        Title : 'status_EquipmentCode',
    },
    UI.DataPoint #type_code : {
        $Type : 'UI.DataPointType',
        Value : type_code,
        Title : 'type_code',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'status_EquipmentCode',
            Target : '@UI.DataPoint#status_EquipmentCode',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'type_code',
            Target : '@UI.DataPoint#type_code',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Equipment Details',
            ID : 'EquipmentDetails',
            Target : '@UI.FieldGroup#EquipmentDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Equipment Task Details',
            ID : 'EquipmentTaskDetails',
            Target : 'tasks/@UI.LineItem#EquipmentTaskDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Issue Details',
            ID : 'IssueDetails',
            Target : 'issues/@UI.LineItem#IssueDetails',
        },
    ],
    UI.FieldGroup #EquipmentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : 'Name',
            },
            {
                $Type : 'UI.DataField',
                Value : status_EquipmentCode,
                Label : 'Status',
            },
            {
                $Type : 'UI.DataField',
                Value : location_locationId,
                Label : 'Location',
            },
            {
                $Type : 'UI.DataField',
                Value : manufacturing,
                Label : 'Manufacturing',
            },
            {
                $Type : 'UI.DataField',
                Value : type_code,
                Label : 'Type',
            },
            {
                $Type : 'UI.DataField',
                Value : description,
                Label : 'Description',
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
        ],
    },


) ;
annotate service.Equipments with {
    type @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'EquipmentTypes',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : type_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Equipment Type',
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.EquipmentTypes with {
    code @Common.Text : name
};

annotate service.EquipmentStatus with {
    EquipmentCode @(
        Common.Label : 'status/EquipmentCode',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'EquipmentStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : EquipmentCode,
                    ValueListProperty : 'EquipmentCode',
                },
            ],
            Label : 'Equipment Status',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : name,
    )
};

annotate service.Equipments with @(
  UI.HeaderInfo: {
    TypeName: 'Equipments',
    TypeNamePlural : 'Equipments',
    Title : {
    $Type : 'UI.DataField',
    Value : name
    }
  }

);

annotate service.Tasks with @(
    UI.LineItem #EquipmentTaskDetails : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : dueDate,
            Label : 'Due Date',
        },
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Label : 'Priority',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : assignedTo.name,
            Label : 'name',
        },
    ]
);

annotate service.Issues with @(
    UI.LineItem #IssueDetails : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'description',
        },
        {
            $Type : 'UI.DataField',
            Value : issueStatus_statusCode,
            Label : 'issueStatus_statusCode',
        },
        {
            $Type : 'UI.DataField',
            Value : reportedBy_ID,
            Label : 'reportedBy_ID',
        },
    ]
);

