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
                        <td>$result->Voornaam</td>
                        <td>$result->Tussenvoegsel</td>
                        <td>$result->Achternaam</td>
                        <td>$result->Mobiel</td>
                        <td>$result->DatumInDienst</td>
                        <td>$result->AantalSterren</td>
                        <td>
                        <a href='". URLROOT . "/voertuig/index/" . $result->Id . "'>
                        <img src='". URLROOT . "/img/car.png' alt='car.png'>
                        </a>
                        </td>
                    </tr>";
        }

        $data = [
            'title' => 'Instructeurs in dienst',
            'aantal_instructeurs' => 'Aantal instructeurs: 5',
            'records' => 'info uit de database',
            'rows' => $rows
        ];

        $this->view('instructeur/index', $data);
    }
}