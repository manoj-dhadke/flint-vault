# flint-vault
Read Vault Secrets from Flintbits

#### What is Vault?
Vault is a tool for securely accessing secrets. A secret is anything that you want to tightly control access to, such as API keys, passwords, certificates, and more. Vault provides a unified interface to any secret, while providing tight access control and recording a detailed audit log.
Know more: https://vaultproject.io

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

## How to use it from Flintbits
#### Ruby
```ruby 
# call the flintbit
@result = @call.bit("flint-vault:read.rb").set("key","name_of_key_to_read").sync
# read the value
value = @result.get("value")
```



