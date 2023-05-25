<?php

class InstructeurModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getInstructeurs()
    {
        $sql = "SELECT Id
                       ,Voornaam
                       ,Tussenvoegsel
                       ,Achternaam
                       ,Mobiel
                       ,DatumInDienst
                       ,AantalSterren
                FROM   Instructeur ORDER BY AantalSterren DESC";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getLeerlingen($Id = null)
    {
        $sql = "SELECT
            voer.Type
            ,voer.Kenteken
            ,voer.Bouwjaar
            ,voer.Brandstof
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
