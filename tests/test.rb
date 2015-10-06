@result1 = @call.bit("flint-vault:read.rb").set("key","qwe").sync
# token can also be given at runtime
@result2 = @call.bit("flint-vault:read.rb").set("key","qwe")
            .set("token","afd14490-7230-e724-84d3-678863bc37ac")
            .sync

# read the value
@log.info("Value - token from global config:"+@result1.get("value"))

@log.info("Value - token at runtime:"+@result2.get("value"))
