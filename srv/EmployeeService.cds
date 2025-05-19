using { Equipment.system.app as service } from '../db/dataModel';


service EmployeeService {
    @odata.draft.enabled
    entity Equipments as projection on service.Equipments;
    entity MyTasks as projection on service.Tasks;
    entity MyIssues as projection on service.Issues;
    entity Locations as projection on service.Locations;
    entity EquipmentStatus as projection on service.EquipmentStatus;
    entity IssueStatus as projection on service.IssueStatus;
    entity TaskPriority as projection on service.TaskPriority;
    entity IssueServerity as projection on service.IssueServerity;
    entity TaskStatus as projection on service.TaskStatus;
    entity Roles as projection on service.Roles;
    entity EquipmentTypes as projection on service.EquipmentTypes;
    

}