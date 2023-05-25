<?php

class RijLesPakketten extends BaseController
{

    private $RijLesPakkettenInfo;

    public function __construct()
    {
        $this->RijLesPakkettenInfo = $this->model('LeerlingModel.php');
    }

    public function index()
    {
        $Leerlingen = $this->RijLesPakkettenInfo->getLeerlingen();

        $rows = '';
        foreach ($Leerlingen as $result) {
            $rows .= "<tr>
                        <td>$result->Naam</td>
                        <td>$result->Mobiel</td>
                        <td>$result->Pakket naam</td>
                        <td>$result->Aantal Lessen</td>
                        <td>$result->Prijs</td>
                        <td>$result->Start datum</td>
                        <td>$result->Datum Rijbewijs behaald</td>
                    </tr>";
        }

        $data = [
            'title' => 'Overzicht Rijlespakketten Leerlingen',
            'rows' => $rows
        ];

        $this->view('Leerling/index', $data);
    }
}