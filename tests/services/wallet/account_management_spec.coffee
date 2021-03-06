describe "walletServices", () ->
  Wallet = undefined
  MyWallet = undefined

  accounts = [{label: 'Savings'}, {label: 'Party Money'}]

  beforeEach angular.mock.module("walletApp")

  beforeEach ->
    angular.mock.inject ($injector, $q) ->
      Wallet = $injector.get("Wallet")
      MyWallet = $injector.get("MyWallet")

      Wallet.askForSecondPasswordIfNeeded = () ->
        return {
          then: (fn) -> fn(); return { catch: (-> ) }
        }

      Wallet.accounts = () -> accounts

      Wallet.my.fetchMoreTransactionsForAll = (success,error,allTransactionsLoaded) ->
        success()

      MyWallet.wallet = {
        isDoubleEncrypted: false
        newAccount: (label) -> accounts.push({ label: label })
        getHistory: () ->
          then: () ->
            then: () ->
        txList:
          transactions: () ->
            [{ result: 1, txType: 'received' }]
          fetchTxs: () ->
      }

      return
    return

  describe "createAccount()", ->

    it "should call generateNewKey()", inject((Wallet, MyWallet) ->
      spyOn(Wallet, "createAccount")
      Wallet.createAccount()
      expect(Wallet.createAccount).toHaveBeenCalled()
    )

    it "should increase the number of accounts", inject((Wallet, MyWallet) ->
      before = Wallet.accounts().length
      Wallet.createAccount("Some name", (()->))
      expect(Wallet.accounts().length).toBe(before + 1)
      return
    )

    it "should set a name", inject((Wallet, MyWallet) ->
      Wallet.createAccount("Spending", (()->))
      accts = Wallet.accounts()
      expect(accts[accts.length - 1].label).toBe("Spending")
    )

    return
