part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Ticket ticket;
  final FlutixTransaction transaction;

  SuccessPage(this.ticket, this.transaction);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return;
        },
        child: Scaffold(
          body: FutureBuilder(
            future: ticket != null
                ? processingTicketOrder(context)
                : processingTopUp(),
            builder: (_, snapshot) => (snapshot.connectionState ==
                    ConnectionState.done)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.only(bottom: 70),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ticket == null
                                    ? 'assets/top_up_done.png'
                                    : 'assets/ticket_done.png'))),
                      ),
                      Text(
                        (ticket == null) ? 'Ummm Yummy !' : 'Happy Watching',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        (ticket == null)
                            ? 'You have successfully\ntop up the wallet'
                            : 'you have successfully\nbought the ticket',
                        textAlign: TextAlign.center,
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      Container(
                        height: 45,
                        width: 250,
                        margin: EdgeInsets.only(top: 70, bottom: 20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: mainColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Text(
                              (ticket == null) ? 'My Wallet' : 'My Tickets',
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () {}),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Discover new movie ?',
                              style: greyTextFont.copyWith(
                                  fontWeight: FontWeight.w400)),
                          GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToMainPage());
                            },
                            child: Text(
                              ' back to home',
                              style: purpleTextFont,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Center(
                    child: SpinKitFadingCircle(
                      size: 50,
                      color: mainColor,
                    ),
                  ),
          ),
        ));
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.bloc<UserBloc>().add(Purchase(ticket.totalPrice));
    context.bloc<TicketBloc>().add(BuyTicket(ticket, transaction.userID));

    await FlutixTransactionServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp() async {}
}
