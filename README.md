# flint-vault
Access Hashicorp Vault from Flint IT Automation Platform

## Add new Flintbox from Flint Console
* Go to flintbox
* Click on Add Flintbox
* set Git url of this repo 
* Click add
* Enable the flintbox

## Global Configuration in flint

#### Name: flint-vault
#### Config JSON
```json
{
    "token": "afd14490-7230-e724-84d3-678863bc37ac",
    "url": "http://127.0.0.1:8200",
    "http_connector": "http"
}
```
| Name | Description          |
| ------------- | ----------- |
| token      | Hashicorp Vault User Token|
| url     | Hashicorp Vault Server URL with port|
| http_connector| Name of HTTP connector which is enabeled on Flint|

## Global Configuration in flint

```ruby 
# call the flintbit
@result = @call.bit("flint-vault:read.rb").set("key","name_of_key")
# read the value
value = @result.get("value")
```
