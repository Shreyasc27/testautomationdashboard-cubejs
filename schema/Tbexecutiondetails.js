cube(`Tbexecutiondetails`, {
  sql: `SELECT * FROM testautomationresults.tbexecutiondetails`,
  
  joins: {
	  
    Tbexecution: {
      relationship: `hasMany`,
      sql: `${Tbexecutiondetails}.Executionid = ${Tbexecution}.Executionid`
    },
	
	Tbfeature: {
      relationship: `hasMany`,
      sql: `${Tbexecutiondetails}.Featureid = ${Tbfeature}.Featureid`
    },
	
	Tbtestplan: {
      relationship: `hasMany`,
      sql: `${Tbexecutiondetails}.Testplanid = ${Tbtestplan}.Testplanid`
    },
	
	Tbtestcases: {
      relationship: `hasMany`,
      sql: `${Tbexecutiondetails}.Testcaseid = ${Tbtestcases}.Testcaseid`
    }
	
  },
  
  measures: {
    
	totalcount: {
	  sql: `executionid`,
      type: `count`,
	  title: `Total TCs`
    },
	
	passtestcasecount: {
	  sql: `executionid`,
      type: `count`,
	  title: `Pass TCs`,
	  filters: [
			{ sql: `${TABLE}.status = 'Pass'` }
		]
    },
	
	failtestcasecount: {
	  sql: `executionid`,
      type: `count`,
	  title: `Fail TCs`,
	  filters: [
			{ sql: `${TABLE}.status = 'Fail'` }
		]
    },
	
	passpercentage: {
	  sql: `${passtestcasecount} / ${totalcount} * 100.0`,
	  type: `number`,
	  title: `Pass Percentage`,
	  format: `percent`
	}
	
  },
  
  dimensions: {
    
	status: {
      sql: `Status`,
      type: `string`
    },
	
	executionid: {
      sql: `executionid`,
      type: `number`,
	  title: `Execution`
    },
	
	executiondetailsid: {
      sql: `executiondetailsid`,
      type: `number`,
	  primaryKey: true	
    }
	
  }
  
});
