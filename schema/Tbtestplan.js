cube(`Tbtestplan`, {
  sql: `SELECT * FROM testautomationresults.tbtestplan`,
  
  joins: {
    Tbfeature: {
      relationship: `hasMany`,
      sql: `${Tbtestplan}.FeatureId = ${Tbfeature}.FeatureId`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [name]
    }
  },
  
  dimensions: {
    name: {
      sql: `Name`,
      type: `string`
    },
	TestPlanId:{
	  sql: `TestPlanId`,
      type: `number`,
      primaryKey: true
	}
  }
});
