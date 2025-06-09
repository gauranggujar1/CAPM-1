using EmployeeService as service from '../../srv/EmployeeService';
annotate service.MyTasks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'dueDate',
                Value : dueDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'priority_code',
                Value : priority_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status_code',
                Value : status_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Task Details',
            ID : 'TaskDetails',
            Facets : [
                {
                    $Type : 'UI.CollectionFacet',
                    Label : 'Task Info',
                    ID : 'TaskInfo',
                    Facets : [
                        {
                            $Type : 'UI.ReferenceFacet',
                            Label : 'Task Details',
                            ID : 'TaskDetails1',
                            Target : '@UI.FieldGroup#TaskDetails',
                        },
                        {
                            $Type : 'UI.ReferenceFacet',
                            Label : 'Equipment Details',
                            ID : 'EquipmentDetails',
                            Target : '@UI.FieldGroup#EquipmentDetails1',
                        },
                        {
                            $Type : 'UI.ReferenceFacet',
                            Label : 'My Issues',
                            ID : 'MyIssues',
                            Target : 'issues/@UI.LineItem#MyIssues',
                        },
                    ],
                },
            ],
        },
    ],
    UI.LineItem : [
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
            Value : dueDate,
            Label : 'dueDate',
        },
        {
            $Type : 'UI.DataField',
            Value : equipment.name,
        },
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Label : 'priority_code',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'status_code',
        },
    ],
    UI.FieldGroup #TaskInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
        ],
    },
    UI.FieldGroup #EquipmentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.FieldGroup #TaskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
        ],
    },
    UI.FieldGroup #EquipmentDetails1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : equipment.name,
            },
            {
                $Type : 'UI.DataField',
                Value : equipment.manufacturing,
                Label : 'manufacturing',
            },
            {
                $Type : 'UI.DataField',
                Value : equipment.description,
                Label : 'description',
            },
            {
                $Type : 'UI.DataField',
                Value : equipment.location_locationId,
            },
        ],
    },
);

annotate service.MyTasks with {
    priority @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'TaskPriority',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : priority_code,
                ValueListProperty : 'code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.MyTasks with {
    status @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'TaskStatus',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : status_code,
                ValueListProperty : 'code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.MyTasks with {
    equipment @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Equipments',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : equipment_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'type_code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'location_locationId',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'status_EquipmentCode',
            },
        ],
    }
};

annotate service.MyIssues with @(
    UI.LineItem #MyIssues : [
        {
            $Type : 'UI.DataField',
            Value : task.issues.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : task.issues.description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : task.issues.issueStatus_statusCode,
            Label : 'Issue Status',
        },
        {
            $Type : 'UI.DataField',
            Value : task.issues.modifiedBy,
        },
    ]
);

