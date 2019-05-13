import React from "react";
import logo from "./logo.svg";
import "./App.css";
import { Row, Col, Card, Spin, Statistic, Table } from "antd";
import "antd/dist/antd.css";
import cubejs from "@cubejs-client/core";
import { QueryRenderer } from "@cubejs-client/react";
import { Chart, Axis, Tooltip, Geom, Coord, Legend } from "bizcharts";
import moment from "moment";

const Dashboard = ({ children }) => (
  <Row type="flex" justify="space-around" align="top" gutter={24}>
    {children}
  </Row>
);

const DashboardItem = ({ children, title }) => (
  <Col span={24} lg={12}>
    <Card
      title={title}
      style={{
        marginBottom: "24px"
      }}
    >
      {children}
    </Card>
  </Col>
);

const stackedChartData = resultSet => {
  const data = resultSet
    .pivot()
    .map(({ xValues, yValuesArray }) =>
      yValuesArray.map(([yValues, m]) => ({
        x: resultSet.axisValuesString(xValues, ", "),
        color: resultSet.axisValuesString(yValues, ", "),
        measure: m && Number.parseFloat(m)
      }))
    )
    .reduce((a, b) => a.concat(b));
  return data;
};

const tableRender = ({ resultSet }) => (
  <Table
    pagination={false}
    columns={resultSet.tableColumns().map(c => ({ ...c, dataIndex: c.key }))}
    dataSource={resultSet.tablePivot()}
  />
);

const API_URL = "http://localhost:4000";
const cubejsApi = cubejs(
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1NTc2NDI2MDcsImV4cCI6MTU1NzcyOTAwN30.16k33bytufJ43i8YsKcFbn0HpejYJz0uKNmwUgOeV0w",
  {
    apiUrl: API_URL + "/cubejs-api/v1"
  }
);

const renderChart = Component => ({ resultSet, error }) =>
  (resultSet && <Component resultSet={resultSet} />) ||
  (error && error.toString()) || <Spin />;

const barRender = ({ resultSet }) => (
  <Chart
    scale={{
      x: {
        tickCount: 8
      }
    }}
    height={400}
    data={stackedChartData(resultSet)}
    forceFit
  >
    <Axis name="x" />
    <Axis name="measure" />
    <Tooltip />
    <Geom type="intervalStack" position={`x*measure`} color="color" />
  </Chart>
);

const pieRender = ({ resultSet }) => (
  <Chart height={400} data={resultSet.chartPivot()} forceFit>
    <Coord type="theta" radius={0.75} />
    {resultSet.seriesNames().map(s => (
      <Axis name={s.key} />
    ))}
    <Legend position="right" />
    <Tooltip />
    {resultSet.seriesNames().map(s => (
      <Geom type="intervalStack" position={s.key} color="category" />
    ))}
  </Chart>
);

function App() {
  return (
    <div className="App">
      <Dashboard>
        <DashboardItem>
          <div class="ant-card-head-title">
            <h2>Test Case Pass Percentage</h2>
          </div>
          <QueryRenderer
            query={{
              measures: ["Tbexecutiondetails.passpercentage"],
              timeDimensions: [],
              dimensions: ["Tbexecution.name"],
              limit: 5,
              order: {
                "Tbexecution.name": "desc"
              },
              filters: []
            }}
            cubejsApi={cubejsApi}
            render={renderChart(barRender)}
          />
        </DashboardItem>
        <DashboardItem>
          <div class="ant-card-head-title">
            <h2>Pass - Fail Test Case Count</h2>
          </div>
          <QueryRenderer
            query={{
              measures: [
                "Tbexecutiondetails.passtestcasecount",
                "Tbexecutiondetails.failtestcasecount"
              ],
              timeDimensions: [],
              dimensions: ["Tbexecution.name"],
              limit: 5,
              order: {
                "Tbexecution.name": "desc"
              },
              filters: []
            }}
            cubejsApi={cubejsApi}
            render={renderChart(barRender)}
          />
        </DashboardItem>
        <DashboardItem>
          <div class="ant-card-head-title">
            <h2>Test Case Count - Per Execution & Feature</h2>
          </div>
          <QueryRenderer
            query={{
              dimensions: ["Tbexecution.name", "Tbfeature.name"],
              timeDimensions: [],
              measures: [
                "Tbexecutiondetails.totalcount",
                "Tbexecutiondetails.passtestcasecount",
                "Tbexecutiondetails.failtestcasecount"
              ],
              order: {
                "Tbexecution.name": "desc",
                "Tbfeature.name": "asc"
              },
              filters: []
            }}
            cubejsApi={cubejsApi}
            render={renderChart(tableRender)}
          />
        </DashboardItem>
        <DashboardItem>
          <div class="ant-card-head-title">
            <h2>Test Case Count - Per Execution</h2>
          </div>
          <QueryRenderer
            query={{
              measures: [
                "Tbexecutiondetails.totalcount",
                "Tbexecutiondetails.passtestcasecount",
                "Tbexecutiondetails.failtestcasecount",
                "Tbexecutiondetails.passpercentage"
              ],
              timeDimensions: [],
              dimensions: ["Tbexecution.name"],
              limit: 5,
              order: {
                "Tbexecution.name": "desc"
              },
              filters: []
            }}
            cubejsApi={cubejsApi}
            render={renderChart(tableRender)}
          />
        </DashboardItem>
        <DashboardItem>
          <div class="ant-card-head-title">
            <h2>Test Case Count - Per Execution, Feature & Testplan</h2>
          </div>
          <QueryRenderer
            query={{
              measures: [
                "Tbexecutiondetails.totalcount",
                "Tbexecutiondetails.passtestcasecount",
                "Tbexecutiondetails.failtestcasecount"
              ],
              timeDimensions: [],
              dimensions: [
                "Tbexecution.name",
                "Tbfeature.name",
                "Tbtestplan.name"
              ],
              order: {
                "Tbexecution.name": "desc",
                "Tbfeature.name": "asc"
              },
              filters: []
            }}
            cubejsApi={cubejsApi}
            render={renderChart(tableRender)}
          />
        </DashboardItem>
        <DashboardItem>
		  <div class="ant-card-head-title">
            <h2>Test Case - Execution, Feature, Testplan</h2>
          </div>
          <QueryRenderer
            query={{
              measures: [],
              timeDimensions: [],
              dimensions: [
                "Tbexecution.name",
                "Tbfeature.name",
                "Tbtestplan.name",
                "Tbtestcases.name",
                "Tbexecutiondetails.status"
              ],
			  limit: 40,
			  order: {
                "Tbexecution.name": "desc",
				"Tbfeature.name" : "desc",
                "Tbtestplan.name": "asc"
              },
              filters: []
            }}
            cubejsApi={cubejsApi}
            render={renderChart(tableRender)}
          />
        </DashboardItem>
		
        <DashboardItem>
          <div class="ant-card-head-title">
            <h2>Test Case Count - Per Execution & Testplan</h2>
          </div>
          <QueryRenderer
            query={{
              measures: [
                "Tbexecutiondetails.totalcount",
                "Tbexecutiondetails.passtestcasecount",
                "Tbexecutiondetails.failtestcasecount"
              ],
              timeDimensions: [],
              dimensions: ["Tbexecution.name", "Tbtestplan.name"],
              order: {
                "Tbexecution.name": "desc",
                "Tbtestplan.name": "asc"
              },
              filters: []
            }}
            cubejsApi={cubejsApi}
            render={renderChart(tableRender)}
          />
        </DashboardItem>
      </Dashboard>
    </div>
  );
}

export default App;
