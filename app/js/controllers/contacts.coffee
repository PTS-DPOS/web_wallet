angular.module("app").controller "ContactsController", ($scope, $state, $location, $modal, $q, $http, $rootScope, RpcService, WalletAPI, Shared, Utils, Wallet) ->
    $scope.contacts = []

    $scope.refresh_contacts = ->
        $scope.contacts = []

        for n, c of Wallet.accounts
            if !c.is_my_account and !Utils.is_registered(c)
                $scope.contacts.push c

    Wallet.refresh_accounts().then ->
        $scope.refresh_contacts()
    
    $scope.$watchCollection ->
        Wallet.accounts
    , ->
        $scope.refresh_contacts()

    $scope.deleteContact = (name) ->
        WalletAPI.remove_contact_account(name).then ->
            Wallet.refresh_accounts()

    $scope.newContactModal = ->
        modal = $modal.open
            templateUrl: "newcontact.html"
            controller: "NewContactController"
        modal.result.then ()->
            Wallet.refresh_accounts()
        , ()->
            Wallet.refresh_accounts()

    $scope.toggleFavorite = (name)->
        Wallet.refresh_accounts().then ()->
            if (Wallet.accounts[name].private_data)
                private_data=Wallet.accounts[name].private_data
            else
                private_data={}
            if !(private_data.gui_data)
                private_data.gui_data={}
            private_data.gui_data.favorite=!(private_data.gui_data.favorite)
            Wallet.account_update_private_data(name, private_data).then ->
                Wallet.refresh_accounts()
