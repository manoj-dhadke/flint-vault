# reading value from Global Configuration
vault_url = @config.global("flint-vault.url")
vault_token = @config.global("flint-vault.token")
http_connector = @config.global("flint-vault.http_connector")

@log.debug("Vault URL:"+vault_url)
# read vault key from input
key = @input.get("key")
if key == nil
  @output.exit(1,"Please provide key to read")
end

@log.trace("Calling Vault Server...")
http_response = @call.connector("http")
                  .set("method","get") #HTTP request method
                  .set("url",vault_url+"/v1/secret/"+key)
                  .set("headers",["X-Vault-Token:"+vault_token]) #Set Vault Token
                  .set("timeout",10000) #Timeout in milliseconds
                  .sync

#HTTP Connector Response Meta Parameters
# @log.info("Response"+http_response.get("body"))

if http_response.exitcode == 0
    @log.info('Success in calling Vault REST API, exitcode ::'+http_response.exitcode.to_s)
    response_body = http_response.get("body")                                               #Response Body
    result = @util.json(response_body).get("$.data.value")
    @output.set("value",result)
else
    @log.error('Failure in calling Vault REST API, exitcode ::'+http_response.exitcode.to_s)
    begin
      errors = @util.json(response_body).get("$.errors")
      @output.set("errors",errors)
    rescue Exception
      @output.set("errors","Error reading value for key")
    end

end
