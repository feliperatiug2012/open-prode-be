<?php

class GroupEntity
{
    protected $id;
    protected $title;
    protected $team_name;

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
        $this->team_name = $data['team_name'];
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

}