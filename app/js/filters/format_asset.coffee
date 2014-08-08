angular.module("app").filter "formatAsset", (Utils)->
    (asset) ->
        Utils.formatAsset(asset)

angular.module("app").filter "formatAssetPrice", (Utils)->
    (asset) -> Utils.formatAssetPrice(asset)

angular.module("app").filter "formatMoney", (Utils)->
    (asset) -> Utils.formatMoney(asset)

angular.module("app").filter "formatDecimal", (Utils)->
    (asset, decimals) -> Utils.formatDecimal(asset, decimals)

angular.module("app").filter "formatAccountBalance", (Blockchain, Utils) ->
    (account) ->
        result = account[0] + " | "
        balances = (Utils.formatAsset(balance) for balance in account[1])
        result + balances.join('; ')
