<?php

class Leerling extends BaseController
{

    private $RijLesPakkettenInfo;

    public function __construct()
    {
        $this->RijLesPakkettenInfo = $this->model('LeerlingModel');
    }

    public function index()
    {
        $Leerlingen = $this->RijLesPakkettenInfo->getLeerlingen();

        $rows = '';
        foreach ($Leerlingen as $result) {
            $rows .= "<tr>
                        <td>$result->Voornaam</td>
                        <td>$result->Mobiel</td>
                        <td>$result->PakketNaam</td>
                        <td>$result->AantalLessen</td>
                        <td>$result->Prijs</td>
                        <td>$result->StartDatumRijlessen</td>
                        <td>$result->DatumRijbewijsBehaald</td>
                    </tr>";
        }

        $data = [
            'title' => 'Overzicht Rijlespakketten Leerlingen',
            'rows' => $rows
        ];

        $this->view('Leerling/index', $data);
    }
}