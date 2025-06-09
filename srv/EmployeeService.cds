using { Equipment.system.app as service } from '../db/dataModel';


service EmployeeService {
    @odata.draft.enabled
    entity Equipments @(restrict :[
        {
        grant : ['READ'],
        to    : [ 'employeeUser']
        }
    ]) as projection on service.Equipments;
    entity MyTasks@(restrict :[
        {
        grant : ['READ'],
        to    : [ 'employeeUser']
        }
    ]) as projection on service.Tasks;
    entity MyIssues @(restrict :[
        {
        grant : ['*'],
        to    : [ 'employeeUser']
        }
    ]) as projection on service.Issues;
    entity Locations as projection on service.Locations;
    entity EquipmentStatus as projection on service.EquipmentStatus;
    entity IssueStatus as projection on service.IssueStatus;
    entity TaskPriority as projection on service.TaskPriority;
    entity IssueServerity as projection on service.IssueServerity;
    entity TaskStatus as projection on service.TaskStatus;
    entity Roles as projection on service.Roles;
    entity EquipmentTypes as projection on service.EquipmentTypes;
    
     type ArrayEmpData {
        taskId : String;
     };
     
    action updateTaskCompleted(taskData : array of ArrayEmpData ) returns String;

}