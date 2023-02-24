class ValidadeClaims

    def validar_claims (body, body_cobertura)                      
        id_certificado = body[0]['values']
        numero_cobertura = body_cobertura[0]['values']
        endpoint = DATA['endpoint']['validateclaims']     
        url = "#{DATA[$ambiente]['url_api']}#{endpoint}?id_certificado=#{id_certificado}&id_cobertura=#{numero_cobertura}"
        @body = ""
        @body = Comum.new.test_get(url, endpoint)
        @body
    end

    def valida_claims_erro(claims_erro, body, body_cobertura)                           
        id_certificado = body[0]['values']
        numero_cobertura = body_cobertura[0]['values']
        array_certificado_cobertura = [body[0]['values'], body_cobertura[0]['values']]
       
        if claims_erro == 'id_certificado'
            array_certificado_cobertura[0] = MASSA['id_certificado_invalido']
        else
            array_certificado_cobertura[1] = MASSA['id_cobertura_invalido']
        end

        endpoint = DATA['endpoint']['validateclaims']     
        url = "#{DATA[$ambiente]['url_api']}#{endpoint}?id_certificado=#{array_certificado_cobertura[0]}&id_cobertura=#{array_certificado_cobertura[1]}"
        @body = ""
        @body = Comum.new.test_get(url, endpoint)
        @body
    end   
end
