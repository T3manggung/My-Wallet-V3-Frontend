angular
  .module('walletApp')
  .controller('TopCtrl', TopCtrl);

function TopCtrl ($scope, Wallet, currency) {
  $scope.settings = Wallet.settings;
  $scope.isBitCurrency = currency.isBitCurrency;
  $scope.toggleDisplayCurrency = Wallet.toggleDisplayCurrency;
  $scope.status = Wallet.status;
  $scope.copied = false;

  $scope.getTotal = () => Wallet.total();
  $scope.resetCopy = () => $scope.copied = false;

  $scope.nextAddress = () => {
    if ($scope.copied) return;
    $scope.copied = true;
    let defaultIdx = Wallet.my.wallet.hdwallet.defaultAccountIndex;
    return Wallet.getReceivingAddressForAccount(defaultIdx);
  };
}
