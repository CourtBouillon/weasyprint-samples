#!/usr/bin/env sh

# ticket KO with 54.1 : https://github.com/Kozea/WeasyPrint/issues/1575
# builded with 53.4
# weasyprint ticket/ticket.html ticket/ticket.pdf &

# report : wait for 54.2 https://github.com/CourtBouillon/weasyprint-samples/pull/2
# builded with 53.4
# weasyprint report/report.html report/report.pdf &

# poster
weasyprint -s poster/poster.css poster/poster.html poster/poster.pdf &
weasyprint -s poster/flyer.css poster/poster.html poster/flyer.pdf &

# letter
weasyprint letter/letter.html letter/letter.pdf &

# invoice
weasyprint invoice/invoice.html invoice/invoice.pdf &

# book
weasyprint -e utf-8 -s book/book-classical.css book/book.html book/book-classical.pdf &
weasyprint -e utf-8 -s book/book.css book/book.html book/book.pdf &
