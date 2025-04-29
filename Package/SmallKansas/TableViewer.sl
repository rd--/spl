TableViewer : [Object, View] { | title tablePane |

	createElements { :self :tableData |
		self.tablePane := 'div'.createElement(
			class: 'tablePane'
		);
		self.tablePane.appendChild(
			system.window.document.parseHtml(tableData.asHtml)
		)
	}

	initialize { :self :title :tableData |
		self.title := title;
		self.createElements(Table(tableData));
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
