<?php

class TeamEntity
{
    protected $id;
    protected $title;
    protected $short_name;
    protected $games;
    protected $gf=0;
    protected $gc=0;
    protected $pj=0;
    protected $pg=0;
    protected $pp=0;
    protected $pe=0;
    protected $dg=0;
    protected $pts=0;


    /**
     * TeamEntity constructor.
     * @param array $data of the team
     */
    public function __construct(array $data)
    {
        if (isset($data['id']))
        {
            $this->id = $data['id'];
        }

        $this->title = $data['title'];
        $this->short_name = $data['short_name'];
        $this->games = [];
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @return mixed
     */
    public function getShortName()
    {
        return $this->short_name;
    }

    /**
     * @return mixed
     */
    public function getGroupName()
    {
        return $this->group_name;
    }

    /**
     * @param array $games
     */
    public function setGames($games)
    {
        $this->games = $games;
        // Falta procesar los resultados de los partidos para calcular los puntos y cantidad de goles
    }

    /*
     * Function for calculated stats of the team in the world cup
     *
     * @return $teamstats The statistics of matches
     */
    public function getStats()
    {
        $teamstats = [];
        $teamstats['flag_url'] = "http://open-fixture-be.com/public/assets/images/team-flags/".$this->short_name.".png";
        $teamstats['name'] = $this->title;
        $teamstats['pj'] = $this->pj;
        $teamstats['pg'] = $this->pg;
        $teamstats['pp'] = $this->pp;
        $teamstats['pe'] = $this->pe;
        $teamstats['gf'] = $this->gf;
        $teamstats['gc'] = $this->gc;
        $teamstats['dg'] = $this->dg;
        $teamstats['pts'] = $this->pts;

        return $teamstats;
    }
}