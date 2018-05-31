<?php
namespace OpenFixture\Entities;
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
}