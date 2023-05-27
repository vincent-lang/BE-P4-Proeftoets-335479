<?php

class LeerlingModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getLeerlingen()
    {
        $sql = "SELECT
            Voornaam
            ,Mobiel
            ,PakketNaam
            ,AantalLessen
            ,Prijs
            ,StartDatumRijlessen
            ,DatumRijbewijsBehaald
            from Leerling as Leerl
            
            inner join LeerlingPerLesPakket as LPLP
            on LPLP.LeerlingId = Leerl.Id

            inner join LesPakket as LP
            on LPLP.LesPakketId = LP.Id
            
            group by Voornaam
            order by LPLP.StartDatumRijlessen asc";

        $this->db->query($sql);
        return $this->db->resultSet();
    }
}
