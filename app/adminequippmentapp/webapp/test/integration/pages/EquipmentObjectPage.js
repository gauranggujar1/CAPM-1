sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.equipo.demo.adminequippmentapp',
            componentId: 'EquipmentObjectPage',
            contextPath: '/Equipment'
        },
        CustomPageDefinitions
    );
});