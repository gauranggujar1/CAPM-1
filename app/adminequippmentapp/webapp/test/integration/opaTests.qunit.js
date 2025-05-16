sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/equipo/demo/adminequippmentapp/test/integration/FirstJourney',
		'com/equipo/demo/adminequippmentapp/test/integration/pages/EquipmentList',
		'com/equipo/demo/adminequippmentapp/test/integration/pages/EquipmentObjectPage'
    ],
    function(JourneyRunner, opaJourney, EquipmentList, EquipmentObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/equipo/demo/adminequippmentapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEquipmentList: EquipmentList,
					onTheEquipmentObjectPage: EquipmentObjectPage
                }
            },
            opaJourney.run
        );
    }
);