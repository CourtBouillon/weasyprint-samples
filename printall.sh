#!/usr/bin/env sh

# ticket
weasyprint ticket/ticket.html ticket/ticket.pdf &

# report
weasyprint report/report.html report/report.pdf &

# poster
weasyprint -s poster/poster.css poster/poster.html poster/poster.pdf &
weasyprint -s poster/flyer.css poster/poster.html poster/flyer.pdf &

# letter
weasyprint letter/letter.html letter/letter.pdf &

# invoice
weasyprint invoice/invoice.html invoice/invoice.pdf &

# book
weasyprint -s book/book-classical.css book/book.html book/book-classical.pdf &
weasyprint -s book/book.css book/book.html book/book.pdf &