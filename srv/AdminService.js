const cds = require('@sap/cds');

class AdminService extends cds.ApplicationService {
 init() {

    const { Equipments , EquipmentTypes } = this.entities;

    this.before('UPDATE',Equipments.drafts, async(req)=>{
        try {
        if(req.data?.type_code)
        {
           let type_code = req.data?.type_code ;
           let oEquipmentType =  await SELECT.one.from(EquipmentTypes).where({code:type_code})

           if (!oEquipmentType)
           {
             return req.error(404,'Unable to fetch Equipment Data')
           }else{
              req.data.manufacturing = oEquipmentType.manufacturer ;
           }

        }    

    }catch(error){
        return req.error(404,'Unable to fetch Equipment Data')

    }
    })
    
    return super.init();

 }
}
module.exports = AdminService;