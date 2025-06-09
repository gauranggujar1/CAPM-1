sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        updateStatusComplete: function(oEvent) {
        debugger;
            let oTable = sap.ui.getCore().byId("com.equip.demo.employeeequipapp::MyTasksList--fe::table::MyTasks::LineItem");
            if (oTable.getSelectedContexts().length > 0)
            {
             MessageToast.show("Custom handler invoked.");
            var oModel =this.getModel();
            var sAction = '/updateTaskCompleted'
            var aSelectedTask = oTable.getSelectedContexts().map(function(item){
             return {
                taskId : item.getObject().ID
             };
            });
            var oPayload = {
                model:oModel, 
                parameterValues : [{
                    name : 'taskData',
                    value : aSelectedTask
                    
                }],
                skipParameterDialog:true
            }
            this.getEditFlow().invokeAction(sAction,oPayload).then(function(response) {
            //debugger;
            this._controller.getExtensionAPI().refresh();
            }.bind(this));

            }
            
        }
    };
});
