=begin
#
#  INFIVERVE TECHNOLOGIES PTE LIMITED CONFIDENTIAL
#  _______________________________________________
# 
#  (C) INFIVERVE TECHNOLOGIES PTE LIMITED, SINGAPORE
#  All Rights Reserved.
#  Product / Project: Flint IT Automation Platform
#  NOTICE:  All information contained herein is, and remains
#  the property of INFIVERVE TECHNOLOGIES PTE LIMITED.
#  The intellectual and technical concepts contained
#  herein are proprietary to INFIVERVE TECHNOLOGIES PTE LIMITED.
#  Dissemination of this information or any form of reproduction of this material
#  is strictly forbidden unless prior written permission is obtained
#  from INFIVERVE TECHNOLOGIES PTE LIMITED, SINGAPORE.
=end

@result1 = @call.bit("flint-vault:read.rb").set("key","qwe").sync
# token can also be given at runtime
@result2 = @call.bit("flint-vault:read.rb").set("key","qwe")
            .set("token","afd14490-7230-e724-84d3-678863bc37ac")
            .sync

# read the value
@log.info("Value - token from global config:"+@result1.get("value"))

@log.info("Value - token at runtime:"+@result2.get("value"))
