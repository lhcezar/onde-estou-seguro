$(document).ready -> 
	chart = new Highcharts.Chart({
		chart:
			renderTo: 'container'
			plotBackgroundColor: null
			plotBorderWidth: null
			plotShadow: false

		title:
			text: 'Incidência de violência por região'
		tooltip:
			formatter: ->
	                "<b>#{this.point.name}</b>:#{this.percentage}%"
		credits:
	    	enabled: false
	    	
		plotOptions:
			pie:
				allowPointSelect: true
				cursor: 'pointer'
				dataLabels:
					enabled: true
					color: '#000000'
					connectorColor: '#000000'
					formatter: ->
						"<b>#{this.point.name}</b>:#{this.percentage}%"
		series: [{
			type: 'pie'
			name: 'Browser share'
			data:[
				['Firefox',   45.0]
				['IE',       26.8]
					{
					name: 'Chrome'
					y: 12.8
					sliced: true
					selected: true
                },
				['Safari',    8.5]
				['Opera',     6.2]
				['Others',   0.7]
			]
        }]
	})