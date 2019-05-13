cube(`Tbtestcases`, {
  sql: `SELECT * FROM testautomationresults.tbtestcases`,
  
  joins: {
    Tbtestcases: {
      relationship: `hasMany`,
      sql: `${Tbtestcases}.TestcaseId = ${Tbtestcases}.TestcaseId`
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
    
    status: {
      sql: `Status`,
      type: `string`
    },
	
	TestPlanId:{
	  sql: `TestcaseId`,
      type: `number`,
      primaryKey: true
	}
  }
});
