const cds = require('@sap/cds');

class EmployeeService extends cds.ApplicationService {
 init() {

    const { MyTasks } = this.entities;
    this.on('updateTaskCompleted', async(req)=>{

    try {
      debugger;
      if (req.data.taskData){
      if (req.data.taskData.length > 0)
       {
          let tx = cds.tx(req);
          let ataskData = req.data.taskData ;
          for (var i = 0  ; i < req.data.taskData.length ; i++)
         {
           let data = await tx.run( UPDATE(MyTasks, ataskData[i].taskId).with({status_code : "COMPLETED" }));
           console.log(data);
         }
         return req.info(202,"Records updatd Successfully");
       }
      
    }
    

    }catch(error) {
     return req.error(400, "Updated failed" + error );
    
    }
    
   
    
    })
    return super.init();

 }
}
module.exports = EmployeeService;