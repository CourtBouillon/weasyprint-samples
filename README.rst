from weasyprint import HTML
import base64

# Configuration des variables
nom_client = "Tchikaya Hélèina"
date_facture = "07/01/2026"
num_facture = "76426828-FR1126-1"
adresse_depart = "Aéroport de Bordeaux"
adresse_arrivee = "50 Avenue de Verdun, 33200 Bordeaux"
horaire_depart = "07/01/2026 11:54"
horaire_arrivee = "07/01/2026 12:15"

html_content = f"""
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <style>
        @page {{
            size: A4;
            margin: 20mm;
            background-color: #ffffff;
        }}
        body {{
            font-family: 'Helvetica', 'Arial', sans-serif;
            color: #333;
            font-size: 10pt;
            line-height: 1.4;
            margin: 0;
            padding: 0;
        }}
        .header {{
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 40px;
        }}
        .logo {{
            color: #32bb78;
            font-size: 32pt;
            font-weight: bold;
            margin: 0;
        }}
        .invoice-info {{
            text-align: right;
        }}
        .invoice-number {{
            font-weight: bold;
            font-size: 12pt;
        }}
        .section {{
            margin-bottom: 25px;
        }}
        .flex-container {{
            display: block;
            width: 100%;
        }}
        .col {{
            width: 50%;
            display: inline-block;
            vertical-align: top;
        }}
        .label {{
            color: #777;
            margin-bottom: 5px;
            font-size: 9pt;
        }}
        .bold {{
            font-weight: bold;
        }}
        .course-details {{
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
            padding: 15px 0;
            margin: 20px 0;
        }}
        table {{
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }}
        th {{
            border-bottom: 2px solid #333;
            text-align: left;
            padding: 10px 5px;
            font-size: 9pt;
            color: #555;
        }}
        td {{
            padding: 12px 5px;
            border-bottom: 1px solid #eee;
        }}
        .text-right {{
            text-align: right;
        }}
        .totals {{
            float: right;
            width: 40%;
            margin-top: 10px;
        }}
        .total-row {{
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }}
        .grand-total {{
            font-weight: bold;
            font-size: 11pt;
            border-top: 1px solid #333;
            padding-top: 5px;
            margin-top: 5px;
        }}
        .payment-info {{
            margin-top: 30px;
            text-align: right;
        }}
        .footer-note {{
            margin-top: 50px;
            font-size: 8pt;
            color: #888;
        }}
        .legal-mention {{
            margin-top: 20px;
            font-style: italic;
            font-size: 8pt;
        }}
    </style>
</head>
<body>
    <div class="header">
        <div style="float: left;">
            <p class="logo">Bolt</p>
        </div>
        <div class="invoice-info" style="float: right;">
            <p class="invoice-number">N° de facture {num_facture}</p>
            <p>Date : {date_facture}</p>
        </div>
        <div style="clear: both;"></div>
    </div>

    <div class="section">
        <div style="width: 35%; float: left;">
            <p class="label">Acheteur :</p>
            <p class="bold">{nom_client}</p>
        </div>
        <div style="width: 60%; float: right; text-align: right;">
            <p class="label">Facture émise par Bolt Operations OÜ au nom et pour le compte de :</p>
            <p class="bold">TANTAOUI BELKACEM</p>
            <p>57 AVENUE DU MARECHAL JUIN 64200 BIARRITZ<br>
            Numéro SIREN : 80982795900044<br>
            N° de TVA : FR64809827959<br>
            Immatriculation du véhicule : DB-587-WL</p>
        </div>
        <div style="clear: both;"></div>
    </div>

    <div class="course-details">
        <p><strong>Début de la course :</strong> {adresse_depart} ({horaire_depart})</p>
        <p><strong>Fin de la course :</strong> {adresse_arrivee} ({horaire_arrivee})</p>
    </div>

    <table>
        <thead>
            <tr>
                <th style="width: 50%;">Description</th>
                <th class="text-right">Sous-total (EUR)</th>
                <th class="text-right">TVA 0%</th>
                <th class="text-right">Total (EUR)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Frais de trajet</td>
                <td class="text-right">37.00</td>
                <td class="text-right">0.00</td>
                <td class="text-right" style="font-weight: bold;">37.00</td>
            </tr>
        </tbody>
    </table>

    <div style="width: 100%; overflow: hidden;">
        <div class="totals">
            <div style="overflow: hidden; margin-bottom: 5px;">
                <span style="float: left;">Sous-total (EUR) :</span>
                <span style="float: right;">37.00</span>
            </div>
            <div style="overflow: hidden; margin-bottom: 5px;">
                <span style="float: left;">TVA 0% :</span>
                <span style="float: right;">0.00</span>
            </div>
            <div class="grand-total" style="overflow: hidden;">
                <span style="float: left;">Total TTC (EUR) :</span>
                <span style="float: right;">37.00</span>
            </div>
        </div>
    </div>

    <div class="payment-info">
        <p>Payé par FRGYX4LGWZ9G25U-1 : <strong>-3.70</strong></p>
        <p>Facturée 💵 Espèces : <strong>33.30</strong></p>
    </div>

    <p class="legal-mention">TVA non applicable, article 293 B du CGI</p>

    <div class="footer-note">
        <p>Emis(e) au nom et pour le compte de TANTAOUI BELKACEM par Bolt Operations OÜ, Vana-Louna tn 15, Tallinn 10134, Estonie, Numéro de registre KVK : 14532901, Numéro de TVA : EE102090374</p>
    </div>
</body>
</html>
"""

output_path = "facture_bolt_tchikaya_v1.pdf"
HTML(string=html_content).write_pdf(output_path)
