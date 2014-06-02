angular.module("app").controller "FooterController", ($scope, Wallet) ->
  $scope.connections = 0
  $scope.blockchain_blocks_behind = 0
  $scope.blockchain_status = "off"
  $scope.blockchain_last_block_num = 0

  watch_for = ->
    Wallet.info

  on_update = (info) ->
    connections = info.network_connections
    $scope.connections = connections
    if connections == 0
      $scope.connections_str = "Not connected to the network"
    else if connections == 1
      $scope.connections_str = "1 network connection"
    else
      $scope.connections_str = "#{connections} network connections"

    if connections < 4
      $scope.connections_img = "/img/signal_#{connections}.png"
    else
      $scope.connections_img = "/img/signal_4.png"

    $scope.wallet_unlocked = info.wallet_unlocked

    if info.last_block_time
      seconds_diff = (Date.now() - info.last_block_time.getTime()) / 1000
      hours_diff = Math.floor seconds_diff / 3600
      minutes_diff = (Math.floor seconds_diff / 60) % 60
      hours_diff_str = if hours_diff == 1 then "#{hours_diff} hour" else "#{hours_diff} hours"
      minutes_diff_str = if minutes_diff == 1 then "#{minutes_diff} minute" else "#{minutes_diff} minutes"
      $scope.blockchain_blocks_behind = Math.floor seconds_diff / 30
      $scope.blockchain_time_behind = "#{hours_diff_str} #{minutes_diff_str}"
      $scope.blockchain_status = if $scope.blockchain_blocks_behind < 2 then "synced" else "syncing"
      $scope.blockchain_last_block_num = info.last_block_num
    else
      $scope.blockchain_status = "off"

  $scope.$watch(watch_for, on_update, true)

