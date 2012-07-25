class Leitor
    @hash_agregacao = []
    foobar: ->
        csv = require 'csv' 

        csv()
            .fromPath("#{__dirname}/OcorIndicadores2011.csv", {delimiter:";"})
            .transform (data,index) ->

                dataOcorrencia = data[1].split '-'
                ocorrencia =
                    cidade: data[0]
                    tipo_ocorrencia: data[2]
                    mes_ocorrencia: dataOcorrencia[1]
                    ano_ocorrencia: dataOcorrencia[0]
                    valor: data[3]

                retorno = existe_hash ocorrencia

                if retorno
                    soma_agregacao ocorrencia
                else
                    adiciona_hash ocorrencia
        console.log @hash_agregacao


    existe_hash: (elemento) ->
        retorno = false
        for item in @hash_agregacao
            hash_item = item.hash_value
            hash_elemento = obtem_hash elemento
            retorno = true if hash_item == hash_elemento
        retorno

    obtem_hash: (elemento) ->
        elemento.cidade  + '_' +
            elemento.tipo_ocorrencia + '_' +
            elemento.ano_ocorrencia

    adiciona_hash: (elemento) ->
        item_agregacao =
            hash_value: obtem_hash elemento
            cidade: elemento.cidade
            tipo_ocorrencia: elemento.tipo_ocorrencia
            ano_ocorrencia: elemento.ano_ocorrencia
            valor_agregado: elemento.valor
        @hash_agregacao.push item_agregacao

    soma_agregacao: (elemento) ->
        for item_agregacao in @hash_agregacao
            item_agregacao.valor_agregado += elemento.valor if item_agregacao.hash_value == obtem_hash elemento

x = new Leitor
x.foobar()

