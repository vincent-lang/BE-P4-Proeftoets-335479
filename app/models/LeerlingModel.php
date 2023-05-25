<?php

class LeerlingModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getLeerlingen($Id = null)
    {
        $sql = "SELECT
            Leerl.Voornaam Leerl.TussenVoegsel Leerl.Achternaam
            ,Leerl.Mobiel
            ,LP.PakketNaam
            ,LP.AantalLessen
            ,LP.Prijs
            ,LPLP.StartDatumRijlessen
            ,LPLP.DatumRijbewijsBehaald
            ,LPLP.TypeVoertuig
            ,LPLP.Rijbewijscategorie
            from LesPakket as LP

            inner join Leerling as Leerl
            on LP.Id = Leerl.Id

            inner join LeerlingPerLesPakket as LPLP
            on Leerl.Id = LPLP.Id
            
            where LP.Id = $Id
            order by LPLP.StartDatumRijlessen asc";

        $this->db->query($sql);
        return $this->db->resultSet();
    }
}
