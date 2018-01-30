function printReceipt() {
    $("body > div > div").removeClass("container");
    $("body > div > div > div > div").removeClass("well");

    window.print();

    $("body > div > div").addClass("container");
    $("body > div > div > div > div").addClass("well");
}
