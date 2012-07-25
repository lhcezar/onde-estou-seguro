csv = require 'csv'

obj = {}

csv()
	.fromPath("#{__dirname}/OcorIndicadores2011.csv", {delimiter:";"})
	.transform (data,index) ->
		if not obj[data[2]]? 
			obj[data[2]] = +data[3]
		else
			obj[data[2]] += +data[3]


exports.home = (req, res) ->
	if req.headers.accept == 'application/json'
		res.send "{foo:bar} #{req.headers.accept}"
	else
		res.render 'index',  title: req.params.uf

exports.verifica_unidade = (req, res, next, id) ->
	# suporte multiplas UFs
	uf =
		sp: false
		rs: true

	if !uf[id]
		res.send "Unidade Federativa não implementada"
	else
		next()
