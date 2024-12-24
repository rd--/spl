TableViewer : [Object, View] { | title tablePane |

	createElements { :self :tableData |
		self.tablePane := 'div'.createElement(
			class: 'tablePane'
		);
		self.tablePane.appendChild(
			tableData.asHtmlTable
		)
	}

	initialize { :self :title :tableData |
		self.title := title;
		self.createElements(tableData);
		self
	}

	outerElement { :self |
		self.tablePane
	}

}

+String {

	TableViewer { :self :tableData |
		newTableViewer().initialize(self, tableData)
	}

}

+SmallKansas {

	TableViewer { :self :title :tableData |
		self.addFrame(TableViewer(title, tableData), nil)
	}

}
