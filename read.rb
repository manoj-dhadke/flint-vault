vault_url = @config.global("flint-vault.url")
vault_token = @config.global("flint-vault.token")
http_connector = @config.global("flint-vault.http_connector")
@log.info("Token:"+vault_token)
@log.info("URL:"+vault_url)
key = @input.get("key")

@log.info("URL Full:"+vault_url+"/v1/secret/"+key)
@log.trace("Calling HTTP Connector...")
http_response = @call.connector("http")
                               .set("method","get")                    #HTTP request method
                               .set("url",vault_url+"/v1/secret/"+key)
                               .set("headers",["X-Vault-Token:"+vault_token])                         #HTTP request headers
                               .set("timeout",10000)                                              #Timeout in milliseconds,required by the Connetor to serve the request
                               .sync
                               #.timeout(10000)                                                   #Execution time of the Flintbit in milliseconds

#HTTP Connector Response Meta Parameters
response_exitcode = http_response.exitcode                                              #Exit status code
response_message = http_response.message                                                #Execution status message
@log.info("Response"+http_response.get("body"))

if response_exitcode == 0
    @log.info('Success in executing HTTP Connector where, exitcode ::'+response_exitcode.to_s+' | message :: '+response_message)
    response_body = http_response.get("body")                                               #Response Body
    result = @util.json(response_body).get("$.data.value")
    @output.set("value",result)
else
    @log.error('Failure in executing HTTP Connector where, exitcode ::'+response_exitcode.to_s+' | message :: ' +response_message)
    @output.set("error",response_message)
end
