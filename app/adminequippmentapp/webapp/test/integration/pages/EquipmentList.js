sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.equipo.demo.adminequippmentapp',
            componentId: 'EquipmentList',
            contextPath: '/Equipment'
        },
        CustomPageDefinitions
    );
});