using AdminService as service from '../../srv/AdminService';

annotate service.Equipments with @(
    UI.LineItem :[{
    $Type : 'UI.DataField',
    Label : 'Name',
    Value : name
    },
        {
            $Type : 'UI.DataField',
            Value : type.name,
            Label : 'Equipment Type',
        },{
    $Type : 'UI.DataField',
   Label : 'Manufacturing',
    Value : manufacturing
    },
    {
    $Type : 'UI.DataField',
    Label : 'Description',
    Value : description
    },{
    $Type : 'UI.DataField',
    Label : 'Status',
    Value : status_EquipmentCode,
        Criticality : status.colorCode,
    },

    ],
    UI.SelectionFields : [
        type_code,
        status_EquipmentCode,
    ],
    UI.HeaderFacets : [
        
    ],
    UI.FieldGroup #Equipmentdetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'ID',
    },
    UI.DataPoint #name : {
        $Type : 'UI.DataPointType',
        Value : name,
        Title : 'name',
    },
    UI.DataPoint #manufacturing : {
        $Type : 'UI.DataPointType',
        Value : manufacturing,
        Title : 'manufacturing',
    },
    UI.DataPoint #type_code : {
        $Type : 'UI.DataPointType',
        Value : type_code,
        Title : 'type_code',
    },
    UI.DataPoint #status_EquipmentCode : {
        $Type : 'UI.DataPointType',
        Value : status_EquipmentCode,
        Title : 'status_EquipmentCode',
    },
    UI.DataPoint #createdAt : {
        $Type : 'UI.DataPointType',
        Value : createdAt,
        Title : 'createdAt',
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Equipmemt Details',
            ID : 'EquipmemtDetails',
            Target : '@UI.FieldGroup#EquipmemtDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Equipment-Tasklist',
            ID : 'EquipmentTasklist',
            Target : 'tasks/@UI.LineItem#EquipmentTasklist',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Issues',
            ID : 'Issues',
            Target : 'issues/@UI.LineItem#Issues',
        },
    ],
    UI.FieldGroup #EquipmemtDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : manufacturing,
                Label : 'manufacturing',
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : type_code,
            },
            {
                $Type : 'UI.DataField',
                Value : status_EquipmentCode,
            },
            {
                $Type : 'UI.DataField',
                Value : location_locationId,
            },
            {
                $Type : 'UI.DataField',
                Value : location.name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : status.name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
        ],
    },
);

annotate service.Equipments with {
    type @(
        Common.Label : 'Equipment Type',
        Common.Text : status_EquipmentCode,
        Common.ValueList : {
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
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.EquipmentTypes with {
    code @Common.Text : name
};

annotate service.Equipments with {
    status @(
        Common.Label : 'Equipment Status',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'EquipmentStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_EquipmentCode,
                    ValueListProperty : 'EquipmentCode',
                },
            ],
            Label : 'Equipment Status',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.EquipmentStatus with {
    EquipmentCode @Common.Text : name
};

annotate service.Locations with @(
    UI.DataPoint #name : {
        $Type : 'UI.DataPointType',
        Value : name,
        Title : 'name',
    }
);
annotate service.Equipments with @(
   UI.HeaderInfo:{
    TypeName : name,
    TypeNamePlural : 'name',
    Title : {
        $Type : 'UI.DataField',
        Value : name
    }   
   }

) ;
annotate service.Tasks with @(
    UI.LineItem #EquipmentTasklist : [
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
            Value : status_code,
            Label : 'status_code',
        },
        {
            $Type : 'UI.DataField',
            Value : assignedTo.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Label : 'priority_code',
        },
    ]
);

annotate service.Issues with @(
    UI.LineItem #Issues : [
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
            Value : issueStatus_statusCode,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : reportedBy_ID,
            Label : 'Reported By',
        },
    ]
);

