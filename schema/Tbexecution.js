cube(`Tbexecution`, {
  sql: `SELECT * FROM testautomationresults.tbexecution`,
  
  joins: {
    
  },
  
  measures: {
    
	lastExecution: {
	  sql: `id`,
	  type: `number`,
	  filters: [
		{ sql: `order by ${TABLE}.executionid` }
	  ]
    }
	
  },
  
  dimensions: {
    
	name: {
      sql: `Name`,
      type: `string`,
	  title: `Execution`
    },
	
	executionId:{
	  sql: `executionId`,
      type: `number`,
      primaryKey: true
	}
	
  },
    
});
