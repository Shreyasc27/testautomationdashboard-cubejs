cube(`Tbfeature`, {
  sql: `SELECT * FROM testautomationresults.tbfeature`,
  
  joins: {
    
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
	
	FeatureId:{
	  sql: `FeatureId`,
      type: `number`,
      primaryKey: true
	}
	
  }
  
});
